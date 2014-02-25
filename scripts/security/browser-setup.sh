#!/bin/sh
$BrowserSecurity[0] = "Browser Security"
$BrowserSecurity[1] = "Install Additional Browser Security Software?
	(xul-ext-noscript xul-ext-requestpolicy xul-ext-firecookie xul-ext-useragentswitcher xul-ext-adblock-plus xul-ext-refcontrol xul-ext-https-everywhere xul-ext-foxyproxy-standard)
	"
$BrowserSecurity[2] = "xul-ext-noscript xul-ext-requestpolicy xul-ext-firecookie xul-ext-useragentswitcher xul-ext-adblock-plus xul-ext-refcontrol xul-ext-https-everywhere xul-ext-foxyproxy-standard"
INSTALL_BROWSER_SECURITY_PLUGINS(){
	sudo apt-get update && sudo apt-get dist-upgrade
	echo "[*] Install browser security plugins for iceweasel?"
	sudo apt-get install xul-ext-noscript xul-ext-requestpolicy xul-ext-cookie-monster xul-ext-useragentswitcher xul-ext-adblock-plus xul-ext-refcontrol xul-ext-https-everywhere xul-ext-foxyproxy-standard
	echo "[*] Your browser is more secure, anyway..."
}

