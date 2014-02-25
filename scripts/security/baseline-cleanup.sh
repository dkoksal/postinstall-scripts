#!/bin/sh
$FirstCleanup[0] = "Cleanup"
$FirstCleanup[1] = "Clean up unused packages??
	(autoremove autoclean)
	"
$FirstCleanup[2] = "autoremove autoclean"
CLEANUP_ALL_UNNECESSARY_APPS(){
	echo "Cleaning up all currently unused packages"
	apt-get autoremove
	apt-get autoclean
	echo "Updating package resources"
	apt-get update
	apt-get dist-upgrade
	echo "Cleanup complete."
}
