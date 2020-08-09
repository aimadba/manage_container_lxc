#!/bin/bash

echo "------ Creation du bridge ------" 

sudo ovs-vsctl add-br br0

if [ $? -ne 0 ]
then 
	echo "---> Creation bridge a echoue ! "
	exit 1
else 
	echo "---> Creation du bridge ... " 
fi
echo "---------------------------------------" 


sudo ip link set dev br0 up
if [ $? -ne 0 ]
then 
	echo "---> Bridge n est pas UP! "
	exit 1
else 
	echo "---> bridge est UP ... " 
fi
echo "---------------------------------------" 


sudo ip link set dev ovs-system up
if [ $? -ne 0 ]
then 
	echo "---> Bridge No Active ! "
	exit 1
else 
	echo "---> Bridge Active ... " 
fi
echo "---------------------------------------" 

 

echo "-------- Etat du Bridge --------"
sudo ovs-vsctl show 


echo "------------FIN--------------"
