#! /bin/sh
sudo dpkg --get-selections > ~/.OS/Package.list
cp /etc/apt/sources.list ~/.OS/sources.list
sudo apt-key exportall > ~/.OS/Repo.keys
