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
	mkdir .WebServ/
	cp ~/postinstall-scripts/scripts/servers/* .WebServ/*
	cd .WebServ/
	if($temp=="x86_64")
		./config64.sh	
	else
		./config86.sh	
	fi
	cd ~
	echo "[*] Generating user web page folder..."
	mkdir ~/public_html/
	if($temp=="x86_64"
		sudo mount –bind ~/public_html/ ~/.WebServ/x86_64/var/www
		sudo ln -s ~/public_html/ ~/.WebServ/x86_64/var/www/
	else
		sudo mount –bind ~/public_html/ ~/.WebServ/i386/var/www
		sudo ln -s ~/public_html/ ~/.WebServ/i386/var/www/
	fi	
	echo "[*] Re-Generating user crontab file"
	echo '#! /bin/sh
cd ~/.WebServ
t=$(gpg --decrypt ~/.ps.gpg)
echo $t | sudo -S chroot x86_64/ mount.sh 			
echo $t | sudo -S mount --bind ~/public_html/ x86_64/var/www	
echo $t | sudo -S chroot x86_64/ service lighttpd restart	
t=""
	' >> ~/.WebServ/startpws.sh
	chmod +x ~/.WebServ/startpws.sh
	crontab -l > ~/.usercron
	echo "
	@reboot	~/.WebServ/startpws.sh
	" >> ~/.usercron
	crontab -u $(whoami) ~/.usercron
	cd ~
	if($temp=="x86_64")
		sudo cp ~/postinstall-scripts/scripts/servers/config/lighttpd.conf ~/.WebServ/x86_64/lighttpd/etc/lighttpd.conf
	else
		sudo cp ~/postinstall-scripts/scripts/servers/config/lighttpd.conf ~/.WebServ/i386/lighttpd/etc/lighttpd.conf
	fi	
	echo "[*] Web server installed."
	unset $temp
}
