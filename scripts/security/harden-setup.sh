#! /bin/sh
Hardener[0]="Hardening"
Hardener[1]="Install kernel patches for system hardening?
	(grsecurity)
	"
Hardener[2]="grsecurity"
INSTALL_HARDEN_KERNEL_PATCHES(){
	echo "[*] Installing and configuring security patches for Linux"
	sudo apt-get install linux-patch-grsecurity2 gradm2
	echo "[*] downloading vanilla kernel sources"
	wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.13.5.tar.gz
	wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.13.5.tar.sign
	gunzip -c linux-3.13.5.tar.gz | gpg --verify linux-3.13.5.tar.sign -
	echo "[*] "
	tar xzf linux-3.13.5.tar.gz
	cd linux-3.13.5
	echo "[*] copying configuration file "
	cp /boot/config-3.2.0-4-amd64 ./.config
	echo "[*] copying grsecurity kernel patches"
	wget https://grsecurity.net/stable/grsecurity-3.0-3.2.55-201403041936.patch
	patch grsecurity-3.0-3.2.55-201403041936.patch
	make menuconfig
	
}
