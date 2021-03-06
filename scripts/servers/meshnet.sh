$MeshRouter[0] = "Mesh Networking System"
$MeshRouter[1] = "Install cjdns decentralized internet system?
	(developer tools, cjdns)"
$MeshRouter[2] = ""
INSTALL_MESH_NETWORKING(){
	echo "[*] Installing cjdns mesh routing."
	cd ~/.WebServ/
	mkdir hypenet
	cd hypenet
	temp1=$(pwd)
	temp2="/hyperboria.sh"
	temp3=$temp1$temp2
	git clone https://gist.githubusercontent.com/clehner/4453993/raw/ef9ff88e288cb0cc0557fcd9ad3c6d7a0dd96c44/hyperboria.sh
	chmod +x $temp3
	sudo ln -s $temp3 /etc/init.d/cjdns
	sudo /etc/init.d/cjdns install
	cd hypenet
	/opt/cjdns/cjdroute --genconf > cjdroute.conf
	echo "#! /bin/sh
sudo /opg/cjdns/cjdroute < cjdroute.conf > cjdroute.log" >> startcjdns.sh
	chmod +x startcjdns.sh
#	sudo apt-get install python3-gi
#	cd cjdns-caramel/
#	sudo ln -s ./caramel.py /usr/bin/caramel.py
	echo 'nameserver fc5d:baa5:61fc:6ffd:9554:67f0:e290:7535' >> /etc/resolv.conf
	unset temp
	unset temp1
	unset temp2
	unset temp3
}
