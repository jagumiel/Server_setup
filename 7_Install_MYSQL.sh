#!/bin/bash
#Instalacion de MySQL

estado="$(sudo aptitude show mysql-server | grep Estado)"
#echo "$estado" #Comprobacion del contenido de la variable estado.
if [ "$estado" == "Estado: instalado" ]; then
	dialog --infobox "El servidor MySQL ya esta instalado en su equipo." 8 34
	sleep 4 #Así mantenemos el texto por pantalla ese tiempo.
else
	sudo apt-get update | dialog --infobox "Actualizando repositorios, espere por favor." 3 60 #Es posible que no haga falta, pero es conveniente tener actualizados los repositorios.
	dialog --infobox "Se instalara MySQL, espere por favor." 3 60
	sleep 3
	sudo apt-get install mysql-server 
	if [ "$estado" == "Estado: instalado" ]; then
		dialog --infobox "MySQL se ha instalado correctamente." 8 34
		sleep 3
	else
		dialog --infobox "MySQL no se ha instalado. Hubo algun problema durante la instalacion." 8 34
		sleep 3
	fi
fi

#etc.
