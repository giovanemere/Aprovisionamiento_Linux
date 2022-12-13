# README.MD

## Github

### Configurar Usuario Github

username y token en archivo

```bash
cat -b /home/giovanemere/.profile

    24  token="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"
    25  username="giovanemere"
    26  rama="master"
    27  repo="giovanemere/Aprovisionamiento_Linux.git"

git config --global user.name "Edisson Zuniga"
git config --global user.email "giovanemere@gmail.com"
git config --list

```

# Subir Carmbios

```shell
cd /home/giovanemere/Aprovisionamiento_Linux/ && ./PushGit.sh $username $token $repo "update XX"
```

# Menus

Como Ejecutar Menu

```bash
cd /home/giovanemere/Aprovisionamiento_Linux/ && ./Setup.sh
```

MENU: Central de Administracion

```bash
- ------------------------------------------------------------------------- -
- Server Name: [ubuntu-rancher]                                           
- ------------------------------------------------------------------------- -
- MENU: Install Container Linux Ubuntu                                      -
- ------------------------------------------------------------------------- -
- 1. Aprovisionar Servers              -  6.                                -
- 2. Subir Cambios Git                 -  7.                                -
- 3. Install Docker                    -  8.                                -
- 4. Install Rancher                   -  9.                                -
- 5. Install kubectl                   - 10.                                -
- ------------------------------------------------------------------------- -
- General                              -                                    -
- ------------------------------------ - ---------------------------------- -
- 14. Apagar Servidor                  -                                    -
- 15. Reiniciar Servidor               -                                    -
- 16. Cambiar password Usuarios        -                                    -
- ------------------------------------------------------------------------- -
- E. Exit                                                                   -
- ------------------------------------------------------------------------- -
Enter your choice [1-100] 
```

### Instalación de Imagenes docker;

Prueba hello-worlddocker container run hello-world

```
docker container run hello-world

```

### Portainer.io

```
docker pull portainer/portainer
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
docker ps
ufw allow 9000/tcp
http://192.168.0.3:9000/
```

### Rancher docker-compose

```
cd ~/Aprovisionamiento_Linux && ./InstallRancher.sh
- -------------------------------------------------------------------------- -
- Server Name: [ubuntu-rancher]                                      
- -------------------------------------------------------------------------- -
- MENU: Instalar Docker Rancher                                              -
- ------------------------------------ - ----------------------------------- -
- 1. Instalar o Iniciar Rancher        -  4. Estado Servicios Docker         -
- 2. Detener Servicio Rancher          -  5. reinciar Servicios Docker       -
- 3. Eliminar Imagenes                 -  6. Probar Puerto                   -
- ------------------------------------ - ----------------------------------- -
- A. Menu Aprovisionamiento                                                  -
- E. Exit                                                                    -
---------------------------------------------------------------------------- -
```

### Configurar Inicio Sesion Servidores con llaves Visual Studio

```
eval $(ssh-agent)
ssh-keygen -t rsa -b 4096
ssh-add ~/.ssh/id_rsa
$  cat ~/.ssh/id_rsa.pubssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCxtlKq4Lbe+4GM/NyB39h3hIaZay3NJE5d/pkO7xdBpcEmqgj1MItuhExKwjrYJ7UGhLckh3Kdst3u8F1DV47OQZbjAAr7+1Cp1dmBwvnKsjiHO5A9lBm8O3bJX5kNxaxWoqqLBRG4cQH4VHfjIyJucAxb8ICobQPml0A1wVdlPN7hJ1PCJYWp5cxVGKtaSdt6zB/KDMfHtKFNu4umVMb/QGeF8BMHkk4/V+mMTIDkQmX5ownOO0YQi8TjDOIAPt0adqoACvJZABhFz7wvjTHDiQRqy4T4MEeHkrvavFL1CRaM8gTsqGsVkQYxFUt67BNF3KDYXsirBe/NAuRK1u6EvI5QLXrKf3+dgHqPGPzci+kGHLuh8yDONZHwTrIxvdZGQaY8bVpWejcejHOj4olNuI9MshnNJDMnuaWsrXfAtGdjZb4oMDuhl268OQmWHJMbd0ML1Ng/4JqS/eAoAVnxsJYkLWQSALRAp0MuvfVS4BQIJzslGshtfnFvtTcuHc= giova@giovanemere

```

### Autorizar llaves en Servidores

```
ssh giovanemere@192.168.137.30
vi ~/.ssh/authorized_keys
AAAAB3NzaC1yc2EAAAADAQABAAABgQDCxtlKq4Lbe+4GM/NyB39h3hIaZay3NJE5d/pkO7xdBpcEmqgj1MItuhExKwjrYJ7UGhLckh3Kdst3u8F1DV47OQZbjAAr7+1Cp1dmBwvnKsjiHO5A9lBm8O3bJX5kNxaxWoqqLBRG4cQH4VHfjIyJucAxb8ICobQPml0A1wVdlPN7hJ1PCJYWp5cxVGKtaSdt6zB/KDMfHtKFNu4umVMb/QGeF8BMHkk4/V+mMTIDkQmX5ownOO0YQi8TjDOIAPt0adqoACvJZABhFz7wvjTHDiQRqy4T4MEeHkrvavFL1CRaM8gTsqGsVkQYxFUt67BNF3KDYXsirBe/NAuRK1u6EvI5QLXrKf3+dgHqPGPzci+kGHLuh8yDONZHwTrIxvdZGQaY8bVpWejcejHOj4olNuI9MshnNJDMnuaWsrXfAtGdjZb4oMDuhl268OQmWHJMbd0ML1Ng/4JqS/eAoAVnxsJYkLWQSALRAp0MuvfVS4BQIJzslGshtfnFvtTcuHc= giova@giovanemere
```

### Iniciar Sesion con llaves

```
ssh -i ~/.ssh/id_rsa  giovanemere@192.168.137.30
```

# Server CA Privada

Ejecución Menu

```
cd /home/sammy/ && ./SetupSFTPCA.s

 SERVER NAME: dc1   
----------------------------------------
 MENU: Administracion                  -
----------------------------------------
 Administración CA                     -
----------------------------------------
 1. Crear Request                      -
 2. Importar/Firmar Certificados       -
 3. Solo Firmar Certificados           -
 4. Revocar un certificado             -
 5. Listar certificados Revocados      -
----------------------------------------
 Administración Cliene                 -
----------------------------------------
 6. Crear pfx o p12                    -
 7. Crear PKCS#7                       -
 8. Copiar ca,crt a Server Remotos     -
 9. Export pem certificado crt         -
----------------------------------------
 General                               -
 ------------------------------------- -
 14. Apagar Servidor                   -
 15. Reiniciar Servidor                -
 16. Cambiar password Usuarios         -
----------------------------------------
 E. Exit                               -
----------------------------------------
Enter your choice [1-100] ^C
```
