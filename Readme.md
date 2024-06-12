#Proyecto de página de PortalGP
#Este proyecto consiste en una página web hecha con Symfony (backend), Angular (frontend) y Docker para mostrar información de última hora sobre la Fórmula 1 con una parte de red social para seguir a los usuarios que queramos

#Requisitos:
    # Tener Docker instalado
    # Tener NPM 10.2.4 instalado
    # Tener NodeJS 20.11.1 instalado
    # Tener Angular CLI 17.3.7 instalado
    # Tener Firefox instalado

#Pasos instalación con script:
    #Lo primero que tenemos que hacer una vez clonado este repositorio es ejecutar el script "start.sh" que está dentro




#Pasos instalación manual, sin script:
    #Lo primero que tenemos que hacer es descargar la imagen del contenedor de backend, para ello ejecutamos el comando: docker pull josecarlos2907/backend_pgp:12.06.1

    #Después creamos la red para el contenedor con el siguiente comando: docker network create -–driver bridge -–subnet 172.20.0.0/16 -–gateway 172.20.0.1 red_pgp

    #Una vez creada la red procedemos a crear el contenedor con la imagen descargada anteriormente con el siguiente comando: docker run -it –-name backend -p 8081:80 -p 8082:3306 -p 8083:8000 -–ip 172.20.0.2 -–net red_pgp josecarlos2907/backend_pgp:12.06.1

    #En caso de que no se arranque el contenedor directamente ejecutamos los siguientes comandos para arrancar el contenedor: 
        # docker start backend
        # docker exec -it backend bash

    #Y una vez dentro para poner en funcionamiento la API ejecutamos los siguientes comandos:
        # /opt/lampp/lampp start
        # symfony server:start –-port=8000
    
    #Ya tenemos la parte del backend en funcionamiento, ahora vamos a poner la parte del frontend en otro terminal, para ello ejecutamos los siguientes comandos en el siguiente orden:
        # cd PortalGP
        # npm i
        # ng s

    #Y con esto ya estaría en funcionamiento la página al completo, para disfrutar de ella debes irte al navegador y escribir en la barra de búsqueda lo siguiente: localhost:4200