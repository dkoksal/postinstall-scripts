#!/bin/sh
$TerminalMonitoring[0] = "Embedded Desktop"
$TerminalMonitoring[1] = "Install Embedded Desktop Details?
	(tilda nmap htop ntop usbview)
	"
$TerminalMonitoring[2] = "tilda nmap htop ntop usbview"
INSTALL_TERMINAL_MONITORING(){
	echo "[*] Install embedded terminal with tilda?"
	sudo apt-get install tilda
	cp ./config/config_0 ~/.tilda/config-0
	echo "[*] Install terminal monitoring tools(htop and ntop)?"
	sudo apt-get install htop ntop
	echo "[*] installed htop and ntop."
	echo "[*] Install terminal network mapping tools?"
	echo "[*] installed nmap."
	echo "[*] Install USB monitor"
	sudo apt-get install usbview
	echo "[*] installed usbview"
}
