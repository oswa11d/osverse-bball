#!/usr/bin/env bash
# One-time setup of a fresh Ubuntu server (24.04 LTS or a newer LTS) for the
# Osverse website.
# deploy/README.md has the steps around it; from the PC it runs as
#
#     scp -r deploy osverse-root:/root/
#     ssh osverse-root "bash /root/deploy/setup_server.sh osverse.com"
#
# It is safe to run again (after changing this folder, say): it only adds
# what is missing and rewrites the config files.
set -euo pipefail

DOMAIN="${1:?give the domain, e.g. bash setup_server.sh osverse.com}"
HERE="$(cd "$(dirname "$0")" && pwd)"
cd /  # the osverse user's commands below must not start in root's folder
HOME_DIR=/srv/osverse
export DEBIAN_FRONTEND=noninteractive

echo "== packages"
apt-get update -q
apt-get upgrade -yq
apt-get install -yq git sqlite3 ufw unattended-upgrades caddy curl

echo "== 2 GB of swap: room for the late-season stat rebuilds on a small server"
if [ ! -f /swapfile ]; then
    fallocate -l 2G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    echo '/swapfile none swap sw 0 0' >> /etc/fstab
fi

echo "== security updates install themselves; firewall lets in SSH and the web only"
dpkg-reconfigure -f noninteractive unattended-upgrades
ufw allow OpenSSH
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable

echo "== SSH: keys only, no passwords"
printf 'PasswordAuthentication no\nKbdInteractiveAuthentication no\nPermitRootLogin prohibit-password\n' \
    > /etc/ssh/sshd_config.d/10-osverse.conf
systemctl try-reload-or-restart ssh

echo "== the osverse user, who owns and runs the site"
id osverse >/dev/null 2>&1 || useradd --system --create-home --home-dir "$HOME_DIR" --shell /bin/bash osverse
install -d -o osverse -g osverse -m 700 "$HOME_DIR/.ssh"
install -o osverse -g osverse -m 600 /root/.ssh/authorized_keys "$HOME_DIR/.ssh/authorized_keys"
install -d -o osverse -g osverse "$HOME_DIR/app" "$HOME_DIR/data" "$HOME_DIR/static" "$HOME_DIR/backups"
# Caddy (its own user) passes through to static/ and sees nothing else; the
# database and its backups hold password hashes, for the site's eyes only.
chmod 711 "$HOME_DIR"
chmod 700 "$HOME_DIR/data" "$HOME_DIR/backups"

echo "== Python 3.13 (through uv) and the repository the PC pushes to"
if [ ! -x "$HOME_DIR/.local/bin/uv" ]; then
    sudo -u osverse -H bash -c 'curl -LsSf https://astral.sh/uv/install.sh | sh'
fi
sudo -u osverse -H bash -c "cd $HOME_DIR && $HOME_DIR/.local/bin/uv python install 3.13"
if [ ! -d "$HOME_DIR/repo.git" ]; then
    sudo -u osverse git init --quiet --bare --initial-branch=main "$HOME_DIR/repo.git"
fi
install -o osverse -g osverse -m 755 "$HERE/post-receive" "$HOME_DIR/repo.git/hooks/post-receive"

echo "== settings and the secret key (kept on the server, never in git)"
if [ ! -f /etc/osverse.env ]; then
    KEY="$(head -c 48 /dev/urandom | base64 | tr -d '/+=\n')"
    cat > /etc/osverse.env <<EOF
OSVERSE_DEBUG=0
OSVERSE_SECRET_KEY=$KEY
OSVERSE_HOSTS=$DOMAIN,www.$DOMAIN
OSVERSE_DB=$HOME_DIR/data/db.sqlite3
OSVERSE_SIM_DATA_FILE=$HOME_DIR/data/site_data.csv
OSVERSE_STATIC_ROOT=$HOME_DIR/static
OSVERSE_VAPID_FILE=$HOME_DIR/data/vapid.json
OSVERSE_SITE_URL=https://$DOMAIN
EOF
fi
grep -q '^OSVERSE_VAPID_FILE=' /etc/osverse.env || echo "OSVERSE_VAPID_FILE=$HOME_DIR/data/vapid.json" >> /etc/osverse.env
grep -q '^OSVERSE_SITE_URL=' /etc/osverse.env || echo "OSVERSE_SITE_URL=https://$DOMAIN" >> /etc/osverse.env
sed -i "s|^OSVERSE_SITE_URL=.*|OSVERSE_SITE_URL=https://$DOMAIN|" /etc/osverse.env
sed -i "s/^OSVERSE_HOSTS=.*/OSVERSE_HOSTS=$DOMAIN,www.$DOMAIN/" /etc/osverse.env
chown root:osverse /etc/osverse.env
chmod 640 /etc/osverse.env

echo "== the site's service, the nightly backup, the notifications, and leave to restart the site"
install -m 644 "$HERE/osverse.service" /etc/systemd/system/osverse.service
install -m 644 "$HERE/osverse-backup.service" /etc/systemd/system/osverse-backup.service
install -m 644 "$HERE/osverse-backup.timer" /etc/systemd/system/osverse-backup.timer
install -m 644 "$HERE/osverse-notify.service" /etc/systemd/system/osverse-notify.service
install -m 644 "$HERE/osverse-notify.timer" /etc/systemd/system/osverse-notify.timer
echo 'osverse ALL=(root) NOPASSWD: /usr/bin/systemctl restart osverse' \
    > /etc/sudoers.d/osverse
chmod 440 /etc/sudoers.d/osverse
visudo -cf /etc/sudoers.d/osverse
systemctl daemon-reload
systemctl enable osverse.service osverse-backup.timer osverse-notify.timer
systemctl start osverse-backup.timer osverse-notify.timer

echo "== Caddy: HTTPS for $DOMAIN, the static files, everything else to the site"
sed "s/{DOMAIN}/$DOMAIN/g" "$HERE/Caddyfile" > /etc/caddy/Caddyfile
caddy validate --config /etc/caddy/Caddyfile --adapter caddyfile
systemctl reload caddy || systemctl restart caddy

echo
echo "Done. Next, from the PC: deploy.cmd (the first push puts the site up)."
