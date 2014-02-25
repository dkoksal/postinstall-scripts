#!/bin/sh
$FirstCleanup[0] = "Cleanup"
$FirstCleanup[1] = "Clean up unused packages??
	(autoremove autoclean)
	"
$FirstCleanup[2] = "autoremove autoclean"
CLEANUP_ALL_UNNECESSARY_APPS(){
	echo "Setting up User Cron File"
	crontab -l > ~/.usercron
#	echo "
#	
#	" >> ~/,usercron
	crontab -u ~/.usercron
	echo "Cleaning up all currently unused packages"
	sudo apt-get autoremove
	sudo apt-get autoclean
	echo "Updating package resources"
	sudo apt-get update
	sudo apt-get dist-upgrade
	echo "Cleanup complete."
}
