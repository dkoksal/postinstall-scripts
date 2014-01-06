#! /bin/sh
rsync -raz /home/*/public_html /home/*/.OS/lighttpd/var/www
cp -r /home/*/public_html/* /home/*/.OS/lighttpd/var/www

