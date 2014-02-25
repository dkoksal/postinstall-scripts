#! /bin/sh
source .postinst.conf
PROMPT(){
	echo("
	*=====================================================*
	Would you like to install the: ")
	echo($1)
	echo(	"*=====================================================*")
	$t=-1
	read response
	while($t==-1)
		if("$response"=="Y"||"$response"=="y"||"$response"=="yes"||"$response"=="Yes"||"$response"=="YES")
			$t=1
		elif("$response"=="N"||"$response"=="n"||"$response"=="no"||"$response"=="No"||"$response"=="NO")
			$t=0
#			echo("#! /bin/sh
#			\$runonce=0
#			") >> .postinst.conf
		else
			$t=-1
			read response
		fi
	done
	return $t
}
INITIAL_PROMPT(){
	echo("
	*=====================================================*
	*   This is a set of post-install scripts which are   *
	*  designed to preconfigure some useful tools related *
	*   to content creation, Free Software, and the web   *
	*     in a way that works out of the box for all.     *
	*=====================================================*
	*=====================================================*
	")
	echo("
	if you are reading this:
	You already have a working system, these scripts are recommended, 
	but purely optional. They will help you with server administration,
	installing programming environments, configuring security and privacy
	software, advanced system administration software, and some software
	which is not yet within the Debian ecosystem.
	Do you wish to continue?
	")
	$t=-1
	read response
	while($t==-1)
		if("$response"=="Y"||"$response"=="y"||"$response"=="yes"||"$response"=="Yes"||"$response"=="YES")
			$t=1
		elif("$response"=="N"||"$response"=="n"||"$response"=="no"||"$response"=="No"||"$response"=="NO")
			$t=0
			echo("
			\$runonce=0
			") >> .postinst.conf
		else
			$t=-1
			read response
		fi
	done
	return $t
}
