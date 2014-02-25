#!/bin/sh
$WebServer[0] = "Web Server"
$WebServer[1] = "Configure User Web Server? This will set up a web server
	in a sandboxed environment underneath your username, as well as
	scripts to automatically configure it. Your personal web site is 
	located at /home/USER/public_html/ and will be available instantly.
	(container lighttpd, php, and SQLite)
	"
$WebServer[2] = "lighttpd php5-cgi sqlite php5-sqlite"
INSTALL_WEB_SERVER(){
	$temp = $(uname -m)
	echo "[*] Installing web server."
	echo "[*] Generating sandbox environment..."
	cp ../remastery/* ~/,WebServ/*
	cd .WebServ/
	if($temp=="x86_64")
		./config64.sh	
	else
		./config86.sh	
	fi
	cd ~
	echo "[*] Generating user web page folder..."
	mkdir ~/public_html/
	if($temp=="x86_64")
		mount –bind ~/public_html/ ~/.WebServ/x86_64/var/www
		sudo ln -s ~/public_html/ ~/,WebServ/x86_64/var/www/
	else
		mount –bind ~/public_html/ ~/.WebServ/i386/var/www
		sudo ln -s ~/public_html/ ~/,WebServ/i386/var/www/
	fi	
	echo "[*] Re-Generating user crontab file"
	cp ~/postinstall-scripts/scripts/servers/.startpws.sh ~/.startpws.sh
	chmod +x ~/.startpws.sh
	crontab -l > ~/.usercron
	echo "
	@reboot	 root ~/.startpws.sh
	" >> ~/.usercron
	crontab -u ~/,usercron
	cd ~
	if($temp=="x86_64")
		cp ~/postinstall-scripts/scripts/servers/config/lighttpd.conf ~/.WebServ/x86_64/lighttpd/etc/lighttpd.conf
	else
		cp ~/postinstall-scripts/scripts/servers/config/lighttpd.conf ~/.WebServ/i386/lighttpd/etc/lighttpd.conf
	fi	
	echo "[*] Web server installed."
}
