#!/bin/bash
clear

# Eliminar Variables
./unset.sh

# set variables
ipa=$(hostname -i | cut -d " " -f 1)
user=$(whoami)

# Ejecucion
echo "Inicia de kubectl                                                            "
echo "-----------------------------------------------------------------------------"
read -p "Paso 1: Desea Instalar Kubectl (y/n)? " answer

if [[ $answer =~ ^[Yy]$ ]]
    then

    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl

    echo "-----------------------------------------------------------------------------"
    echo "Install kubectl binary with curl on Linux                                    "
    echo "-----------------------------------------------------------------------------"

    #Doenload kubectl 
    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

    #validar
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

    #Install
    cho "------------------------------------------------------------------------------"
    echo "Instalar Paquetes Prerequisitos                                              "
    echo "-----------------------------------------------------------------------------"
    sudo apt-get update
    sudo apt-get install -y kubectl

    #Version
    echo "-----------------------------------------------------------------------------"
    echo "Version kubectl                                                              "
    echo "-----------------------------------------------------------------------------"
    kubectl version --client

    echo "-----------------------------------------------------------------------------"
    echo "Version kubectl --output=yaml                                                "
    echo "-----------------------------------------------------------------------------"
    kubectl version --client --output=yaml

    read -p "Press [Enter] key to continue..." readEnterKey
fi

echo "-----------------------------------------------------------------------------"
echo "Sin Ajustes!!"
echo "-----------------------------------------------------------------------------"