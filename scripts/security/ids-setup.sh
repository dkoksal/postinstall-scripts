#! /bin/sh
$IntruderDetect[0] = "Intrusion Detection System"
$IntruderDetect[1] = "Install advanced intrusion detection tools?
	(suricata)
	"
$IntruderDetect[2] = "suricata"
INSTALL_INTRUSION_DETECTION_SYSTEM(){
	echo "[*] Installing and configuring Suricata Next Generation IDS"
	sudo apt-get install suricata oinkmaster
	echo "[*] Updating Emerging Threats Database"
	mkdir .suricata
	echo '
	#! /bin/sh
	wget https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz
	tar -xvzf emerging.rules.tar.gz
	sudo rm /etc/suricata/reference.config
	sudo rm /etc/suricata/classification.config
	sudo rm /etc/suricata/rules/
	sudo rm /etc/suricata/suricata.yaml

	sudo ln -s ~/.suricata/rules/reference.config /etc/suricata/reference.config
	sudo ln -s ~/.suricata/rules/classification.config /etc/suricata/classification.config
	sudo ln -s ~/.suricata/rules/ /etc/suricata/rules
	sudo ln -s ~/.suricata/rules/suricata.yaml /etc/suricata/suricata.yaml
	sudo oinkmaster -C /etc/oinkmaster.conf -o /etc/suricata/rules/
	' >> ~/.suricata/updateIDS.sh
	sudo echo "
	url = https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz
	" >> /etc/oinkmaster.conf
	echo "[*] Configuring Automatic Updates to the IDS"
	chmod +x ~/.suricata/updateIDS.sh
	crontab -l > ~/.usercron
	echo "
	@daily	 root ~/.suricata/updateIDS.sh
	" >> ~/.usercron
	crontab -u ~/,usercron
}
