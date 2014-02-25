#!/bin/sh
$FireWall[0] = "Firewall"
$FireWall[1] = "Install and configure Firewall tools?
	(firestarter)
	"
$FireWall[2] = "firestarter"
INSTALL_FIREWALL_CONFIG_TOOLS(){
	echo "[*] Install firewall?"
	apt-get install firestarter
	sudo firestarter
	echo "[*] firestarter installed and initial configuration generated"
}
