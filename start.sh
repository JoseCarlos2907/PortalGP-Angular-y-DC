# Descargas la imagen del contenedor backend
docker pull josecarlos2907/backend_pgp:12.06.1

# Creas la red para el contenedor
docker network create -–driver bridge -–subnet 172.20.0.0/16 -–gateway 172.20.0.1 red_pgp

# Creas el contenedor en base a la imagen que descargamos anteriormente
docker run -it –-name backend -p 8081:80 -p 8082:3306 -p 8083:8000 -–ip 172.20.0.2 -–net red_pgp josecarlos2907/backend_pgp:12.06.1

# Se ejecutan estos comandos para abrir el servicio y poner en funcionamiento la API
/opt/lampp/lampp start
symfony server:start –-port=8000

# Se ejecutan estos comandos para arrancar la aplicación
cd PortalGP
npm i
ng s

# Se abre en el navegador
firefox "localhost:4200"