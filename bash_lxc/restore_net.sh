#!/bin/bash

echo "-------Bridge DOWN--------------" 

sudo ip link set dev br0 down
sudo ip link set dev ovs-system down
if [ $? -ne 0 ]
then 
	echo "---> Bridge n est pas Down! "
	exit 1
else 
	echo "---> Bridge est Down ... " 
fi
echo "---------------------------------------" 


echo "-----Suppression du Bridge------" 

sudo ovs-vsctl del-br br0 
if [ $? -ne 0 ]
then 
	echo "---> Bridge n est pas Supprimer! "
	exit 1
else 
	echo "---> Bridge est Supprimer ... " 
fi
echo "---------------------------------------" 


echo "----- Etat du bridge ----- "
sudo ovs-vsctl show
echo " ------------------------- "
