#!/bin/bash
# Post installation script
# This incorporates code directly from Crunchbang's cb-welcome script
# but includes pieces which are not expected to be useful in that context.
# Pieces of the code which could be considered useful to cb-welcome will be
# added to a fork later. This is intended to work on any apt-based distribution.

source prompt.sh
source scripts/security/harden-setup.sh
source scripts/sysmonitor/desktop-mon.sh
source scripts/sysmonitor/term-mon.sh
source scripts/security/iptables.sh
source scripts/security/browser-setup.sh
source scripts/security/tor-suite.sh
source scripts/security/ids-setup.sh
source scripts/servers/web-serv.sh
source scripts/servers/meshnet.sh
source scripts/development/game-dev.sh
source scripts/development/gnome-dev.sh
source scripts/security/baseline-cleanup.sh
source scripts/security/apparmor-setup.sh
source scripts/security/tiger-setup.sh
INITIAL_PROMPT
echo $t
if [ t ]
then
#	PROMPT 
	if [ [ PROMPT $Hardener[1] ] ]
	then
		INSTALL_HARDEN_KERNEL_PATCHES
	fi
	if [ PROMPT $EmbeddedDesktop[1] ]
		INSTALL_EMBEDDED_DESKTOP_INFO
	fi
	if [ PROMPT $TerminalMonitoring[1] ]
	then
		INSTALL_TERMINAL_MONITORING
	fi
	if [ PROMPT $BrowserSecurity[1] ]
	then
		INSTALL_BROWSER_SECURITY_PLUGINS
	fi
	if [ PROMPT $FireWall[1] ]
	then
		INSTALL_FIREWALL_CONFIG_TOOLS
	fi
	if [ PROMPT $TorSuite[1] ]
	then
		INSTALL_TOR_SUITE
	fi
	if [ PROMPT $IntruderDetect[1] ]
	then
		INSTALL_INTRUSION_DETECTION_SYSTEM
	fi
	if [ PROMPT $WebServer[1] ]
	then
		INSTALL_WEB_SERVER
	fi
	if [ PROMPT $MeshRouter[1] ]
	then
		INSTALL_MESH_NETWORKING
	fi
	if [ PROMPT $Gtk3Development[1] ]
	then
		INSTALL_GNOME3_DEVELOPMENT
	fi
	if [ PROMPT $GameDevelopment[1] ]
	then
		INSTALL_GAME_DEVELOPMENT_PACKAGES
	fi
	if [ PROMPT $FirstCleanup[1] ]
	then
		CLEANUP_ALL_UNNECESSARY_APPS
	fi
	if [ PROMPT $AppArmor[1] ]
	then
		SETUP_ALL_APP_ARMOR
	fi
	if [ PROMPT $TigerDetection[1] ]
	then
		INSTALL_TIGER_SYSTEM_MONITOR
	fi
fi
echo "
\$runonce=1
" >> postinst.conf
sudo reboot
