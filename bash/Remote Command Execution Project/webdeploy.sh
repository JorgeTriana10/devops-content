#!/bin/bash

USR='devops'

for host in `cat remhosts`
do
        echo "##########################################"
        echo "Connecting to $host"
        scp multios_websetup.sh $USR@$host:/tmp/
        echo "Fichero copiado a $host correctamente"
        echo "##########################################"
        echo "Ejecutando multios_websetup.sh en $host"
        ssh $USR@$host sudo /tmp/multios_websetup.sh
        ssh $USR@$host sudo rm -rf /tmp/multios_websetup.sh
        echo "Fichero ejecutado en $host correctamente"
        echo "##########################################"
        sleep 1
done