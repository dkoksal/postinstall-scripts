#!/bin/sh
echo "[*] Install firewall?"
apt-get install ipkungfu
echo "[*] copying default ipkungfu configuration"
cp /home/*/postinstall-scripts/scripts/security/config/ipkungfu.conf /etc/ipkungfu/ipkungfu.conf
echo "[*] ipkongfu installed"
