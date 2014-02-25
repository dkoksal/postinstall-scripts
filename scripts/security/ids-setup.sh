$IntruderDetect[0] = "Intrusion Detection System"
$IntruderDetect[1] = "Install advanced intrusion detection tools?
	(suricata)
	"
$IntruderDetect[2] = "suricata"
INSTALL_INTRUSION_DETECTION_SYSTEM(){
	echo "[*] Installing and configuring Suricata Next Generation IDS"
	sudo apt-get install suricata oinkmaster
	echo "[*] Updating Emerging Threats Database"
	cd /etc/suricata/
	sudo wget https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz
	sudo tar -xvzf emerging.rules.tar.gz
	sudo ln -s /etc/suricata/rules/reference.config /etc/suricata/reference.config
	sudo ln -s /etc/suricata/UbuntuPPA-configs/classification.config /etc/suricata/classification.config
	sudo cp /etc/suricata/UbuntuPPA-configs/suricata-ppa-1.4-6ubuntu6.yaml /etc/suricata/suricata.yaml
	echo "
	url = https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz
	" >> /etc/oinkmaster.conf
	sudo oinkmaster -C /etc/oinkmaster.conf -o /etc/suricata/rules
	echo "[*] Configuring Automatic Updates to the IDS"
	cp ~/postinstall-scripts/scripts/servers/.updateids.sh ~/.updateids.sh
	chmod +x ~/.updateids.sh
	crontab -l > ~/.usercron
	echo "
	@daily	 root ~/.updateids.sh
	" >> ~/.usercron
	crontab -u ~/,usercron
}
