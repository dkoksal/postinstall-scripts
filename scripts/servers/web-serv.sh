#!/bin/sh
echo "[*] Install web server?"
mkdir -p .OS/lighttpd
debootstrap wheezy .OS/lighttpd http://http.debian.net/debian
chroot .OS/lighttpd
apt-get install lighttpd php5-cgi
exit
mkdir ~/public_html
echo "[*] Web server installed."
