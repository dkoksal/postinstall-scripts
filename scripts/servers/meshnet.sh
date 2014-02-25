$MeshRouter[0] = "Mesh Networking System"
$MeshRouter[1] = "Install cjdns decentralized internet system?
	(developer tools, cjdns)"
$MeshRouter[2] = ""
INSTALL_MESH_NETWORKING(){
	cd ~
	mkdir .hype
	temp1=$(pwd)
	temp2="/hyperboria.sh"
	temp3=$temp1$temp2
	git clone https://gist.githubusercontent.com/clehner/4453993/raw/ef9ff88e288cb0cc0557fcd9ad3c6d7a0dd96c44/hyperboria.sh .hype/
	cd .hype/
	chmod +x $temp3
	sudo ln -s $temp3 /etc/init.d/cjdns
	sudo /etc/init.d/cjdns install
	unset temp
	unset temp1
	unset temp2
	unset temp3
}
