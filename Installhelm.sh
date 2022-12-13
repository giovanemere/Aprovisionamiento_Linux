#!/bin/bash
clear

# Eliminar Variables
./unset.sh

# set variables
ipa=$(hostname -i | cut -d " " -f 1)
user=$(whoami)

# Ejecucion
echo "Inicia Instalacion de helm                                                   "
echo "-----------------------------------------------------------------------------"
read -p "Paso 1: Desea Instalar helm (y/n)? " answer

if [[ $answer =~ ^[Yy]$ ]]
    then

    echo "-----------------------------------------------------------------------------"
    echo "Install helm with curl on Linux                                              "
    echo "-----------------------------------------------------------------------------"

    #Doenload kubectl 
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-get install apt-transport-https --yes
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list


    #Install
    echo "------------------------------------------------------------------------------"
    echo "Instalar Paquetes                                                            "
    echo "-----------------------------------------------------------------------------"
    sudo apt-get update
    sudo apt-get install helm

    #Version
    echo "-----------------------------------------------------------------------------"
    echo "Version helm                                                                 "
    echo "-----------------------------------------------------------------------------"
    helm version

    echo "-----------------------------------------------------------------------------"
    read -p "Press [Enter] key to continue..." readEnterKey
fi

echo "-----------------------------------------------------------------------------"
echo "Sin Ajustes!!"
echo "-----------------------------------------------------------------------------"