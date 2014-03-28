#! /bin/sh
AntiVirus[0]="ClamAV"
AntiVirus[1]="Install antivirus to protect nearby Windows computers?
	(clamav)
	"
AntiVirus[2]="clamav"
INSTALL_HARDEN_KERNEL_PATCHES(){
	echo "[*] Installing and configuring antivirus via Clamwin"
	sudo apt-get install clamav
	crontab -l > ~/.usercron
	echo "
	@daily	 gpg --decrypt ~/.ps.gpg | sudo -S freshclam
	" >> ~/.usercron
	crontab -u $(whoami) ~/.usercron
}
