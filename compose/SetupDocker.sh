#!/bin/bash
clear

# set variables
source unset.sh

# set variables
source variables_goblales.sh

user=$(whoami)

# set an infinite loop
while :
do
	clear
    # display menu
  
    echo "- ------- - --------------------------------- ---------------------------------- -"
    echo "- ------- -  Server Name: [$(hostname)]          - Server Name: [$(hostname)]          -"
	echo "- ------- - --------------------------------- ---------------------------------- -"
	echo "- Ports          - IP   -  Menu Subir Name: [$(hostname)]      - Docker Bajar Name: [$(hostname)]    -"
	echo "- ----------------      - --------------------------------- ---------------------------------- -"
	echo "- 8091:50000:8491-  4   -  1. Jenkins                       -  2. Jenkins                      -"
	echo "- 8082:7990:7999 -  2,3 -  3. Atlassian (jira-bit-post)     -  4. Atlassian (jira-bit-post)    -"
	echo "-                -      -  5. Grafana                       -  6. Grafana                      -"
	echo "-                -      -  7. Prometheus                    -  8. Prometheus                   -"
	echo "-                -      -  9. Sonar                         - 10. Sonar                        -"
	echo "-                -      - 11. Zabbix  Afinar                - 12. Zabbix  Afinar               -"
    echo "- 8081           -  6   - 13. Artifactory                   - 14. Artifactory                  -"
    echo "-                -      - 15. Nginx   Afinar                - 16. Nginx   Afinar               -"
    echo "- 5432           -  5   - 17. postgres:9.4                  - 18. postgres:9.4                 -"
    echo "- 3306           -      - 19. mysql:5.4                     - 20. mysql:5.4                    -"
    echo "- 8083:8084:8485 -      - 21. moodle:3.6.1                  - 22. moodle:3.6.1                 -"
	echo "---------------- - ---- - --------------------------------- ---------------------------------- -"
	echo "- A. Todos las imagenes            - B. Todos los volumenes     -                              -"
    echo "- C. Purgar todas las Imagenes     - D. Otros Comandos          -                              -"
    echo "- E. Eliminar Imagenes             - F. Listar Imagenes         -                              -"
	echo "- G. Entrar a un contenedor        - V. Volver Menu Principal   -                              -"
    echo "- H. Detalle Redes                 - I. Ip Mages Docker         -                              -"
    echo "- J. telnet                        - K. logs imagen             -                              -"
    echo "---------------------------------- ---------------------------- - ---------------------------- -"
    echo "- X. Exit                          -                            -                              -"
    echo "---------------------------------- ---------------------------- - ---------------------------- -"

	# get input from the user 
	read -p "Enter your choice [1-100] " choice
	
	# get input from the user 
	case $choice in

	  1) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio Jenkins "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/Jenkins/jenkins_docker
        chown -R $user:$user $pathUser
        chmod -R 777 $pathUser
        sudo docker-compose up -d
        
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
        
        cd $pathUser/compose/Jenkins/jenkins_docker
        sudo docker-compose down
        docker ps | grep jenkins

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    3) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio atlassian "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/atlassian/
        sudo docker-compose -p atlassian up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep atlassian

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://jira.$domain:8082"
        echo "   URL: http://bitbucket.$domain:7990"

        sudo chmod 777 -R $pathUser/compose/atlassian/

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    4) 	
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio atlassian "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/atlassian/
        sudo docker-compose -p atlassian down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep atlassian
        
        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    5) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio grafana "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/grafana/
        sudo docker-compose up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep grafana

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://grafana.$domain:3000"
        
        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    6) 	
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio grafana "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/grafana/
        sudo docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep grafana

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    7) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio prometheus "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/prometheus
        sudo docker-compose up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep prometheus

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   port prometheus : 9090 "

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    8) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio prometheus "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/prometheus
        sudo docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep prometheus

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    9) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio sonar "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/sonar
        sudo docker-compose up

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep sonar

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain:9001"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    10) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio sonar "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/sonar
        sudo docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep sonar

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    11) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio zabbix "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/zabbix
        sudo docker-compose up

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep zabbix

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    12) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio zabbix "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        ccd $pathUser/compose/zabbix
        sudo docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep zabbix

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    13) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio artifactory "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        chown -R $user:$user $pathUser
        chmod -R 777 $pathUser

        cd $pathUser/compose/artifactory/docker-compose/artifactory
        sudo docker-compose -f artifactory-oss.yml up -d

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain:8081"

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep artifactory

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    14) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio artifactory "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/artifactory/docker-compose/artifactory
        sudo docker-compose -f artifactory-oss.yml down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep artifactory

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    15) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio nginx "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/nginx
        sudo docker-compose up nginx -d

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep nginx

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    16) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio nginx "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/nginx
        sudo docker-compose up nginx down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep nginx

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    17) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio postgress "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/postgress
        sudo docker-compose -p postgress up -d
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep postgress

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    18) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio postgress "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/postgress
        sudo docker-compose -p postgress down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep postgress

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    19) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio mysql "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/mysql
        sudo docker-compose -p mysql up -d
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep mysql

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    20) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio mysql "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/mysql
        sudo docker-compose -p mysql down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep mysql

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    21) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Subir Servicio moodle + mysql "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/moodle
        sudo docker-compose up -d --build
        sudo docker exec php7 chown www-data:www-data /var/www/moodledata
        
        
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   URL: http://$domain"

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep moodle

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    22) 	

        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detener Servicio moodle + mysql "
        echo -e "\n----------------------------------------------------------------------------------------"
        
        cd $pathUser/compose/moodle
        sudo docker-compose down

        echo -e "\n----------------------------------------------------------------------------------------"
        sudo docker ps | grep moodle

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    A)
        sudo docker ps -a

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    B)
        sudo docker volume ls

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    C)
        sudo docker volume prune

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

        sudo docker images -a

        read -p ">> Digite el ID de la Imagen : " IDImage
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker rmi $IDImage

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    F)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Listar Imagenes Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker images -a

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    
    G)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Entrar a Contenedor Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker ps --format '{{.Names}}'

        read -p ">> Digite el nombre de la Imagen : " nameImage
        echo -e "\n----------------------------------------------------------------------------------------"

        if [ "$nameImage" = "postgress_database_1" ] 
            then
                sudo docker exec -it $nameImage psql -U postgres
            else
                sudo docker exec -it $nameImage bash
            fi

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    H)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detalle de la Red Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker network ls

        echo -e "\n----------------------------------------------------------------------------------------"
        read -p ">> Digite el ID de la red default [bridge] : " idInspect
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker network inspect "$idInspect"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
             read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    I)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Detalle IP de Imagen Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker ps --format '{{.Names}}'

        echo -e "\n----------------------------------------------------------------------------------------"
        read -p ">> Digite el ID de la red default (Names)] : "  idRed
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$idRed"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
             read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    J)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo    "  Telnet Puerto "
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker ps --format '{{.Names}}'

        echo -e "\n----------------------------------------------------------------------------------------"
        read -p ">> Digite el ID de la red default (Names)] : "  IDImage
        read -p ">> Digite el DNS : "  DNS
        read -p ">> Digite el puerto : "  Port
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker exec "$IDImage" curl -v telnet://"$DNS":"$Port"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
             read -p "Press [Enter] key to continue..." readEnterKey
        ;;
    
    K)
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Logs Imagen Docker "
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker ps -a

        echo -e "\n----------------------------------------------------------------------------------------"
        read -p ">> Digite el ID de la imagen  : "  idLog
        echo -e "\n----------------------------------------------------------------------------------------"

        sudo docker logs "$idLog"

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
             read -p "Press [Enter] key to continue..." readEnterKey
        ;;

    V)
        sh ~/Aprovisionamiento_Linux/Setup.sh

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
		    read -p "Press [Enter] key to continue..." readEnterKey
        ;;

  	X)
        echo "Gracias!"
        exit 0
        ;;
		
    *)
        echo "Error: Invalid option..."	
        read -p "Press [Enter] key to continue..." readEnterKey
        ;;
		esac
	done