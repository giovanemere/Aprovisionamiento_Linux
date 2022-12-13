#/bin/bash
clear

# Eliminar Variables
./unset.sh

# set variables
username=$1
token=$2
repo=$3
comment=$4
clone=$5

# Ejecucion

cd /home/giovanemere/Aprovisionamiento_Linux
if [[ $clone =~ ^[Yy]$ ]]
then
    git clone https://$username:$token@github.com/$repo

fi
    
    
git status
git add .
git commit -m "add Components"
git push origin master
