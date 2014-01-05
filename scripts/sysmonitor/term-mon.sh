#!/bin/sh
echo "[*] Install embedded terminal with tilda?"
apt-get install tilda
cp ./config/config_0 ~/.tilda/config-0
echo "[*] Install terminal monitoring tools(htop and ntop)?"
apt-get install htop ntop
echo "[*] installed htop and ntop."
echo "[*] Install terminal network mapping tools?"
apt-get install nmap
echo "[*] installed nmap."
echo "[*] Install USB monitor"
apt-get install usbview
echo "[*] installed usbview"
