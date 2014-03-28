#! /bin/sh

echo "[*] Installing and configuring security patches for Linux"
sudo apt-get install linux-patch-grsecurity2 gradm2
rm linux-3.13.5.tar*
rm grsecurity-3.0-3.2.55-201403041936.patch*
rm -r linux-3.13.5
echo "[*] downloading vanilla kernel sources"
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.13.5.tar.gz
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.13.5.tar.sign
gunzip -c linux-3.13.5.tar.gz | gpg --verify linux-3.13.5.tar.sign -
tar xzf linux-3.13.5.tar.gz
echo "[*] copying grsecurity kernel patches"
wget https://grsecurity.net/stable/grsecurity-3.0-3.2.55-201403041936.patch
cd linux-3.13.5
echo "[*] copying configuration file "
cp /boot/config-3.2.0-4-amd64 ./.config
patch -p1 < ../grsecurity-3.0-3.2.55-201403041936.patch
make menuconfig
echo "[*] "
