#! /bin/sh

# Minikube update script file

FILE=minikube-linux-amd64
if [[ -f "$FILE" ]]; then
    echo "$FILE exists."
else 
    sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \ 
fi
sudo minikube delete && \ 
sudo rm -rf /usr/local/bin/minikube && \ 
sudo chmod +x minikube && \ 
sudo cp minikube /usr/local/bin/ && \ 
sudo rm minikube && \  
sudo minikube start --force --driver=docker start &&\

# Enabling addons: ingress, dashboard
sudo minikube addons enable ingress && \
sudo minikube addons enable dashboard && \
sudo minikube addons enable metrics-server && \
# Showing enabled addons
echo '\n\n\033[4;33m Enabled Addons \033[0m' && \
sudo minikube addons list | grep STATUS && minikube addons list | grep enabled && \

# Showing current status of Minikube
echo '\n\n\033[4;33m Current status of Minikube \033[0m' && minikube status
