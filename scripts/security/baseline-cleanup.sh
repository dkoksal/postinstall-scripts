#!/bin/sh
if prompt "Clean up unused packages?" then
	echo "Cleaning up all currently unused packages"
	apt-get autoremove
	apt-get autoclean
	echo "Updating package resources"
	apt-get update
	apt-get dist-upgrade
	clear scr
	echo "Cleanup complete."
fi
