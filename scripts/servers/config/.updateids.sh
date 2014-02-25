#! /bin/sh
cd /etc/suricata/
sudo wget https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz
sudo tar -xvzf emerging.rules.tar.gz
sudo ln -s /etc/suricata/rules/reference.config /etc/suricata/reference.config
sudo ln -s /etc/suricata/UbuntuPPA-configs/classification.config /etc/suricata/classification.config
sudo cp /etc/suricata/UbuntuPPA-configs/suricata-ppa-1.4-6ubuntu6.yaml /etc/suricata/suricata.yaml

