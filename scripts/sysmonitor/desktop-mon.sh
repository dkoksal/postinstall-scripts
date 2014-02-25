#!/bin/sh
$EmbeddedDesktop[0] = "Embedded Desktop"
$EmbeddedDesktop[1] = "Install Embedded Desktop Details?
	(This will also install nmap, upon which the default 
	conky configuration depends)
	(conky, tilda, nmap)
	"
$EmbeddedDesktop[2] = "conky-std tilda"
INSTALL_EMBEDDED_DESKTOP_INFO(){
	echo "[*] Installing embedded desktop monitoring through Conky."
	apt-get install conky-std
	echo "[*] Installing default conky configuration..."
	cp .conkyrc ~/
	echo "[*] Conky & default configuration installed."
	echo "[*] Installing embedded desktop terminal with tilda."
	apt-get install tilda
	echo "[*] Installing default conky configuration..."
	cp ~/postinstall-scripts/scripts/sysmonitor/config/*.desktop ~/.config/autostart/*.desktop
	echo "[*] Tilda and default configuration installed."
}


