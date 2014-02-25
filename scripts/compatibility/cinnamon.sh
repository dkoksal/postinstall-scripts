#! /bin/sh
sudo echo 'deb http://packages.linuxmint.com/ debian main import backport upstream romeo' >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install linuxmint-keyring
sudo apt-get install cinnamon cinnamon-session cinnamon-settings
