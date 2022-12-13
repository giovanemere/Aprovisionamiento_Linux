#!/bin/bash
clear

# Eliminar Variables
./unset.sh

# set variables
key="~/.ssh/id_rsa"

# set an infinite loop
while :
do
	clear
    # display menu
    echo "- ------------------------------------------------------------------------- -"
    echo "- Server Name: [$(hostname)]                                                 "
	echo "- ------------------------------------------------------------------------- -"
	echo " MENU:       Central de Administracion                                      -"
	echo "-----------------------------------------------------------------------------"
	echo " Kubernetes                         - Linux                                 -"
	echo "-----------------------------------------------------------------------------"
	echo " 1. Docker  : 192.168.137.29        -  3.                                   -"
	echo " 2. Rancher : 192.168.137.30        -  4.                                   -"
	echo "-----------------------------------------------------------------------------"
    echo " A. Menu Aprovisionamiento                                                  -"
	echo " E. Exit                                                                    -"
    echo "-----------------------------------------------------------------------------"
	# get input from the user 
	read -p "Enter your choice [1-100] " choice
	
	# get input from the user 
	case $choice in

    1) 
            puerto=22
            usuario=giovanemere
            ip=192.168.137.29

            clear
            # conexion Servidor linux
            ssh -i $key -p $puerto $usuario@$ip

            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
		;;

    2)    
            puerto=22
            usuario=giovanemere
            ip=192.168.137.30

            clear

            # conexion Servidor linux
            ssh -i $key -p $puerto $usuario@$ip

            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
		;;
    
    E)
			echo "Gracias!"
			exit 0
			;;
		*)
			echo "Error: Invalid option..."	
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		esac
	done