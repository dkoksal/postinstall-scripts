#!/bin/sh
#if prompt "install Tiger intrusion detection suite?" then
	echo "Updating package resources"
	apt-get update
	apt-get dist-upgrade
	echo "Preparing to install Tiger intrusion detection framework"
	apt-get install tiger
	clear scr
	echo "Tiger setup complete"
#fi
