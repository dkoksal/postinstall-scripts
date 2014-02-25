#!/bin/sh
$GameDevelopment[0] = "GameDev"
$GameDevelopment[1] = "Install ackages related to native game development?
	(SDL, Lua, TinyXML)
	"
$GameDevelopment[2] = "libsdl1.2 libsdl1.2-dev libsdl1.2-dbg libsdl-image1.2-dev libsdl-ttf2.0-0 libsdl-ttf2.0-dev libsdl-sound1.2 libsdl-sound1.2-dev libsdl-mixer1.2 libsdl-mixer1.2-dev libsdl-net1.2 libsdl-net1.2-dev luabind* tinyxml*"
INSTALL_GAME_DEVELOPMENT_PACKAGES(){
	sudo apt-get install build-essential debhelper cdbs dh-make diffutils patch gnupg fakeroot lintian devscripts pbuilder dpatch dput quilt cgdb
	sudo apt-get install libsdl1.2 libsdl1.2-dev libsdl1.2-dbg libsdl-image1.2-dev libsdl-ttf2.0-0 libsdl-ttf2.0-dev
	sudo apt-get install libsdl-sound1.2 libsdl-sound1.2-dev libsdl-mixer1.2 libsdl-mixer1.2-dev
	sudo apt-get install libsdl-net1.2 libsdl-net1.2-dev 
	sudo apt-get install luabind*
	sudo apt-get install tinyxml*
}
