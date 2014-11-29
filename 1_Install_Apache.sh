#!/bin/bash
#Instalacion de Apache

sudo apt-get install -y aptitude | dialog --infobox "Instalando Aptitude, espere por favor." 3 60 #Una instalacion limpia de Ubuntu no tiene aptitude.
estado="$(sudo aptitude show apache2 | grep Estado)"
#echo "$estado" #Comprobacion del contenido de la variable estado.
if [ "$estado" == "Estado: instalado" ]; then
	dialog --infobox "Apache ya esta instalado en su equipo. A continuacion se iniciara Apache." 8 34
	sleep 4 #Así mantenemos el texto por pantalla ese tiempo.
	sudo service apache2 start | dialog --infobox "Arrancando el servidor web Apache..." 8 34
	sleep 1	
else
	echo "El progama no esta instalado. Se instalara a continuacion"
	sleep 3
	sudo apt-get update | dialog --infobox "Actualizando repositorios, espere por favor." 3 60 #Es posible que no haga falta, pero es conveniente tener actualizados los repositorios.
	sudo apt-get -y install apache2 | dialog --infobox "Instalando Apache, espere por favor." 3 60
	#El -y es una opcion que hace que responda si a cualquier pregunta durante la instalacion.
	
	estado="$(sudo aptitude show apache2 | grep Estado)"
	if [ "$estado" == "Estado: instalado" ]; then
		dialog --infobox "Apache se ha instalado correctamente." 8 34
		sleep 4 #Así mantenemos el texto por pantalla ese tiempo.
		sudo service apache2 start | dialog --infobox "Arrancando el servidor web Apache..." 8 34 
		#Una vez instalado el servidor, arrancarlo, no?
		sleep 1
	else
		dialog --infobox "Apache no se ha instalado. Hubo algun problema durante la instalacion." 8 34
		sleep 4
	fi
fi


#Es posible instalar todo: sudo apt-get install apache2 php5-mysql libapache2-mod-php5 mysql-server
#etc.

