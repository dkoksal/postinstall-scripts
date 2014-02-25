#! /bin/sh
$Hardener[0] = "Hardening"
$Hardener[1] = "Install kernel patches for system hardening?
	(grsecurity)
	"
$Hardener[2] = "grsecurity"
INSTALL_HARDEN_KERNEL_PATCHES(){
	echo "[*] Installing and configuring Suricata Next Generation IDS"
	sudo apt-get install linux-patch-grsecurity2 gradm2
}
