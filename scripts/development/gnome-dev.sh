#!/bin/sh
$Gtk3Development[0] = "Gnome3Dev"
$Gtk3Development[1] = "Install ackages related to Gnome Application development?
	()
	"
$Gtk3Development[2] = "build-essential debhelper cdbs dh-make diffutils patch gnupg fakeroot lintian devscripts pbuilder dpatch dput quilt cgdb valac anjuta"
INSTALL_GNOME3_DEVELOPMENT(){
echo "Updating package resources"
	sudo apt-get update
	sudo apt-get install build-essential debhelper cdbs dh-make diffutils patch gnupg fakeroot lintian devscripts pbuilder dpatch dput quilt cgdb
	sudo apt-get install valac
	sudo apt-get install anjuta
}
