#!/bin/bash

echo "----------- Debut installation -----------"

echo "----installation / mise à jour de sudo-------" 
apt-get install sudo
echo "---------------------------------------------"

echo "-------- installation de lxc -------"
sudo apt-get install lxc -y
if [ $? -ne 0 ]
then 
	echo "l'installation de 'lxc' a echoue ! "
	exit 1
fi
echo "-------------------------------------------"

echo "----------installation de lxctl---------" 
sudo apt-get install lxctl -y 
if [ $? -ne 0 ]
then 
	echo "l'installation de 'lxctl' a echoue ! "
	exit 1
fi
echo "-------------------------------------------"

echo "----Installation de openvswitch-common----"

sudo apt-get install openvswitch-common -y
if [ $? -ne 0 ]
then 
	echo "l'installation de 'openvswitch-common'  a echoue ! "
	exit 1
fi
echo "-------------------------------------------"


echo " ---- Installation de openvswitch-switch-----"
sudo apt-get install openvswitch-switch -y
if [ $? -ne 0 ]
then 
	echo "l'installation de 'openvswitch-switch'  a echoue ! "
	exit 1
fi
echo "-------------------------------------------"



echo "---------	Fin de l'installation ---------"
