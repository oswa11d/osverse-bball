# The site online

The website runs on one small rented Linux server (Ubuntu 24.04 LTS or a
newer LTS). The sim
stays on the PC: games are played there, then sent up.

```
phone / browser ──https──> Caddy ──> gunicorn ──> Django (website/)
                           │ certificate, static files      │
                           └────────────────────────────────┴─ SQLite: /srv/osverse/data/db.sqlite3
PC: .\deploy (code)   python sync_site.py (games up, rotations down)   .\live <command>
```

- **Caddy** gets and renews the HTTPS certificate on its own, and serves
  `/static/`. HTTPS is also what lets phones install the site as an app.
- **gunicorn** runs the site: one process, eight threads (`osverse.service`).
- **SQLite** holds everything, kept games included (about 0.4 MB a game,
  under 1 GB a season). It is backed up every night at 4:30 AM Pacific and
  kept 14 days (`backup.sh`).
- The server installs its own security updates. Its firewall lets in only
  SSH and the web, and SSH takes keys only, no passwords.
- The secret key and the settings live in `/etc/osverse.env` on the server,
  never in git.

Cost: the server (about $5-8 a month for 2 CPUs and 2 GB or more of memory)
and the domain (about $10-15 a year).

## Files

| File | What it is |
| --- | --- |
| `setup_server.sh` | one-time setup of a fresh server, as root: packages, firewall, swap, the `osverse` user, Python, the services, Caddy |
| `post-receive` | the server's git hook: a push from the PC puts that code live |
| `update.sh` | what every deploy runs: packages, migrations, static files, `import_league` when the league's files changed, restart |
| `manage.sh` | the online `manage.py`, with its settings (what `live.cmd` runs) |
| `osverse.service` | the site, kept running by systemd |
| `Caddyfile` | HTTPS and the static files (setup fills in the domain) |
| `backup.sh`, `osverse-backup.service`, `osverse-backup.timer` | the nightly database backup |
| `osverse-notify.service`, `osverse-notify.timer` | every minute: games moved along their broadcasts, notifications sent (`send_notifications`) |

On the PC, in the project folder: `deploy.cmd`, `live.cmd`, `sync_site.py`.
The SSH key is `%USERPROFILE%\.ssh\osverse`, and `%USERPROFILE%\.ssh\config`
names the server `osverse` (as the site's user) and `osverse-root`.

## Setting it up (once)

**The user:**
1. **Buy the domain** at a registrar (Cloudflare or Porkbun, say).
2. **Create the server** at the host (Hetzner Cloud, DigitalOcean, ...):
   Ubuntu 24.04 LTS or newer (an LTS), any location - Europe is fine, a
   page takes about a sixth of a second longer to reach the US - 2 CPUs and
   at least 2 GB of memory, with a public IPv4 address. Under SSH keys, paste the one line from
   `%USERPROFILE%\.ssh\osverse.pub`.
3. **Point the domain at it**: in the registrar's DNS settings, an `A` record
   for `@` and another for `www`, both to the server's IPv4 address.

**Then, from the PC** (Claude does these):
1. Add `osverse` and `osverse-root` to `%USERPROFILE%\.ssh\config`, with the
   server's address and the key.
2. `scp -r deploy osverse-root:/root/`, then
   `ssh osverse-root "bash /root/deploy/setup_server.sh DOMAIN"`.
3. `git remote add live osverse:/srv/osverse/repo.git`, then `.\deploy`.

## Going live

The first deploy starts an empty site. To start from the one on the PC
(accounts, rotations and presets, chemistry, rivalries, injuries, articles,
OVR and archetype overrides, badges given):

```
ssh osverse-root "systemctl stop osverse && rm -f /srv/osverse/data/db.sqlite3-wal /srv/osverse/data/db.sqlite3-shm"
scp website\db.sqlite3 osverse:/srv/osverse/data/db.sqlite3
ssh osverse-root "systemctl start osverse"
.\live migrate
```

(The `-wal` and `-shm` files belong to the database being replaced; left
beside the new one, they would be read into it.)

Then take the sample games off and put the real season on its calendar:

```
.\live clear_results
.\live import_league --start 2026-10-20 --reslate
```

## Every day

- **Changed code, ratings or the schedule:** commit, then `.\deploy`. Its
  output shows the server bringing the site up to it. When `players.csv`,
  the schedule or the fitted parameters changed, `import_league` runs on its
  own.
- **Playing games:** `python sync_site.py` before playing brings the site's
  rotations and injury edits down into `site_data.csv`. Run it again after
  `keep` to send the kept games up; they air at their slated tip-offs. The
  Manage page's upload and `site_data.csv` download still work too.
- **Any other manage.py command, online:** `.\live <command>`, as
  `.\site <command>` is locally.

## Backups

The last 14 nights are in `/srv/osverse/backups`. To fetch the newest to
the PC:

```
ssh osverse "ls -t /srv/osverse/backups"
scp osverse:/srv/osverse/backups/db-2026-10-20.sqlite3.gz .
```

To restore one, stop the site, delete the `-wal` and `-shm` files, unzip
the backup over `/srv/osverse/data/db.sqlite3` and start the site again, as
in *Going live*.

## When something is wrong

- `ssh osverse-root "journalctl -u osverse -n 50"`: the site's own log.
- `ssh osverse-root "journalctl -u caddy -n 50"`: certificates and the proxy.
- `ssh osverse-root "systemctl restart osverse"`: restart the site.
- `.\live check --deploy`: Django's checks with the online settings.
- `ssh osverse-root "journalctl -u osverse-notify -n 20"`: the notifications' last runs.
