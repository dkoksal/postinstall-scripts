#!/bin/sh
echo "[*] Install web server?"
mkdir -p .OS/lighttpd
debootstrap wheezy .OS/lighttpd http://http.debian.net/debian
chroot .OS/lighttpd
apt-get install lighttpd php5-cgi
exit
mkdir ~/public_html
cp /home/*/postinstall-scripts/scripts/servers/.public_html.sh /home/*/public_html.sh
cp /home/*/postinstall-scripts/scripts/servers/.boot_server.sh /home/*/boot_server.sh
cp ./config/start /home/*/.OS/lighttpd/home/start
chmod +x /home/*/.public_html.sh
chmod +x /home/*/.boot_server.sh
cp /var/spool/cron/crontabs/root /var/spool/cron/crontabs/root.tmp
rm /var/spool/cron/crontabs/root
cat /var/spool/cron/crontabs/root.tmp "
* * * * * 	/home/*/.public_html.sh
@reboot	 /home/*/.public_html.sh
@reboot	 /home/*/.boot_server.sh

" > /var/spool/cron/crontabs/root
rm /var/spool/cron/crontabs/root.tmp
cp /home/*/postinstall-scripts/scripts/servers/config/lighttpd.conf .OS/lighttpd/etc/lighttpd.conf
echo "[*] Web server installed."
