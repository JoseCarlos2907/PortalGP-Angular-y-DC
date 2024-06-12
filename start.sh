# Descargas la imagen del contenedor backend
sudo docker pull josecarlospg2907/backend_pgp:12.06.1

# Creas la red para el contenedor
sudo docker network create -–driver bridge -–subnet 172.20.0.0/16 -–gateway 172.20.0.1 red_pgp

# Creas el contenedor en base a la imagen que descargamos anteriormente
sudo docker run -d –-name backend -p 8081:80 -p 8082:3306 -p 8083:8000 -–ip 172.20.0.2 -–net red_pgp josecarlos2907/backend_pgp:12.06.1

sleep 5

# Se ejecutan estos comandos para abrir el servicio y poner en funcionamiento la API

COMANDO1 = "/opt/lampp/lampp start"
COMANDO2 = "symfony server:start –-port=8000"

docker exec backend/bin/sh -c "$COMANDO1 && $COMANDO2"

# Se ejecutan estos comandos para arrancar la aplicación
git pull https://github.com/JoseCarlos2907/Angular_PortalGP.git

cd Angular_PortalGP
npm i
ng s

# Se abre en el navegador
firefox "http://localhost:4200"