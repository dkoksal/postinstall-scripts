#! /bin/sh
sudo rm -rv i386
mkdir i386
temp=$(pwd)
sudo debootstrap --arch=amd64 wheezy i386 http://http.debian.net/debian
sudo cp -v mount.sh $temp/i386/mount.sh
sudo chroot i386 chmod +x mount.sh
sudo cp -v cfgmnt $temp/i386/home/cfgmnt
sudo chroot i386 chmod +x /home/cfgmnt
sudo cp -v sources.list $temp/i386/etc/apt/sources.list 
sudo cp -v Package.list $temp/i386/home/Package.list 
sudo cp -v Repo.keys $temp/i386/home/Repo.keys
sudo chroot i386 ./mount.sh
sudo rm -v i386/home/cfgmnt
sudo cp -v -r postinstall-scripts-req $temp/i386/home/postinstall-scripts-req/

