#!/bin/sh
$BrowserSecurity[0] = "Browser Security"
$BrowserSecurity[1] = "Install Additional Browser Security Software?
	(xul-ext-noscript xul-ext-requestpolicy xul-ext-firecookie xul-ext-useragentswitcher xul-ext-adblock-plus xul-ext-refcontrol xul-ext-https-everywhere xul-ext-foxyproxy-standard)
	"
$BrowserSecurity[2] = "xul-ext-noscript xul-ext-requestpolicy xul-ext-firecookie xul-ext-useragentswitcher xul-ext-adblock-plus xul-ext-refcontrol xul-ext-https-everywhere xul-ext-foxyproxy-standard"
INSTALL_BROWSER_SECURITY_PLUGINS(){
	sudo echo "
	deb http://mozilla.debian.net/ wheezy-backports iceweasel-release
	deb-src http://mozilla.debian.net/ wheezy-backports iceweasel-release
	
	deb http://ignorantguru.github.com/debian/ unstable main
	deb-src http://ignorantguru.github.com/debian/ unstable main
	" >> /etc/apt/sources.list
	sudo gpg --keyserver keys.gnupg.net --recv-keys 0x01937621 0x107165A1
	sudo bash -c 'gpg --export -a 01937621 107165A1 | apt-key add -'
	sudo apt-get update && sudo apt-get install pkg-mozilla-archive-keyring && sudo apt-get dist-upgrade
	mkdir .firefoxaddons
	cd .firefoxaddons
	wget https://addons.mozilla.org/firefox/downloads/latest/11861/addon-11861-latest.xpi
	iceweasel ~/.firefoxaddons/addon-11861-latest.xpi
	wget https://github.com/disconnectme/disconnect/raw/master/builds/disconnect.xpi 
	iceweasel ~/.firefoxaddons/disconnect.xpi
	wget https://github.com/cryptocat/cryptocat/releases/download/v2.1.20/cryptocat.firefox.xpi
	iceweasel ~/.firefoxaddons/cryptocat.firefox.xpi
	wget https://bitbucket.org/adstomper/adblockedge/downloads/adblockedge-2.1.xpi
	iceweasel ~/.firefoxaddons/adblockedge-2.1.xpi
	wget http://downloads.mozdev.org/objection/objection-0_3_5-fx.xpi
	iceweasel ~/.firefoxaddons/objection-0_3_5-fx.xpi
	wget http://ftp.gnu.org/gnu/librejs/librejs-5.4.1.xpi
	iceweasel ~/.firefoxaddons/librejs-5.4.1.xpi
	wget https://addons.mozilla.org/firefox/downloads/latest/331217/addon-331217-latest.xpi
	iceweasel ~/.firefoxaddons//addon-331217-latest.xpi
	echo "[*] Install browser security plugins for iceweasel?"
	sudo apt-get install xul-ext-noscript xul-ext-requestpolicy xul-ext-cookie-monster xul-ext-useragentswitcher xul-ext-refcontrol xul-ext-https-everywhere xul-ext-foxyproxy-standard sandfox
	sudo sandfox firefox
	echo "[*] Your browser is more secure, anyway..."
}

