#!/bin/bash

# Descargas la imagen del contenedor backend
sudo docker pull josecarlospg2907/backend_pgp:12.06.3

# Creas la red para el contenedor
sudo docker network create --driver bridge --subnet 172.20.0.0/16 --gateway 172.20.0.1 red_pgp

# Creas el contenedor en base a la imagen que descargamos anteriormente
sudo docker run -d --name backend -p 8081:80 -p 8082:3306 -p 8083:8000 --ip 172.20.0.2 --net red_pgp --entrypoint /bin/sh josecarlospg2907/backend_pgp:12.06.3 -c "/opt/lampp/lampp start && cd /home/usuario/symfony/API_PortalGP && symfony server:start --port=8000"

sleep 5

# Se ejecutan estos comandos para arrancar la aplicación
cd ..

git clone https://github.com/JoseCarlos2907/Angular_PortalGP.git

cd Angular_PortalGP
npm i
ng s -o

