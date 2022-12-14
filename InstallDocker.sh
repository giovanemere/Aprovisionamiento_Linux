#!/bin/bash
clear

# Eliminar Variables
source unset.sh

# set variables
 source variables_goblales.sh

    compose="compose/$application"
    folderSource="$pathUser/Aprovisionamiento_Linux/$compose/$fileCompose/$application"

# set an infinite loop
while :
do
    clear
    # display menu
    echo "- ----------------------------------------- -"
    echo "- Server Name: [$(hostname)]                 "
	echo "- ----------------------------------------- -"
	echo "- MENU: Menu $application                 "
	echo "- ----------------------------------------- -"
	echo "- 1. Instalar o Iniciar $application                 "
	echo "- 2. Detener Servicio $application                   "
    echo "- 3. Eliminar Imagenes                      -"
    echo "- 4. Estado Servicios Docker                -"
    echo "- 5. Reinciar Servicios Docker              -"
    echo "- 6. Probar Puerto                          -"
    echo "- 7. Los Servicio                           -"
    echo "- 8. iniciar docker bash                    -"
	echo "- ----------------------------------------- -"
    echo "- V. Menu Prinicpal                         -"
	echo "- E. Exit                                   -"
    echo "------------------------------------------- -"
	# get input from the user 
	read -p "Enter your choice [1-100] " choice
	
	# get input from the user 
	case $choice in
		1) 
           # Ejecucion
            echo "-----------------------------------------------------------------------------"
            echo "Inicia instalacion docker CE                                                 "
            echo "-----------------------------------------------------------------------------"
            read -p ">> Paso 1: Desea Instalar Docker (y/n)? " answer

            if [[ $answer =~ ^[Yy]$ ]]
                then
                    cd ~/

                    echo "-----------------------------------------------------------------------------"
                    echo "Instalación Prerequisitios"
                    echo "-----------------------------------------------------------------------------"
                    sudo apt-get update -y
                    sudo apt-get install -y \
                    apt-transport-https \
                    ca-certificates \
                    curl \
                    gnupg-agent \
                    software-properties-common 

                    echo "-----------------------------------------------------------------------------"
                    echo "Descargar llave GPG"
                    echo "-----------------------------------------------------------------------------"
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

                    echo "-----------------------------------------------------------------------------"
                    echo "Instalar repositorios estables"
                    echo "-----------------------------------------------------------------------------"
                    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) \ stable"

                    echo "-----------------------------------------------------------------------------"
                    echo "Actualizar Repositorios"
                    echo "-----------------------------------------------------------------------------"
                    sudo apt-get update

                    echo "-----------------------------------------------------------------------------"
                    echo "Instalar docker ce"
                    echo "-----------------------------------------------------------------------------"
                    sudo apt-get install docker-ce docker-ce-cli containerd.io -y

                    echo "-----------------------------------------------------------------------------"
                    echo "Verificar Version"
                    echo "-----------------------------------------------------------------------------"
                    docker --version

                    echo "-----------------------------------------------------------------------------"
                    echo "Iniciar docker con el sistema"
                    echo "-----------------------------------------------------------------------------"
                    sudo systemctl enable docker
                    sudo systemctl start docker

                    user=$(whoami)
                    sudo usermod -G docker $user
                    grep $user /etc/group

                    echo "-----------------------------------------------------------------------------"
                    echo "folder docker"
                    echo "-----------------------------------------------------------------------------"
                    folder=/Images
                    sudo mkdir -p $folder/$user
                    sudo mkdir -p $folder/$user/Data
                    sudo chown -R $user:$user $folder/$user
                    sudo chown -R $user:$user $folder/$user/Data

                    ls -ltr $folder/

                    echo "-----------------------------------------------------------------------------"
                    echo "Iniciar Imagen docker de prueba"
                    echo "-----------------------------------------------------------------------------"
                    cd $folder/$user/Data
                    sudo docker container run hello-world

                    echo "http://$ipa"

                    read -p "Press [Enter] key to continue..." readEnterKey

                    echo "-----------------------------------------------------------------------------"
                    echo "Inicia instalacion Docker Compose                                            "
                    echo "-----------------------------------------------------------------------------"

                    sudo mkdir -p /usr/local/bin
                    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

                    sudo chmod +x /usr/local/bin/docker-compose
                    sudo docker-compose --version

                    read -p "Press [Enter] key to continue..." readEnterKey

                    #echo "-----------------------------------------------------------------------------"
                    #echo "Inicia instalacion Portainer                                                 "
                    #echo "-----------------------------------------------------------------------------"
                    #
                    #sudo docker pull portainer/portainer
                    #sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
                    #sudo docker ps
                    #sudo ufw allow 9000/tcp


                    echo "http://$ipa:9000"

                    echo "-----------------------------------------------------------------------------"
                    echo "Datos de Acceso"
                    echo "-----------------------------------------------------------------------------"
                    echo "user: admin"
                    echo "Password: Banco123*"
                    echo "-----------------------------------------------------------------------------"

                    echo "-----------------------------------------------------------------------------"
                    echo "Fin instalacion Docker                                                       "
                    echo "-----------------------------------------------------------------------------"

                    read -p "Press [Enter] key to continue..." readEnterKey
            fi
            echo "-----------------------------------------------------------------------------"
            echo "Sin Ajustes!!"
            echo "-----------------------------------------------------------------------------"
                
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;

        2) 
            clear
            echo "-----------------------------------------------------------------------------------------------------------------------------------------"
            sudo docker ps
            sudo docker ps --format {{.NAMES}}
                      
            echo "-----------------------------------------------------------------------------------------------------------------------------------------"
            ls "$folderSource"
            echo "---------------------------------------------------------------------------------------"
            read -p "Digite el $application a instalar Ej, [ artifactory ] : " app
            echo "---------------------------------------------------------------------------------------"

            composeTarget="$pathVol/$app"    
            approve="$folderSource/$app/$fileCompose"
            
            cd $composeTarget
            echo "composeTarget: $composeTarget"
            
            sudo docker-compose -f $app.yml down
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps

            sudo rm -rf $composeTarget
            ls -ltr $pathVol

            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;
        
        3) 
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps --format "{{.ID}}"
            echo "---------------------------------------------------------------------------------------"
            read -p "Digite el CONTAINER ID a eliminar: " containerid
            echo "---------------------------------------------------------------------------------------"

            sudo docker delete $containerid
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps
            
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;


        4) 
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps
            
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;

        5) 
            cho "folderSource: $folderSource"
            sudo docker ps

            echo "---------------------------------------------------------------------------------------"
            ls "$folderSource"

            echo "---------------------------------------------------------------------------------------"
            echo "Ejemplo de Carpeta           : [$application]"
            read -p "Digite el $application a instalar : " app
            echo "---------------------------------------------------------------------------------------"

            composeTarget="$pathVol/$app"    
            approve="$folderSource/$app/$fileCompose"
            
            cd $composeTarget
            echo "composeTarget: $composeTarget"
            
            sudo docker-compose restart
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps
            
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;

         6) 
            echo "---------------------------------------------------------------------------------------"
            read -p "Digite el puerto a probar: " port
            echo "---------------------------------------------------------------------------------------"

            netstat -an | grep $port
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps
            
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;

        7) 
            clear
            echo "---------------------------------------------------------------------------------------"
            echo "NAMES "
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps --format '{{.Names}}'
            echo "---------------------------------------------------------------------------------------"
            read -p "Digite NAMES : " logContainer
            echo "---------------------------------------------------------------------------------------"

            sudo docker logs -f --until=2s $logContainer
            
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps

            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;

         8) 
            clear
            echo "---------------------------------------------------------------------------------------"
            echo "NAMES "
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps --format '{{.Names}}'
            echo "---------------------------------------------------------------------------------------"
            read -p "Digite NAME  : " server
            echo "---------------------------------------------------------------------------------------"

            sudo docker exec -it $server bash
            
            echo "---------------------------------------------------------------------------------------"
            sudo docker ps

            echo ---------- Fin del Script ----------------------------
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
