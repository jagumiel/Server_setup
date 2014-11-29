#!/bin/bash
#Configuracion de Apache

#Anadir ServerName localhost
cd /etc/apache2/sites-available #Vamos al directorio donde se encuentran los archivos de configuracion

sudo chmod 777 -R /etc/apache2/sites-available/ #Son necesarios los permisos.

estado="$(grep "ServerName localhost" /etc/apache2/sites-available/default)"

	if [ "$estado"=="ServerName localhost" ];then
		#echo "El fichero default ya contiene la linea $estado"
		dialog --infobox "El fichero default ya contiene la siguiente linea: \n -$estado" 6 34
		sleep 1
	else
		echo "ServerName localhost" >> /etc/apache2/sites-available/default
		dialog --infobox "Se ha anadido al fichero default la siguiente linea: \n -$estado" 6 34
		sleep 1
	fi

sudo chmod 755 -R /etc/apache2/sites-available/ #Restauramos los permisos

#Anadir el modulo de seguridad SSL.

var1=$(sudo a2enmod ssl)
dialog --infobox "$var1" 6 34
sleep 1
var1=$(sudo a2ensite default-ssl)
dialog --infobox "$var1" 6 34
sleep 1
var1=$(sudo service apache2 restart)
dialog --infobox "$var1" 6 34
sleep 1
var1=$(sudo service apache2 reload)
dialog --infobox "$var1" 6 34
sleep 1
dialog --infobox "Se ha configurado Apache y su modulo de seguridad." 6 34
sleep 2

#etc. 

#SOURCES:
#http://httpd.apache.org/docs/current/es/install.html#configure
#https://help.ubuntu.com/10.04/serverguide/httpd.html
