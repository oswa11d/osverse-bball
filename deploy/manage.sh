#!/usr/bin/env bash
# The online site's manage.py, with its settings: live.cmd on the PC runs
# this over SSH, the way site.cmd runs the local one (".\live import_games").
set -euo pipefail
set -a
. /etc/osverse.env
set +a
cd /srv/osverse/app/website
exec /srv/osverse/venv/bin/python manage.py "$@"
