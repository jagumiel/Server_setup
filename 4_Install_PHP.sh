#!/bin/bash
#Instalacion de MySQL

estado="$(sudo aptitude show php5 | grep Estado)"
#echo "$estado" #Comprobacion del contenido de la variable estado.
if [ "$estado" == "Estado: instalado" ]; then
	dialog --infobox "PHP ya esta instalado en su equipo. No hay que hacer nada mas." 8 34
	sleep 4
else
	dialog --infobox "Apache ya esta instalado en su equipo. No hay que hacer nada mas." 8 34
	sleep 4
	#Es conveniente tener actualizados los repositorios.
	sudo apt-get update | dialog --infobox "Actualizando repositorios, espere por favor." 3 60 
	#sudo apt-get -y install apache2
	sudo apt-get -y install php5 libapache2-mod-php5 php5-mysql | dialog --infobox "Instalando PHP, espere por favor." 3 60
	estado="$(sudo aptitude show php5 | grep Estado)"
	if [ "$estado" == "Estado: instalado" ]; then
		dialog --infobox "PHP se ha instalado correctamente." 8 34
		sleep 4
	else
		dialog --infobox "PHP no se ha instalado. Hubo algun problema durante la instalacion." 8 34
		sleep 4
	fi
fi

#etc.
