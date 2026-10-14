#!/usr/bin/env bash
# Brings the site up to the code just pushed (post-receive runs it, as the
# osverse user): its Python packages, the database's tables, the static
# files, the league's data when players.csv, the schedule or the fitted
# parameters changed - then a restart.
set -euo pipefail

HOME_DIR=/srv/osverse
APP="$HOME_DIR/app"
VENV="$HOME_DIR/venv"
UV="$HOME_DIR/.local/bin/uv"
set -a
. /etc/osverse.env
set +a
cd "$APP/website"

[ -x "$VENV/bin/python" ] || "$UV" venv --quiet --python 3.13 "$VENV"
"$UV" pip install --quiet --python "$VENV/bin/python" -r requirements.txt
PY="$VENV/bin/python"

echo "== database"
"$PY" manage.py migrate --noinput
# Preview mode's database, when one has been built (preview.cmd), keeps up too.
if [ -f "$HOME_DIR/data/preview.sqlite3" ]; then
    "$PY" manage.py migrate --noinput --database preview
fi
"$PY" manage.py collectstatic --noinput --verbosity 0

# import_league again when the league's own files changed: new ratings mean
# new OVRs, archetypes and preseason badges, nba_careers.csv the real
# careers, and nba_vitals.csv real players' birthdates and jerseys. It leaves alone everything set on the site (rotations, overrides,
# given badges, tip-off times, seasons typed in).
STAMP="$HOME_DIR/data/.league-files"
NOW="$(for f in "$APP/players.csv" "$APP"/schedules/*.csv "$APP/ovr_params.json" "$APP/roles_params.json" \
              "$APP/nba_careers.csv" "$APP/nba_vitals.csv"; do [ ! -f "$f" ] || cat "$f"; done | sha256sum | cut -d' ' -f1)"
if [ "$(cat "$STAMP" 2>/dev/null || true)" != "$NOW" ]; then
    if "$PY" manage.py shell --verbosity 0 -c "from league.models import Season; raise SystemExit(0 if Season.current() else 1)"; then
        echo "== players.csv, the schedule or the ratings' fits changed: importing the league"
        "$PY" manage.py import_league
        echo "$NOW" > "$STAMP"
    else
        echo "== no season on the site yet - see deploy/README.md, 'Going live'"
    fi
fi

# The badges again when their counting (badge_counts.py: every kept game
# counted again, a few minutes for a full preview season) or their rules
# (league/badges.py) changed: the site's, and preview mode's, which no
# import touches.
if "$PY" manage.py shell --verbosity 0 -c "from league.models import Season; raise SystemExit(0 if Season.current() else 1)"; then
    COUNT_STAMP="$HOME_DIR/data/.badge-counting"
    COUNT_NOW="$(sha256sum "$APP/badge_counts.py" | cut -d' ' -f1)"
    if [ "$(cat "$COUNT_STAMP" 2>/dev/null || true)" != "$COUNT_NOW" ]; then
        echo "== the badges' counting changed: counting every kept game again"
        "$PY" manage.py count_badges
        if [ -f "$HOME_DIR/data/preview.sqlite3" ]; then
            "$PY" manage.py count_badges --preview
        fi
        echo "$COUNT_NOW" > "$COUNT_STAMP"
    fi
    BADGE_STAMP="$HOME_DIR/data/.badge-rules"
    BADGES_NOW="$(sha256sum "$APP/website/league/badges.py" | cut -d' ' -f1)"
    if [ "$(cat "$BADGE_STAMP" 2>/dev/null || true)" != "$BADGES_NOW" ]; then
        echo "== the badges' rules changed: working them out again"
        "$PY" manage.py refresh_badges
        if [ -f "$HOME_DIR/data/preview.sqlite3" ]; then
            "$PY" manage.py refresh_badges --preview
        fi
        echo "$BADGES_NOW" > "$BADGE_STAMP"
    fi
fi

echo "== restarting"
sudo /usr/bin/systemctl restart osverse
sleep 3
if systemctl is-active --quiet osverse; then
    echo "== live"
else
    echo "!! the site did not start - on the server: journalctl -u osverse -n 50"
    exit 1
fi
