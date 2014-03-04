#! /bin/sh
source .postinst.conf
PROMPT(){
	msg="
	*====================================================================*\n
	 Would you like to install the: $1 \n
	*====================================================================*\n"
	t=false
	echo -e $msg
	read -p yesno
	if [ [ "$yesno"='Y' ] -o [ "$yesno"='y' ] -o [ "$yesno"='yes' ] -o [ "$yesno"='Yes' ] -o [ "$yesno"='YES' ] ] 
	then
		$t=true
	elif [ [ "$yesno"='N' ] -o [ "$yesno"='n' ] -o [ "$yesno"='no' ] -o [ "$yesno"='No' ] -o [ "$yesno"='NO' ] ]
	then
		t=false
#			echo '#! /bin/sh
#			\$runonce=0
#			'  >> .postinst.conf
	else
		t=false
		read yesno
	fi
	unset msg
	return $t
}
INITIAL_PROMPT(){
	msg='
	*===================================================================* \n
	   This is a set of post-install scripts which are    \n
	  designed to preconfigure some useful tools related  \n
	   to content creation, Free Software, and the web    \n
	     in a way that works out of the box for all.      \n
	*===================================================================* \n
	*===================================================================* \n
	if you are reading this:  \n
	You already have a working system, these scripts are recommended,  \n
	but purely optional. They will help you with server administration, \n
	installing programming environments, configuring security and privacy \n
	software, advanced system administration software, and some software \n
	which is not yet within the Debian ecosystem. \n
	Do you wish to continue? \n
	'
	t=false
	echo -e $msg
	read -p yesno
	if [ [ "$yesno"='Y' ] -o [ "$yesno"='y' ] -o [ "$yesno"='yes' ] -o [ "$yesno"='Yes' ] -o [ "$yesno"='YES' ] ] 
	then
		$t=true
	elif [ [ "$yesno"='N' ] -o [ "$yesno"='n' ] -o [ "$yesno"='no' ] -o [ "$yesno"='No' ] -o [ "$yesno"='NO' ] ]
	then
		t=false
		echo '
		\$runonce=1
		'  >> .postinst.conf
	else
		t=false
#		read 
	fi
	return $t
}

