#!/bin/sh
$AppArmor[0] = "Apparmor"
$AppArmor[1] = "Install and Configure AppArmor and AppArmor Profiles?
	(autoremove autoclean)
	"
$AppArmor[2] = "apparmor apparmor-profiles apparmor-utils"
SETUP_ALL_APP_ARMOR(){
	sudo apt-get install apparmor apparmor-profiles apparmor-utils
	sudo perl -pi -e 's,GRUB_CMDLINE_LINUX="(.*)"$,GRUB_CMDLINE_LINUX="$1 apparmor=1 security=apparmor",' /etc/default/grub
	sudo update-grub
}
