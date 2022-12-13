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
domain="giovanemere.minikube.io"
# set an infinite loop
while :
do
	clear
    # display menu
  
    echo "- --------------------------------- ---------------------------------- -"
    echo "-  Server Name: [$(hostname)]       - Server Name: [$(hostname)]       -"
	echo "- --------------------------------- ---------------------------------- -"
	echo "-  Menu Docker Subir                - Menu Docker Bajar                -"
	echo "- --------------------------------- ---------------------------------- -"
	echo "-  1. Jenkins                       -  2. Jenkins                      -"
	echo "-  3. Atlassian (jira-bit-post)     -  4. Atlassian (jira-bit-post)    -"
	echo "-  5. Grafana                       -  6. Grafana                      -"
	echo "-  7. Prometheus                    -  8. Prometheus                   -"
	echo "-  9. Sonar                         - 10. Sonar                        -"
	echo "- 11. Zabbix  Afinar                - 12. Zabbix  Afinar               -"
    echo "- 13. Artifactory                   - 14. Artifactory                  -"
    echo "- 15. Nginx   Afinar                - 16. Nginx   Afinar               -"
    echo "- 17. postgres:9.4                  - 18. postgres:9.4                 -"
	echo "- --------------------------------- ---------------------------------- -"
	echo "-  A. Todos las imagenes            - B. Todos los volumenes           -"
    echo "-  C. Purgar todas las Imagenes     - D. Otros Comandos                -"
    echo "-  E. Eliminar Imagenes             - F. Listar Imagenes               -"
	echo "-  G. Entrar a un contenedor        - V. Volver Menu Principal         -"
    echo "-  E. Exit                          - E. Exit                          -"
    echo "- --------------------------------- ---------------------------------- -"

	# get input from the user 
	read -p "Enter your choice [1-100] " choice
	
	# get input from the user 
	case $choice in

	  1) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio Jenkins "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/Jenkins/jenkins_docker
        docker-compose up -d
        
        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep jenkins

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain:8091/devops/jenkins"
        echo "   URL: https://$domain:8491/devops/jenkins"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    2) 	
		echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio Jenkins "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/Jenkins/jenkins_docker
        docker-compose down
        docker ps | grep jenkins

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    3) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio atlassian "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/atlassian/
        docker-compose -p atlassian up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep atlassian

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://jira.$domain:8082"
        echo "   URL: http://bitbucket.$domain:7990"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    4) 	
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio atlassian "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/atlassian/
        docker-compose -p atlassian down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep atlassian
        
        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    5) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio grafana "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/grafana/
        docker-compose up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep grafana

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://grafana.$domain:3000"
        
        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    6) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio grafana "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/grafana/
        docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep grafana

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    7) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio prometheus "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/prometheus
        docker-compose up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep prometheus

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   port prometheus : 9090 "

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    8) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio prometheus "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/prometheus
        docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep prometheus

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    9) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio sonar "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/sonar
        docker-compose up

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep sonar

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain:9001"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    10) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio sonar "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/sonar
        docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep sonar

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    11) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio zabbix "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/zabbix
        docker-compose up

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep zabbix

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    12) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio zabbix "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        ccd /home/giovanemere/Aprovisionamiento_Linux/compose/zabbix
        docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep zabbix

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    13) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio artifactory "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/artifactory/docker-compose/artifactory
        sudo docker-compose -f artifactory-oss.yml up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain:8081"

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep artifactory

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    14) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio artifactory "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/artifactory/docker-compose/artifactory
        sudo docker-compose -f artifactory-oss.yml down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep artifactory

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    15) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio nginx "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/nginx
        docker-compose up nginx -d

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep nginx

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    16) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio nginx "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/nginx
        docker-compose up nginx down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep nginx

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    17) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio postgress "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/postgress
        docker-compose -p postgress up -d
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep postgress

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    18) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio postgress "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd /home/giovanemere/Aprovisionamiento_Linux/compose/postgress
        docker-compose -p postgress down

        echo -e "\n----------------------------------------------------------------------------------------"
        docker ps | grep postgress

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    A)
        docker ps -a

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    B)
        docker volume ls

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    C)
        docker volume prune

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    D)
        echo "Lista volume : docker volume ls"
        echo "Borrar volume : docker volume rm nombre volume"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    E)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Eliminar Imagenes Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        docker images -a

        read -p ">> Digite el ID de la Imagen : " IDImage
        echo -e "\n----------------------------------------------------------------------------------------"

        docker rmi $IDImage

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    F)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Listar Imagenes Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        docker images -a

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    
    G)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Entrar a Contenedor Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        docker ps --format '{{.Names}}'

        read -p ">> Digite el nombre de la Imagen : " nameImage
        echo -e "\n----------------------------------------------------------------------------------------"

        docker exec -it $nameImage bash

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