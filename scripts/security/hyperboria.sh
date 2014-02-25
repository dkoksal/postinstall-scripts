#!/bin/sh -e
### BEGIN INIT INFO
# hyperboria.sh - An init script (/etc/init.d/) for cjdns
# Provides:          cjdroute
# Required-Start:    $remote_fs $network
# Required-Stop:     $remote_fs $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Cjdns router
# Description:       A routing engine designed for security, scalability, speed and ease of use.
# cjdns git repo:    https://github.com/cjdelisle/cjdns/blob/a7350a4d6ec064f71eeb026dd4a83b235b299512/README.md
### END INIT INFO


#### NOTES:
# This is a modified version of (https://gist.github.com/3030662).
# I fixed a bunch of errors, added some commons sense, and an uninstall function.
# Download this script, edit if necessary and save it to your computer.  
# You can run the script
# sh hyperboria.sh (start|stop|restart|status|flush|update|install|delete)
# Suggested script install:
# I recommend that you create a soft link in your /etc/init.d/ folder, for example run:
# 
# sudo ln -s /path/to/script/hyperboria.sh /etc/init.d/cjdns
# 
# Then you can run the following in terminal with one of the choices below:
# 
# sudo /etc/init.d/cjdns (start|stop|restart|status|flush|update|install|delete)
#
# Install cjdns (download hyperboria.sh) 
# Run in terminal:
# sudo ln -s /path/to/script/hyperboria.sh /etc/init.d/cjdns
# chmod +x /etc/init.d/cjdns
# sudo /etc/init.d/cjdns install
#
# Add peers when prompted (optional) and save. 
# To start cjdns:
# sudo /etc/init.d/cjdns start
####

PROG="cjdroute"
PROC="cjdns"
GIT_PATH="/opt/cjdns"
CJDNS_CONFIG="/etc/cjdroute.conf"
CJDNS_LOGFOLDER="/var/log/cjdns"			#if you are using /dev/null, dont change this to /dev/ or /dev/null
CJDNS_LOG="/var/log/cjdns/cjdns.log"				# use /dev/null here if you do not want any logs. You d not need to change $CJDNS_LOGFOLDER when using /dev/null
CJDNS_USER="root"							#see wiki about changing this user to a service user.

start() {
     # Start it up with the user cjdns
     if [ $(pidof $PROC | wc -w) != 0 ];
     then
         echo "Cjdns is already running. Doing nothing..."
     else
         echo "**Starting cjdroute"
         $GIT_PATH/$PROG < $CJDNS_CONFIG

         # Create the PID files
         FIRST_PID=`ps aux | grep cjdns | grep -v grep |awk '{print $2}' | head -1`
         SEC_PID=`ps aux | grep cjdns | grep -v grep |awk '{print $2}' | head -2 | tail -1`
         FIRST_PID_NAME=`ps aux | grep cjdns | grep -v grep |awk '{print $12}' | head -1`
         SEC_PID_NAME=`ps aux | grep cjdns | grep -v grep |awk '{print $12}' | head -2 | tail -1`

         echo $FIRST_PID > /var/run/cjdns-$FIRST_PID_NAME.pid;
         echo $SEC_PID > /var/run/cjdns-$SEC_PID_NAME.pid;

         echo "Started with PIDS $FIRST_PID and $SEC_PID"
     fi
 }

 stop() {

     if [ $(pidof $PROC | wc -w) != 2 ];
     then
         echo "Cjdns isn't running."
     else
         echo "Killing cjdns"
         kill `cat /var/run/cjdns-angel.pid`;
         kill `cat /var/run/cjdns-core.pid`;
     fi
 }

 flush() {
     if [ "$(dirname $CJDNS_LOG)" = "$CJDNS_LOGFOLDER" ]
     then
         echo
         echo "Cleaning log file, leaving last 100 rows\n"
         tail -100 $CJDNS_LOG > .tmp_cjdns_log && mv .tmp_cjdns_log $CJDNS_LOG
     else
         echo 
         echo "Your log file, $(basename $CJDNS_LOG), is not in $CJDNS_LOGFOLDER, nothing will be flushed."
         echo "If you are using /dev/null as a log file, to avoid logging, this is normal."
         echo "If you are trying to log, please check CJDNS_LOGFOLDER and CJDNS_LOGFOLDER"
         echo "in the script."
         echo
     fi
 }
 
 status() {
     if [ $(pidof $PROC | wc -w) != 0 ];
     then
         echo "* cjdns is running"
     else
         echo "* cjdns is not running"
     fi
 }
 
 
 update() {
     cd $GIT_PATH
     echo "Updating..."
     git pull
     echo "Building..." 
     ./do
     sleep 1
     
 }
 
