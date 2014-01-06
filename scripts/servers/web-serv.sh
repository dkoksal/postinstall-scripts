#!/bin/sh
echo "[*] Install web server?"
mkdir -p /home/*/.OS/lighttpd
debootstrap wheezy /home/*/.OS/lighttpd http://http.debian.net/debian
chroot /home/*/.OS/lighttpd apt-get install lighttpd php5-cgi
mkdir /home/*/public_html
cp /home/*/postinstall-scripts/scripts/servers/.public_html.sh /home/*/public_html.sh
cp /home/*/postinstall-scripts/scripts/servers/.boot_server.sh /home/*/boot_server.sh
cp /home/*/postinstall-scripts/scripts/servers/config/start /home/*/.OS/lighttpd/home/start
chroot /home/*/.OS/lighttpd/
chmod +x /home/*/.public_html.sh
chmod +x /home/*/.boot_server.sh
echo "
* * * * * 	/home/*/.public_html.sh
@reboot	 /home/*/.public_html.sh
@reboot	 /home/*/.boot_server.sh

" >> /var/spool/cron/crontabs/root
cp /home/*/postinstall-scripts/scripts/servers/config/lighttpd.conf .OS/lighttpd/etc/lighttpd.conf
echo "[*] Web server installed."
