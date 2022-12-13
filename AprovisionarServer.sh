#!/bin/bash
clear

# Eliminar Variables
unset folder
unset MenuAprovi
unset MenuDocker
unset MenuRanche
unset username
unset token
unset repo
unset NameHost
unset repo
unset NameDir
unset Port
unset Range

# set variables
user=$(whoami)
# set an infinite loop
while :
do
	clear
    # display menu
  
    echo "- --------------------------------- -"
    echo "-  Server Name: [$(hostname)]       -"
	echo "- --------------------------------- -"
	echo "-  Aprovisionar el Servidor         -"
	echo "- --------------------------------- -"
	echo "-  1. Cambiar nombre Servidor       -"
	echo "-  2. Cambiar Particion Discos      -"
	echo "-  3. Cambiar IP Servidor           -"
	echo "-  4. Cambiar tabla de Host         -"
	echo "-  5. Agregar Permisos de Firewall  -"
	echo "-  6. Editar DNS Server             -"
    echo "-  7. Configurar proxy              -"
	echo "- --------------------------------- -"
	echo "-  V. Volver Menu Principal         -"
    echo "-  E. Exit                          -"
    echo "- --------------------------------- -"

	# get input from the user 
	read -p "Enter your choice [1-100] " choice
	
	# get input from the user 
	case $choice in

	  1) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Nombre Server Actual                :[$(hostname)] "
        read -p ">> Digite el NUEVO nombre del Servidor : " NameHost
        echo -e "\n----------------------------------------------------------------------------------------"
        
        sudo hostnamectl set-hostname $NameHost
        echo "Verifique la variable [ preserve_hostname:  true ] en el archivo /etc/cloud/cloud.cfg   "
        
        echo "--------------------------------------------------------------------------------------"
        preser=$(grep preserve_hostname /etc/cloud/cloud.cfg)
        echo ">> Resultado /etc/cloud/cloud.cfg: [ >> $preser << ]"
        echo ">> Nombre Server Actual: [$(hostname)] "

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    2) 	
		echo "---------------------------------------------------------------------------------------"
        echo " Particionar el Discon. Instale >> [ apt install gparted ] "
        echo -e "\n Paso 1: ejecutar y modificar [ gparted ]"
        echo " Paso 2: fdisk -l"
        echo " Paso 3: mkdir /Data"
        echo " Paso 4: Agregar Disco al Inicio nano /etc/fstab /dev/sda9     /Data ext4 defaults 0       0"
        echo " Paso 5: reboot"
        echo -e "\n----------------------------------------------------------------------------------------"
        
        read -p "Paso 1: Desea Particionar el Disco (y/n)? " answer

            if [[ $answer =~ ^[Yy]$ ]]
                then
                    sudo gparted
                fi

            echo "Paso 2: Listado de particiones del servidor"
            echo "---------------------------------------------------------------------------------------"
            df -h
            echo "---------------------------------------------------------------------------------------"
            sudo fdisk -l
            
            echo -e "\n----------------------------------------------------------------------------------------"
            echo " Paso 3: Digite Nombre de Carpeta Ejemplo :[ /Data ] "
            read -p ">> Crear la Carpeta  : " NameDir
            
            sudo mkdir -p $NameDir
            sudo chown -R $user:$user $NameDir
            ls -ltr $NameDir

            echo -e "\n----------------------------------------------------------------------------------------"
            
            echo -e "\n-Paso 4: Agregar Particion al Inicio del servidor en la ultima linea del archivo."
            echo "Estructura Ejemplo: [ /dev/sda9     $NameDir ext4 defaults 0       0 ]"
            read -p "Press [Enter] key to continue..." readEnterKey

            sudo nano /etc/fstab

        read -p "Paso 5: Deseas Reiniciar el servidor (y/n)? " fsta
            if [[ $fsta =~ ^[Yy]$ ]]
                then
                    sudo reboot
                fi

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    3) 	
        
        echo "---------------------------------------------------------------------------------------"
        echo " Ejemplo de /etc/netplan/50-cloud-init.yaml"
        echo " network: "
        echo "     ethernets:"
        echo "         ens33:"
        echo "             addresses:"
        echo "             - 192.168.137.3/23"
        echo "            gateway4: 192.168.137.100"
        echo "             nameservers:"
        echo "                 addresses:"
        echo "                 - 192.168.137.100"
        echo "                 - 8.8.8.8"
        echo "     version: 2"
        echo -e "\n----------------------------------------------------------------------------------------"
        
        read -p "Ejemplo de Adaptador de Red. Press [Enter] key to continue..." readEnterKey

        sudo nano /etc/netplan/50-cloud-init.yaml

        read -p "Al aplicar este cambio conectarse con la NUEVA IP Press [Enter] key to continue..." readEnterKey
        sudo sudo netplan apply

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    4) 	
        echo "--------------------------------------------------------------------------------------"
        echo ">> Copie el Nombre del host Actual para actualizar tabla de host: [$(hostname)] "
        read -p "Press [Enter] key to continue..." readEnterKey

        sudo nano /etc/hosts
        
        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    5) 	
        
      # set an infinite loop
      while :
      do
        clear
          # display menu
        
        echo " SERVER NAME: $(hostname)           "
        echo "------------------------------------"
        echo " Permisos de Firewall              -"
        echo "------------------------------------"
        echo " 1. Agregar puerto Especifico tcp  -"
        echo " 2. Agregar puerto Especifico udp  -"
        echo " 3. Agregar rango puertos tcp      -"
        echo " 4. Agregar rango puertos udp      -"
        echo " 5. Status Servicio firewall       -"
        echo "------------------------------------"
        echo " E. Exit                           -"
        echo "------------------------------------"

        # get input from the user 
        read -p "Enter your choice [1-100] " choice
        
        # get input from the user 
        case $choice in
          
          1)  	

              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep -v ":"

              echo -e "\n----------------------------------------------------------------------------------------"
              echo "   Ejemplo                      : [ 22 ] "
              read -p ">> Digite el puerto a habilitar : " Port
              echo -e "\n----------------------------------------------------------------------------------------"

              sudo ufw allow $Port/tcp


              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep "$Port"

              echo -e "\n----- Fin del Script -----------------------------------------------------------"
              read -p "Press [Enter] key to continue..." readEnterKey
              ;;
        
          2)  	

              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep -v ":"

              echo -e "\n----------------------------------------------------------------------------------------"
              echo "   Ejemplo                      : [ 22 ] "
              read -p ">> Digite el puerto a habilitar : " Port
              echo -e "\n----------------------------------------------------------------------------------------"

              sudo ufw allow $Port/udp

              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep "$Port"

              echo -e "\n----- Fin del Script -----------------------------------------------------------"
              read -p "Press [Enter] key to continue..." readEnterKey
              ;;

          3) 	
              
              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"

              sudo ufw status | grep ":"
              
              echo -e "\n----------------------------------------------------------------------------------------"
              echo "   ejemplo                      : [ 1000:2000 ] "
              read -p ">> Digite el puerto a habilitar : " Range
              echo -e "\n----------------------------------------------------------------------------------------"

              sudo ufw allow $Range/tcp

              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep "$Range"
              
              echo -e "\n----- Fin del Script -----------------------------------------------------------"
              read -p "Press [Enter] key to continue..." readEnterKey
              ;;
          
          4) 	
              
              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"

              sudo ufw status | grep ":"
              
              echo -e "\n----------------------------------------------------------------------------------------"
              echo "   ejemplo                      : [ 1000:2000 ] "
              read -p ">> Digite el puerto a habilitar : " Range
              echo -e "\n----------------------------------------------------------------------------------------"

              sudo ufw allow $Range/udp

              echo "----------------------------------------------------------------------------------------"
              echo " Listado de Puertos Habilitados                                                         "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep "$Range"
              
              echo -e "\n----- Fin del Script -----------------------------------------------------------"
              read -p "Press [Enter] key to continue..." readEnterKey
              ;;

          5) 	
              echo "----------------------------------------------------------------------------------------"
              echo " Estado y Listado de Puertos Habilitados                                                "
              echo "----------------------------------------------------------------------------------------"

              echo " Puertos tcp                                                                            "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep tcp
              
              echo "----------------------------------------------------------------------------------------"
              echo " Puertos upd                                                                            "
              echo "----------------------------------------------------------------------------------------"
              sudo ufw status | grep udp

              echo -e "\n----- Fin del Script -----------------------------------------------------------"
              read -p "Press [Enter] key to continue..." readEnterKey
              ;;
            
          E)
              echo "Gracias!"
              sh ~/Aprovisionamiento_Linux/AprovisionarServer.sh

              ;;
          
          *)
              echo "Error: Invalid option..."	
              read -p "Press [Enter] key to continue..." readEnterKey
              ;;
          esac
        done
        
        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    6) 	
        
        echo "---------------------------------------------------------------------------------------"
        echo " Ejemplo de /etc/resolv.conf"
        echo " nameserver 8.8.4.4 "
        echo " nameserver 8.8.8.8"
        echo -e "\n----------------------------------------------------------------------------------------"
        
        read -p "Ejemplo de DNS Externos. Press [Enter] key to continue..." readEnterKey

        sudo nano /etc/resolv.conf
        sudo sudo netplan apply

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    7) 	

        echo "---------------------------------------------------------------------------------------"
        echo " Ejemplo de /etc/sysconfig/proxy     "
        echo " PROXY_ENABLED=\"yes\"               "
        echo " HTTP_PROXY=\10..236.50.83:8080\"    "
        echo " HTTPS_PROXY=\"10.236.50.83:8080\"   "
        echo " FTP_PROXY=\"10.236.50.83:8080\"     "
        echo " NO_PROXY=\"localhost, 127.0.0.1,\"  "
        echo -e "\n----------------------------------------------------------------------------------------"

        read -p "Ejemplo de Proxy. Press [Enter] key to continue..." readEnterKey
        
        sudo nano /etc/sysconfig/proxy
        sudo sudo netplan apply

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    V)
        sh ~/Aprovisionamiento_Linux/Setup.sh

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
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