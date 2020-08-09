#¡/bin/bash

# start de container

#oldIFS=$IFS

exp=$(echo $1|grep \*)
#echo $exp
if [ $exp ]
then
        echo " --------------Arret des conteneur avec le joker "$exp"------------------------------"
        list_container=$(lxc-ls)
        mot_sans_etoil=$(echo $1 | tr -d "*")
        list_final=$(echo $list_container | tr " " "\n" | grep $mot_sans_etoil )

        echo "list des conteneurs a Arreter  ======>  "$list_final
        #IFS=' '
        for i in $list_final
        do
                echo "----> l Arret de :"$i
                lxc-stop -n $i
                if [ $? -ne 0 ]
                then
                        echo " l arret a echoue ! "
                        exit 1
                fi
                echo "Arret  de :" $i " : ok"
        done
        #IFS=$oldIFS
else
        echo "---------------------l arret du conteneur sans Joker -------------------------"
        lxc-stop -n $1
        if [ $? -ne 0 ]
        then
                echo " l arret a echoue ! "
                exit 1
        fi
        echo " l arret du container en arg: " $1 " : ok !"
fi
echo "---- -----------------Etat des container------------------ ----"
lxc-ls --fancy

echo "------------------------------------------------------------------"
