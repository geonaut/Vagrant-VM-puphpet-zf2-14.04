#!/bin/bash
# Update & Upgrade
echo 'updating OS'
sudo apt-get update -y
echo 'upgrading OS'
sudo apt-get upgrade -y
echo 'updating Gems'
sudo gem update

#Install Guest Additions
echo 'installing guest additions'
sudo apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-iso

#INSTALLING GUI

read -p "Do you want to install a GUI for this VM?: (y/n)" RESPONSE

if [ "$RESPONSE" = y ] ; then
   	echo "Installing GUI"
   	sudo apt-get install xfce4 --yes
   	sudo sed -i s/"allowed_users=anybody"/"allowed_users=anybody"/g /etc/X11/Xwrapper.config
	sudo VBoxClient-all
	sudo apt-get install firefox --yes
	echo "Reboot to use desktop"
elif [ "$RESPONSE" = n ] ; then
   echo "Skipping GUI installation"
else
   echo "You did not make a valid selection!"
fi