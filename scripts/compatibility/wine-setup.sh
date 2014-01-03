#!/bin/sh
echo "[*] Install web server?"
mkdir -p .OS/wine
debootstrap jessie .OS/wine http://http.debian.net/debian
chroot .OS/wine
apt-get install wine playonlinux
exit
#mkdir ~/public_html
echo "[*] Web server installed."
