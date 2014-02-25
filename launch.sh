#!/bin/bash
# Post installation script
# This incorporates code directly from Crunchbang's cb-welcome script
# but includes pieces which are not expected to be useful in that context.
# Pieces of the code which could be considered useful to cb-welcome will be
# added to a fork later. This is intended to work on any apt-based distribution.

source prompt.sh
source scripts/sysmonitor/desktop-mon.sh
source scripts/sysmonitor/term-mon.sh
source scripts/security/browser-setup.sh
source scripts/security/iptables.sh
source scripts/security/tor-suite.sh
source scripts/security/snort-setup.sh
source scripts/security/baseline-cleanup.sh
source scripts/security/tiger-setup.sh

if(INITIAL_PROMPT())
	if(PROMPT($EmbeddedDesktop[1]))
		INSTALL_EMBEDDED_DESKTOP_INFO()
	fi
	if(PROMPT($TerminalMonitoring[1]))
		INSTALL_TERMINAL_MONITORING()
	fi
	if(PROMPT($BrowserSecurity[1]))
		INSTALL_BROWSER_SECURITY_PLUGINS()
	fi
	if(PROMPT($FireWall[1]))
		INSTALL_FIREWALL_CONFIG_TOOLS()
	fi
	if(PROMPT($TorSuite[1]))
		INSTALL_TOR_SUITE()
	fi
	#snort
	if(PROMPT($FirstCleanup[1]))
		CLEANUP_ALL_UNNECESSARY_APPS()
	fi
	if(PROMPT($TigerDetection[1]))
		INSTALL_TIGER_SYSTEM_MONITOR()
	fi
fi

exit 0
