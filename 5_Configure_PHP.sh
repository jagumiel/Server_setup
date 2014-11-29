#!/bin/bash

estado="$(sudo aptitude show php5-mysql | grep Estado)"
if [ "$estado" == "Estado: instalado" ]; then
	dialog --infobox "El paquete \"php5-mysql\" ya esta instalado en su equipo. No hay que hacer nada mas." 8 34
	sleep 4 #Así mantenemos el texto por pantalla ese tiempo.
else
	dialog --infobox "El paquete \"php5-mysql\" no esta instalado y es necesario. Se instalara a continuacion"
	sleep 3
	sudo apt-get update | dialog --infobox "Actualizando repositorios, espere por favor." 3 60 #Es posible que no haga falta, pero es conveniente tener actualizados los repositorios.
	sudo apt-get -y install php5-mysql | dialog --infobox "Instalando paquete php5-mysql, espere por favor." 3 60
	estado="$(sudo aptitude show php5-mysql | grep Estado)"
	if [ "$estado" == "Estado: instalado" ]; then
		dialog --infobox "El paquete \"php5-mysql\" se ha instalado correctamente." 8 34
		sleep 4
	else
		dialog --infobox "El paquete \"php5-mysql\" no se ha instalado. Hubo algun problema durante la instalacion." 8 34
		sleep 4
	fi
fi

#etc


