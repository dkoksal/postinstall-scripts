#!/bin/sh
$TorSuite[0] = "Tor Stuff"
$TorSuite[1] = "Install a suite of anonymizing tools via the official Tor Repositories?
	(tor tor-arm privoxy obfsproxy torchat)
	"
$TorSuite[2] = "tor tor-arm privoxy obfsproxy torchat"
INSTALL_TOR_SUITE(){
	echo "deb http://deb.torproject.org/torproject.org wheezy main" >> /etc/apt/sources.list
	echo "[*] Installing the keys...."
	gpg --keyserver keys.gnupg.net --recv 886DDD89
	gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
	echo "Ready!!"
	echo "[*] Updating Repositories...."
	sudo apt-get update
	echo "[*] installing tor project keyring"
	sudo apt-get install deb.torproject.org-keyring
	echo "[*] Installing TOR"
	sudo apt-get install tor
	echo "Ready!!"
	echo "[*] Installing TOR Terminal Monitor"
	sudo apt-get install tor-arm
	echo "Ready!!"
	echo "[*] Installing Privoxy"
	sudo apt-get install privoxy
	echo "[*] Configuring privoxy"
	echo "forward-socks5 / 127.0.0.1:9050 ." >> /etc/privoxy/config
	echo "Ready!!"
	sudo apt-get install obfsproxy
	service tor restart
	service privoxy restart
	echo "Tor torarm, and privoxy have been installed successfully."
	echo "[*] Installing TorChat"
	sudo apt-get install torchat
	echo "Torchat has been installed successfully."
}

