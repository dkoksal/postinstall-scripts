#! /bin/sh
rsync -raz public_html .OS/lighttpd/var/www
cp -r public_html/* .OS/lighttpd/var/www

