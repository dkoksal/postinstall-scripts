#!/bin/sh
echo "[*] Install embedded desktop monitoring through Conky?"
apt-get install conky-std
echo "[*] Installing default conky configuration..."
cp ./.conkyrc ~
echo "[*] Conky & default configuration installed."
echo "[*] Install embedded desktop terminal with tilda?"
apt-get install tilda
echo "[*] Installing default conky configuration..."
cp ./config_0 ~/.tilda/config-0
echo "[*] Tilda and default configuration installed."
