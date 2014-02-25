#! /bin/bash
$HiddenService[0] = "Cleanup"
$HiddenService[1] = "Clean up unused packages??
	(autoremove autoclean)
	"
$HiddenService[2] = "autoremove autoclean"
INSTALL_HIDDEN_SERVICES(){
echo "Configure personal web page as a hidden service?"
}
