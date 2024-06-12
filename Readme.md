## Proyecto de página de PortalGP

Este proyecto consiste en una página web hecha con Symfony (backend), Angular (frontend) y Docker para mostrar información de última hora sobre la Fórmula 1 con una parte de red social para seguir a los usuarios que queramos
## Requisitos

- Tener Docker instalado
- Tener NPM 10.2.4 instalado
- Tener NodeJS 20.11.1 instalado
- Tener Angular CLI 17.3.7 instalado
- Tener Git instalado
## Instalación con Script (Opción 1)

- Lo único que tenemos que hacer una vez clonado este repositorio dentro de una carpeta vacía es ejecutar el script "start.sh" que está dentro y se te abrirá automáticamente la página cuando esté cargado todo.
## Instalación manual, sin script (Opción 2)

- Lo primero que tenemos que hacer es descargar la imagen del contenedor de backend, para ello ejecutamos el comando: 

```bash
        sudo docker pull josecarlos2907/backend_pgp:12.06.2
```

- Después creamos la red para el contenedor con el siguiente comando: 
```bash
        docker network create -–driver bridge -–subnet 172.20.0.0/16 -–gateway 172.20.0.1 red_pgp
```

- Una vez creada la red procedemos a crear el contenedor y ponerlo en marcha con la imagen descargada anteriormente con el siguiente comando: 
```bash
        sudo docker run -d --name backend -p 8081:80 -p 8082:3306 -p 8083:8000 --ip 172.20.0.2 --net red_pgp --entrypoint /bin/sh josecarlospg2907/backend_pgp:12.06.2 -c "/opt/lampp/lampp start && cd /home/usuario/symfony/API_PortalGP && symfony server:start --port=8000"
```

- Ya tenemos la parte del backend en funcionamiento, ahora vamos a poner la parte del frontend, para ello ejecutamos los siguientes comandos en el siguiente orden:
```bash
        cd ..
        git clone https://github.com/JoseCarlos2907/Angular_PortalGP.git
        cd Angular_PortalGP
        npm i
        ng s -o
```


- Y con esto ya estaría en funcionamiento la página al completo, para disfrutar de ella se te abre el navegador automaticamente o si lo quieres abrir a mano, debes irte al navegador y escribir en la barra de búsqueda lo siguiente: http://localhost:4200