#!/bin/sh
echo "Updating package resources"
apt-get update
#if prompt "Install packaging tools?" then
	apt-get install build-essential debhelper cdbs dh-make diffutils patch gnupg fakeroot lintian devscripts pbuilder dpatch dput quilt cgdb
	clear scr
#fi
#if prompt "Install packaging tools?" then
	sudo apt-get install valac
	clear scr
#fi
#if prompt "Install packaging tools?" then
	sudo apt-get install anjuta
	clear scr
#fi