setup() {
     echo "Create cjdns installation folder if it does not exist: $GIT_PATH."
     mkdir -p $GIT_PATH
     echo "Ensuring you have the required software: cmake make git build-essential nano"
     apt-get install -y cmake make git build-essential nano
     #If you dont want nano, you can delete "nano" above but you must then change "nano" below to your prefered text editor.
     echo "Cloning from github..."
     cd $GIT_PATH/../
     git clone https://github.com/cjdelisle/cjdns.git
     echo "doing it, compiling software..."
     cd $GIT_PATH
     ./do
 
     if [ -f $CJDNS_CONFIG ]; #check if config file already exist.
     then
	echo
        echo "Config file ($CJDNS_CONFIG) already exists." 
        echo "To generate a new config file run:" 
	echo "~:$ /opt/cjdns/cjdroute --genconf > $CJDNS_CONFIG"
	echo
     else
	echo
        echo "There is not config file ($CJDNS_CONFIG) detected. "
	echo "**Generating a config file ($CJDNS_CONFIG)..."
	echo
        build/cjdroute --genconf > $CJDNS_CONFIG
        echo
        echo "Please add some peers (optional)..."
        nano $CJDNS_CONFIG
     fi
 
     echo "Making a log dir ($CJDNS_LOGFOLDER)"
     mkdir -p $CJDNS_LOGFOLDER
     echo
     echo "You haz compiled \o/! add peers to $CJDNS_CONFIG"
     echo
 }
 
delete() {
	echo 
	echo "[**WARNING**]"
	read -p "Are you SURE your want to DELETE cjdns from this system? NOTE: this will not delete the config file($CJDNS_CONFIG): (Y|y|N|n). " choice
	case "$choice" in 
	  y|Y ) 
		echo "**Stopping cjdns..."
		stop #stop cjdns
		sleep 3
		echo
		echo "**Deleting cjdns files from your system ($GIT_PATH, $CJDNS_LOGFOLDER)  "
		sleep 2
		rm -rf $GIT_PATH $CJDNS_LOGFOLDER
		echo
		echo "Your configuration file ($CJDNS_CONFIG) still exists."
		echo "You many want to keep this for later use.  You can also"
		echo "delete the soft link if you created one i.e., /etc/init.d/cjdns."
		echo
		;;
	  n|N ) 
		echo "**Exiting uninstall of cjdns. You have done nothing :)..."
		;;
	  * ) echo "**Invalid response. You have done nothing :)..."
		;;
	esac
 
}
 
 ## Check to see if we are running as root first.
 if [ "$(id -u)" != "0" ]; then
     echo "This script must be run as root" 1>&2
     exit 1
 fi
 
 case $1 in
     start)
         flush
         sleep 2
         start
         exit 0
     ;;
     stop)
         stop
         exit 0
     ;;
     reload|restart|force-reload)
         stop
         sleep 1
         start
         exit 0
     ;;
     status)
         status
         exit 0
     ;;
     flush)
         flush
         exit 0
     ;;
     update|upgrade)
         stop
         echo "shutting down cjdns" 1>&2
         sleep 5
         update
         sleep 5
         start
         exit 0
     ;;
     install|setup)
         setup
     ;;
     delete)
         delete
     ;;
     **)
         echo "Usage: $0 (start|stop|restart|status|flush|update|install|delete)" 1>&2
         exit 1
     ;;
 esac
