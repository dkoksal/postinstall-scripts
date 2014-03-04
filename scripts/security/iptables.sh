#!/bin/sh
$FireWall[0] = "Firewall"
$FireWall[1] = "Install and configure Firewall tools?
	(firestarter)
	"
$FireWall[2] = "firestarter"
INSTALL_FIREWALL_CONFIG_TOOLS(){
	echo "[*] Install firewall?"
	sudo apt-get install ferm
	echo '
	# ferm firewall rules
	# http://ferm.foo-projects.org
	table filter {
	    chain INPUT {
		policy DROP;
			# connection tracking
			mod state state INVALID DROP;
			mod state state (ESTABLISHED RELATED) ACCEPT;

			# allow local connections
			interface lo ACCEPT;

			# allow SSH connections
			proto tcp dport ssh ACCEPT;

			# ident connections are also allowed
			proto tcp dport auth ACCEPT;
		
			# uncomment the following line to run an HTTPS service
			# proto tcp dport https ACCEPT;

			# the rest is dropped by the above policy
	    }
	    # outgoing connections are not limited
	    chain OUTPUT policy ACCEPT;
	}
	# established/related connections
	domain (ip ip6) table filter chain (INPUT OUTPUT) mod state state (ESTABLISHED RELATED) ACCEPT;
	# allow no more than 3 ssh attempts from a source ip in 5 minutes
	domain (ip ip6) table filter chain INPUT {
		protocol tcp dport ssh @subchain {
		    mod recent name SSH {
		    set NOP;
		    	update seconds 300 hitcount 3 @subchain {
			    LOG log-prefix "Blocked-ssh: " log-level warning;
			    DROP;
		    	}
		    }
		ACCEPT;
		}
	}
	# FORWARD chain REJECT
	domain (ip ip6) table filter chain FORWARD REJECT;
	# log all other INPUT
	domain (ip ip6) table filter chain INPUT {
	    mod limit limit 3/min limit-burst 10 LOG log-prefix "INPUT-rejected: " log-level debug;
	    REJECT;
	}
	' >> ~/,ferm.conf
	sudo ferm ~/.ferm.conf
	echo "[*] firestarter installed and initial configuration generated"
}
