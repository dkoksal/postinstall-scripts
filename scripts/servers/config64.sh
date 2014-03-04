#! /bin/sh
sudo rm -rv x86_64
mkdir x86_64
temp=$(pwd)
sudo debootstrap --arch=amd64 wheezy x86_64 http://http.debian.net/debian
sudo cp -v mount.sh $temp/x86_64/mount.sh
sudo chroot x86_64 chmod +x mount.sh
sudo cp -v cfgmnt $temp/x86_64/home/cfgmnt
sudo chroot x86_64 chmod +x /home/cfgmnt
sudo cp -v sources.list $temp/x86_64/etc/apt/sources.list 
sudo cp -v Package.list $temp/x86_64/home/Package.list 
sudo cp -v Repo.keys $temp/x86_64/home/Repo.keys
sudo chroot x86_64 ./mount.sh
sudo rm -v x86_64/home/cfgmnt
sudo cp -v -r postinstall-scripts-req $temp/x86_64/home/postinstall-scripts-req/

