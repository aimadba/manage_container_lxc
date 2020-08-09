#!/bin/bash


echo "--------lxc -------------------------------"
sudo apt-get --purge remove lxc -y
if [ $? -ne 0 ]
then 
	echo "la desinstallation de 'lxc' a echoue"
fi
echo "-------------------------------------------"


echo "----------lxctl-------------------------" 
sudo apt-get --purge remove lxctl -y
if [ $? -ne 0 ]
then 
	echo "la desinstallation de 'lxctl' a echoue"
fi
echo "-------------------------------------------"


echo "----------openvswitch-common---------------" 

sudo apt-get --purge remove openvswitch-common -y
if [ $? -ne 0 ]
then 
	echo "la desinstallation de 'openvswitch-common' a echoue"
fi
echo "--------------------------------------------"


echo "----------openvswitch-switch---------------"
sudo apt-get --purge remove openvswitch-switch -y
if [ $? -ne 0 ]
then 
	echo "la desinstallation de 'openvswitch-switch' a echoue"
fi
echo "--------------------------------------------"



