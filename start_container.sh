#¡/bin/bash

# start de container

#oldIFS=$IFS

exp=$(echo $1|grep \*)
#echo $exp
if [ $exp ]
then
        echo " --------------demarrage des conteneur avec le joker "$exp"------------------------------$
        list_container=$(lxc-ls)
        mot_sans_etoil=$(echo $1 | tr -d "*")
        list_final=$(echo $list_container | tr " " "\n" | grep $mot_sans_etoil )

        echo "list des conteneurs a demarrer  ======>  "$list_final
#       IFS=' '
        for i in $list_final
        do
                echo "----> Demarrage de :"$i
                lxc-start -n $i
                if [ $? -ne 0 ]
                then
                        echo " le demarrage a echoue ! "
                        exit 1
                fi
                echo "demarrage  de :" $i " : ok"
        done
        IFS=$oldIFS
else
        echo "---------------------demarrage du conteneur sans Joker -------------------------"
        lxc-start -n $1
        if [ $? -ne 0 ]
        then
                echo " le demarrage a echoue ! "
                exit 1
        fi
        echo " demarrage du container en arg: " $1 " : ok !"
fi
echo "---- -----------------Etat des container------------------ ----"
lxc-ls --fancy

echo "------------------------------------------------------------------"
