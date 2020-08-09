#!/bin/bash

if [ $# -ne 6 ]
then 
	echo " Arguments manquants ! "
	echo "./creat_contaner.sh template nomMachine addrIP ram cpu mdpRoot"
	exit 1
fi


# creation du container 

echo "------------------Creation du container-------------"

lxc-create -n $2 -t $1
if [ $? -ne 0 ] 
then
	echo " la creation de container a echoue ! "
	exit 1
fi
echo "creation du container : ok "

echo "----------------------------------------------------"

# configuration systeme 

echo "---- Configuration systeme ------------------------ " 


echo "---->  CPU / RAM:"
echo "lxc.cgroup.cpuset.cpus= "$5 >> /var/lib/lxc/$2/config
if [ $? -ne 0 ] 
then
	echo " Attribution CPU a echoue ! "
	exit 1
fi
echo "Atribution CPU : ok "

if [ $? -ne 0 ] 
then
	echo " Attribution RAM a echoue ! "
	exit 1
fi
echo "Attribution RAM : ok "

echo "---->  Network:"

sed -i "s/lxc.net.0.type = veth/lxc.net.0.type = veth/g" /var/lib/lxc/$2/config

sed -i "s/lxc.net.0.link = lxcbr0/lxc.net.0.link = br0/g" /var/lib/lxc/$2/config

echo "lxc.net.0.veth.pair = br-$2" >> /var/lib/lxc/$2/config

echo "lxc.net.0.ipv4.address= "$3"/24" >> /var/lib/lxc/$2/config

echo "lxc.net.0.ipv4.gteway= auto" >> /var/lib/lxc/$2/config


echo "------------------------------------------------------"

lxc-start -n $2 
lxc-ls -f
lxc-stop -n $2
