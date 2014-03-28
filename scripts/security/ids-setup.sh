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
	echo '#! /bin/sh
wget https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz
tar -xvzf emerging.rules.tar.gz
t=$(gpg --decrypt ~/.ps.gpg)
$t | sudo -S rm /etc/suricata/reference.config
$t | sudo -S rm /etc/suricata/classification.config
$t | sudo -S rm /etc/suricata/rules/
$t | sudo -S rm /etc/suricata/suricata.yaml

$t | sudo -S ln -s ~/.suricata/rules/reference.config /etc/suricata/reference.config
$t | sudo -S ln -s ~/.suricata/rules/classification.config /etc/suricata/classification.config
$t | sudo -S ln -s ~/.suricata/rules/ /etc/suricata/rules
$t | sudo -S ln -s ~/.suricata/rules/suricata.yaml /etc/suricata/suricata.yaml
$t | sudo -S oinkmaster -C /etc/oinkmaster.conf -o /etc/suricata/rules/
$t = ""
	' >> ~/.suricata/updateIDS.sh
	sudo echo "
	url = https://rules.emergingthreatspro.com/open/suricata/emerging.rules.tar.gz
	" >> /etc/oinkmaster.conf
	echo "[*] Configuring Automatic Updates to the IDS"
	chmod +x ~/.suricata/updateIDS.sh
	crontab -l > ~/.usercron
	echo "
	@reboot	~/.suricata/updateIDS.sh
	" >> ~/.usercron
	crontab -u $(whoami) ~/.usercron
}
