#!bin/bash
# Eliminar Variables
./unset.sh

mkdir /downloads/sonarqube -p
cd /downloads/sonarqube

sudo mkdir -p /usr/local/colpatria/
sudo chown -R giovanemere:giovanemere /usr/local/colpatria/
sudo curl -L  https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip -o /usr/local/colpatria/sonar-scanner-cli-4.2.0.1873-linux.zip

cd /usr/local/colpatria/
unzip sonar-scanner-cli-4.2.0.1873-linux.zip
