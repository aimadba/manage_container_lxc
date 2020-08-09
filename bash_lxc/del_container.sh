#¡/bin/bash

# start de container

#oldIFS=$IFS

exp=$(echo $1|grep \*)
#echo $exp
if [ $exp ]
then
        echo " --------------Destruction des conteneur avec le joker "$exp"------------------------------"
        list_container=$(lxc-ls)
        mot_sans_etoil=$(echo $1 | tr -d "*")
        list_final=$(echo $list_container | tr " " "\n" | grep $mot_sans_etoil )

        echo "list des conteneurs a Detruir  ======>  "$list_final
        #IFS=' '
        for i in $list_final
        do
                echo "----> la Destruction de :"$i
                lxc-destroy -n $i
                if [ $? -ne 0 ]
                then
                        echo " la Destruction a echoue ! "
                        exit 1
                fi
                echo "La Destruction de :" $i " : ok"
        done
        #IFS=$oldIFS
else
        echo "---------------------Destruction du conteneur sans Joker -------------------------"
        lxc-destroy -n $1
        if [ $? -ne 0 ]
        then
                echo " la Destruction a echoue ! "
                exit 1
        fi
        echo " la Destruction du container en arg: " $1 " : ok !"
fi
echo "---- -----------------Etat des container------------------ ----"
lxc-ls --fancy

echo "------------------------------------------------------------------"
