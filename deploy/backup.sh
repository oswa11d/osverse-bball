#!/usr/bin/env bash
# A copy of the site's database, made safely while it runs (sqlite3's
# .backup), kept 14 days in /srv/osverse/backups. The nightly timer runs it;
# deploy/README.md says how to fetch one to the PC.
set -euo pipefail
f="/srv/osverse/backups/db-$(date +%F).sqlite3"
/usr/bin/sqlite3 /srv/osverse/data/db.sqlite3 ".backup '$f'"
gzip -f "$f"
find /srv/osverse/backups -name 'db-*.sqlite3.gz' -mtime +14 -delete
