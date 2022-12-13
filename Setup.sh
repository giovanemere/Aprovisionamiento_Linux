#!/bin/bash
clear

# Eliminar Variables
./unset.sh

# set variables
	folder="/home/ubuntu/Repositorios/Aprovisionamiento_Linux"
	MenuAprovi="AprovisionarServer.sh"
	MenuAdminDocker="SetupDocker.sh"
	MenuDocker="InstallDocker.sh"
	MenuRanche="InstallRancher.sh"

# set an infinite loop
while :
do
    clear
	# display menu
    echo "- ------------------------------------------------------------------------- -"
    echo "- Server Name: [$(hostname)]                                                 "
	echo "- ------------------------------------------------------------------------- -"
	echo "- MENU: Central de Administracion                                           -"
	echo "- ------------------------------------------------------------------------- -"
	echo "- 1. Aprovisionar Servers              -  9. Instalar Jenkins               -"
	echo "- 2. Subir Cambios Git                 - 10. Instalar Portainer.io          -"
	echo "- 3. Install Docker                    - 11. Iniciar Minikube               -"
	echo "- 4. Install Rancher                   - 12. Dashboard Minikube             -"
	echo "- 5. Install kubectl                   - 13. Detener Minikube               -"
	echo "- 6. Install helm                      - 14. Menu Docker                    -"
	echo "- 7. Install Artifactory               - 15.                                -"
	echo "- 8. Instalar Xray                     - 16.                                -"
	echo "- ------------------------------------------------------------------------- -"
	echo "- General                              -                                    -"
	echo "- ------------------------------------ - ---------------------------------- -"
	echo "- Y. Apagar Servidor                  -                                    -"
	echo "- 15. Reiniciar Servidor               -                                    -"
	echo "- 16. Cambiar password Usuarios        -                                    -"
	echo "- ------------------------------------------------------------------------- -"
	echo "- E. Exit                                                                   -"
    echo "- ------------------------------------------------------------------------- -"
	# get input from the user 
	read -p "Enter your choice [1-100] " choice
	
	# get input from the user 
	case $choice in

		1)
			clear
			echo "---------------------------------------------------------------------------------------"
			echo "Menu Aprovisionamiento "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./$MenuAprovi

			echo "---------------------------- Fin del Script ---------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
			
		2)
			
			clear
			echo "---------------------------------------------------------------------------------------"
			echo "Subir cambios a github >> https://github.com/giovanemere/Aprovisionamiento_Linux.git <<"
			echo "---------------------------------------------------------------------------------------"
			read -p "Desea subir cambios a github (y/n)? " answer
			echo "-----------------------------------------------------------------------------"

			if [[ $answer =~ ^[Yy]$ ]]
				then

				echo "---------------------------------------------------------------------------------------"
				read -p ">> Digite si es la primera vez [Y o N] : " clone
				read -p ">> Digite el comentario : " comment				
				echo "---------------------------------------------------------------------------------------"

				echo "cd $folder && ./PushGit.sh $username $token $repo \"$comment\""
				cd $folder && ./PushGit.sh $username $token $repo "$comment" $clone

			fi

			echo "---------------------------- Fin del Script ---------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
			
		3)
			
			clear
			echo "---------------------------------------------------------------------------------------"
			echo "Menu Docker "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./$MenuDocker

			echo "---------------------------- Fin del Script ---------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		
		4)  
			
			clear
			echo "---------------------------------------------------------------------------------------"
			echo "Menu Rancher "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./$MenuRanche

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
			
		5)
			
			clear
			echo "---------------------------------------------------------------------------------------"
			echo "Instalar kubectl   "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./Installkubectl.sh

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		6)
			
			clear
			echo "---------------------------------------------------------------------------------------"
			echo "Instalar kubectl   "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./Installhelm.sh

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		7)
			
			clear
			echo "---------------------------------------------------------------------------------------"
			echo "Instalar Artifactory   "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./InstallArtifactory.sh

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		8)
			
			clear			echo "---------------------------------------------------------------------------------------"
			echo "Instalar Artifactory   "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./InstallArtifactoryXray.sh

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		9)
			
			clear			
			echo "---------------------------------------------------------------------------------------"
			echo "Instalar Jenkins   "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./InstallJenkins.sh

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		10)
			
			clear			
			echo "---------------------------------------------------------------------------------------"
			echo "Instalar Jenkins   "
			echo "---------------------------------------------------------------------------------------"

			cd $folder && ./InstallPortainer.sh

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		
		11)
			
			clear			
			echo "---------------------------------------------------------------------------------------"
			echo "Iniciar Minikube   "
			echo "---------------------------------------------------------------------------------------"

			#https://minikube.sigs.k8s.io/docs/start/
			minikube start --memory=1928mb

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		
		12)
			
			clear			
			echo "---------------------------------------------------------------------------------------"
			echo "Dashboard Minikube   "
			echo "---------------------------------------------------------------------------------------"

			minikube dashboard

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		13)
			
			clear			
			echo "---------------------------------------------------------------------------------------"
			echo "Dashboard Minikube   "
			echo "---------------------------------------------------------------------------------------"

			minikube stop

			echo "-------------------------- Fin del Script -----------------------------------"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		14)
			
			cd $folder && $folder/compose/$MenuAdminDocker
			
			echo ---------- Fin del Script ----------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		Y)
			
			echo --- Apagar Servidor
				sudo shutdown now
			sleep 10
			
			echo ---------- Fin del Script ----------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		15)
			
			echo --- Reinciar Servidor
				sudo reboot
			sleep 10

			echo ---------- Fin del Script ----------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		16)
			
			read -p "Digite el usuario a cambiar password: " Usuario
				sudo passwd $Usuario
			sleep 5

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
