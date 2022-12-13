#!/bin/bash
clear

# Eliminar Variables
./unset.sh

# set variables
    pathUser="/home/giovanemere"
    pattern="*.yml"
    pathVol="/rancher-vol"
    application="xray"
    compose="compose/artifactory"
    fileCompose="docker-compose"
    folderSource="$pathUser/Aprovisionamiento_Linux/$compose/$fileCompose/$application"
    ipa=$(hostname -i | cut -d " " -f 1)

# set an infinite loop
while :
do
    clear
    # display menu
    echo "- ----------------------------------------- -"
    echo "- Server Name: [$(hostname)]                 "
	echo "- ----------------------------------------- -"
	echo "- MENU: Instalar Docker $application                 "
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
            clear
            echo "---------------------------------------------------------------------------------------"
                cd "$folderSource/"
                ls *.yml
            echo "---------------------------------------------------------------------------------------"
            read -p "Digite el app a instalar Eje. [$app] : " app
            echo "---------------------------------------------------------------------------------------"

            composeTarget="$pathVol/$app"    
            approve="$folderSource/*"

            sudo mkdir -p $composeTarget
            sudo cp -r $approve $composeTarget/
            echo chown -R giovanemere:giovanemere $composeTarget
            sudo chmod -R 755 $composeTarget
            sudo chmod +x $composeTarget/*.sh

            echo "folder pathVol: $pathVol"
            echo "---------------------------------------------------------------------------------------"
            ls -ltr $pathVol

            echo "---------------------------------------------------------------------------------------"
            echo "folder composeTarget: $composeTarget"
            echo "---------------------------------------------------------------------------------------"
            ls -ltr $composeTarget

            echo "---------------------------------------------------------------------------------------"
            echo "file : $composeTarget/$fileCompose"
            echo "---------------------------------------------------------------------------------------"
            cat -b $composeTarget/$app.yml

            echo -e "\n---------------------------------------------------------------------------------------"
            read -p "Desplegar Compose (y/n)? " answer
            if [[ $answer =~ ^[Yy]$ ]]
            then

                cd $composeTarget
                echo "composeTarget: $composeTarget"
                
                #Instalar imagenes docker
                #Instalar imagenes docker
                if [ "$app" = "artifactory-oss" ] || [ "$app" = "artifactory-oss-postgresql" ]
                then
                sudo ./prepareHostEnv.sh -t oss -c
                fi

                #Instalar imagenes docker
                if [ "$app" = "artifactory-oss-postgresql" ]
                then
                sudo ./prepareHostEnv.sh -t ha-shared-data -c
                fi

                #Instalar imagenes docker
                if [ "$app" = "artifactory-ha" ] || [ "$app" = "artifactory-ha-shared-data" ]
                then
                sudo ./prepareHostEnv.sh -t ha -c
                fi

                if [ "$app" = "artifactory-pro-nginx-derby" ] || [ "$app" = "artifactory-pro-postgresql" ] || [ "$app" = "artifactory-pro" ]
                then
                sudo ./prepareHostEnv.sh -t pro -c
                fi
                
                sudo docker-compose -f $app.yml up -d
                sudo docker ps
            
                echo "---------------------------------------------------------------------------------------"
                read -p "Desea Reiniciar Servicio (y/n)? " answer
                if [[ $answer =~ ^[Yy]$ ]]
                then
                    sudo docker-compose restart
                    echo "---------------------------------------------------------------------------------------"
                    sudo docker ps
                fi

                echo "---------------------------------------------------------------------------------------"
                read -p "Desea revisar permisos de firewall (y/n)? " answer
                if [[ $answer =~ ^[Yy]$ ]]
                then
                    clear
                    echo "---------------------------------------------------------------------------------------"
                    sudo ufw status
                fi

                echo "---------------------------------------------------------------------------------------"
                read -p "Requiere Habilitar el puerto del Servicio (y/n)? " answer
                if [[ $answer =~ ^[Yy]$ ]]
                then
                    clear
                    echo "---------------------------------------------------------------------------------------"
                    read -p "Digite el puerto a habilitar: " port
                    echo "---------------------------------------------------------------------------------------"
                    sudo ufw allow $port/tcp

                    echo "---------------------------------------------------------------------------------------"
                    read -p "Requiere Habilitar otro puerto (y/n)? " answer

                    if [[ $answer =~ ^[Yy]$ ]]
                    then
                        clear
                        echo "---------------------------------------------------------------------------------------"
                        read -p "Digite el puerto a habilitar: " port
                        echo "---------------------------------------------------------------------------------------"
                        sudo ufw allow $port/tcp
                    fi
                fi
                
                echo "---------------------------------------------------------------------------------------"
                read -p "Desea probar el puerto (y/n)? " answer
                if [[ $answer =~ ^[Yy]$ ]]
                then
                    
                    echo "---------------------------------------------------------------------------------------"
                    read -p "Digite el puerto a probar: " port
                    echo "---------------------------------------------------------------------------------------"

                    netstat -an | grep $port 

                    echo "---------------------------------------------------------------------------------------"
                        sudo docker ps
                fi
            
                echo "---------------------------------------------------------------------------------------"
                read -p "Desea revisar el log (y/n)? " answer
                if [[ $answer =~ ^[Yy]$ ]]
                then
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
                fi
                echo "---------------------------------------------------------------------------------------"
                echo " URL App Default: https://$ipa/dashboard                                               "
                echo "---------------------------------------------------------------------------------------"
            fi
            
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;

        2) 
            clear
            echo "-----------------------------------------------------------------------------------------------------------------------------------------"
            sudo docker ps            
            echo "-----------------------------------------------------------------------------------------------------------------------------------------"
            ls "$folderSource"
            echo "---------------------------------------------------------------------------------------"
            read -p "Digite el $app a instalar Ej, [$app-self-signed] : " app
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
            echo "Ejemplo de Carpeta           : [$app]"
            read -p "Digite el $app a instalar : " app
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