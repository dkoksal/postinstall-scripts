#!/bin/sh
#echo "Updating package resources"
apt-get update
#if prompt "Install Game Development packages" then
#	if prompt "Install SDL, SDL_Image, and SDL_TTF?" then
		apt-get install libsdl1.2 libsdl1.2-dev libsdl1.2-dbg libsdl-image1.2-dev libsdl-ttf2.0-0 libsdl-ttf2.0-dev
#	fi
#	if prompt "Install SDL_Sound and SDL_Mixer?" then
		apt-get install libsdl-sound1.2 libsdl-sound1.2-dev libsdl-mixer1.2 libsdl-mixer1.2-dev
#	fi
#	if prompt "Install SDL_Net?" then
		apt-get install libsdl-net1.2 libsdl-net1.2-dev 
#	fi
#	if prompt "Install Luabind?" then
		apt-get install luabind*
#	fi
#	if prompt "Install SDL_Net?" then
		apt-get install tinyxml*
#	fi	
#fi
