#! /bin/sh
chroot .WebServ/i386/ mount.sh
mount –bind ~/public_html/ ~/.WebServ/i386/var/www
chroot .WebServ/i386/ service lighttpd restart
