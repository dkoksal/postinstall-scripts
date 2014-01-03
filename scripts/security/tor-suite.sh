#!/bin/sh
#if prompt "Install and configure tor browser suite?" then
#	if prompt "Use tor project debian repository?" then
		echo "deb http://deb.torproject.org/torproject.org wheezy main" >> /etc/apt/sources.list
		echo "[*] Installing the keys...."
		gpg --keyserver keys.gnupg.net --recv 886DDD89
		gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
		echo "Ready!!"
		echo "[*] Updating Repositories...."
		apt-get update
		echo "[*] installing tor project keyring"
		apt-get install deb.torproject.org-keyring
		clear scr
#	fi
#	if prompt "Install TOR suite?" then
		echo "[*] Installing TOR"
		apt-get install tor
		echo "Ready!!"
		echo "[*] Installing TOR Terminal Monitor"
		apt-get install tor-arm
		echo "Ready!!"
		echo "[*] Installing Privoxy"
		apt-get install privoxy
		echo "[*] Configuring privoxy"
		echo "forward-socks5 / 127.0.0.1:9050 ." >> /etc/privoxy/config
		echo "Ready!!"
		service tor restart
		service privoxy restart
		clear scr
		echo "Tor torarm, and privoxy have been installed successfully."
#	fi
#	if prompt "Install TorChat" then
		echo "[*] Installing TorChat"
                sudo apt-get install torchat
		clear scr
		echo "Torchat has been installed successfully."
#	fi
#fi
