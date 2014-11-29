#!/bin/bash

#mysql -u=root -p=euiti < BDWeb.sql


#Definimos las constantes.
DIR_FICHEROS="ficheros"
DIR_WEB="/var/www"
FICH_DB="basededatos.sql"
FICH_WEB="consultaprofesores.php"

#Instalamos el fichero PHP.
#En caso de no existir el fichero con el usuario de MySQL.

username="$(id -u -n)"
sudo adduser $username www-data #Anade al user al grupo www-data
sudo chmod -R g+rwx /var/www #Da permisos al grupo
sudo chmod 777 -R /var/www/

#Pedimos el usuario y la pass. Se almacena en una variable para no pedirlo mas.
echo "Introduce tu nombre de usuario de MySQL"
read user
echo "Introduce tu contrasena"
read pass

#Creamos el fichero include en el que pondremos la contrasena de MySQL.
echo "<?php \$mysqluser = \"$user\"; \$mysqlpass = \"$pass\"; ?>" > $DIR_FICHEROS/datosBD.php

#Comprobamos que existe, si no esta, la creamos.
if [ ! -d $DIR_WEB ]; then
	sudo mkdir $DIR_WEB
fi

#Movemos el fichero PHP del directorio 'ficheros' al destino /var/www.
sudo cp $DIR_FICHEROS/$FICH_WEB $DIR_WEB/
sudo cp $DIR_FICHEROS/datosBD.php $DIR_WEB/

echo "Aplicacion instalada."



#Ahora instalamos la BD
#Cargamos la base de datos.

#Montamos los parámetros de conexión.
sql_args="-u$user -p$pass"

#Cargamos el fichero .sql.
mysql $sql_args < $DIR_FICHEROS/$FICH_DB
sleep 4
	
echo "base de datos instalada"
sudo chmod 755 -R /var/www/ #Permisos de rwx para admin y rx para el resto.

#etc.
