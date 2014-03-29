#!/bin/sh
$TorSuite[0] = "Tor Stuff"
$TorSuite[1] = "Install a suite of anonymizing tools via the official Tor Repositories?
	(tor tor-arm privoxy obfsproxy torchat)
	"
$TorSuite[2] = "tor tor-arm privoxy obfsproxy torchat"
INSTALL_TOR_SUITE(){
	echo "
	deb http://deb.torproject.org/torproject.org wheezy main
	deb-src http://deb.torproject.org/torproject.org wheezy main
	" >> /etc/apt/sources.list
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
	echo "[*] Installing Pidgin and Pidgin-OTR"
	sudo apt-get install pidgin-otr 
	echo "[*] Integrating Pidgin with Gnome-Keyring"
	wget https://code.google.com/p/pidgin-gnome-keyring/downloads/detail?name=pidgin-gnome-keyring_*_amd64.deb
	sudo dpkg -i pidgin-gnome-keyring_*_amd64.deb
	echo "[*] Pidgin and Pidgin-OTR are now installed. "
	echo "[*] Downloading and installing Tor Browser Bundle. In order to 
	use the TBB, you will need to navigate to your Downloads/tor-browser_en-US
	directory and launch the \"start-tor-browser script.\" Be careful to 
	keep your TBB up to date, which you can easily by running the script 
	./Downloads/.update-tor-browser.sh"
	cd Downloads
	rm -r tor-browser_en-US
	rm tor-browser-linux64*.tar.xz.asc
	rm tor-browser-linux64*.tar.xz
	torsocks wget -r -l2 --no-parent -A "_en-US.tar.xz" https://www.torproject.org/dist/torbrowser/
	torsocks wget -r -l2 --no-parent -A "_en-US.tar.xz.asc" https://www.torproject.org/dist/torbrowser/
	mv www.torproject.org/dist/torbrowser/*.*.*/tor-browser-linux64*.tar.xz.asc .
	mv www.torproject.org/dist/torbrowser/*.*.*/tor-browser-linux64*.tar.xz .
	rm -r www.torproject.org
	gpg --verify tor-browser-linux64*.tar.xz.asc
	tar -x --xz -f tor-browser-linux64-*.tar.xz
	echo "cd Downloads
	rm -r tor-browser_en-US
	rm tor-browser-linux64*.tar.xz.asc
	rm tor-browser-linux64*.tar.xz
	torsocks wget -r -l2 --no-parent -A "_en-US.tar.xz" https://www.torproject.org/dist/torbrowser/
	torsocks wget -r -l2 --no-parent -A "_en-US.tar.xz.asc" https://www.torproject.org/dist/torbrowser/
	mv www.torproject.org/dist/torbrowser/*.*.*/tor-browser-linux64*.tar.xz.asc .
	mv www.torproject.org/dist/torbrowser/*.*.*/tor-browser-linux64*.tar.xz .
	rm -r www.torproject.org
	gpg --verify tor-browser-linux64*.tar.xz.asc
	tar -x --xz -f tor-browser-linux64-*.tar.xz
	" >> .update-tor-browser.sh
	chmod +x .update-tor-browser.sh
	echo "setting up torified wget script, to use wget with Tor automatically
	you can type twget with the normal wget options"
	echo "#! /bin/sh
torsocks wget $1" >> ~/.twget
sudo ln -s ~/.twget /bin/twget
	echo "	
	Be sure to exercise personal discretion when using thse tools.
	No tool can be arelied upon to protect your identity 100%. However,
	with care, these tools can be used to communicate safely in many cases
	where that would otherwise not be possible."
}

