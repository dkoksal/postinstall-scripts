#!/bin/sh
$TigerDetection[0] = "Tiger"
$TigerDetection[1] = "Install TIGER advanced system state monitor?
	(TIGER will monitor your system and log potentially 
	unathorized changes, helping you detect intrusions )
	(tiger)
	"
$TigerDetection[2] = "tiger"
INSTALL_TIGER_SYSTEM_MONITOR(){
	echo "Updating package resources"
	apt-get update
	apt-get dist-upgrade
	echo "Preparing to install Tiger intrusion detection framework"
	apt-get install tiger
	echo "Tiger setup complete"
}
