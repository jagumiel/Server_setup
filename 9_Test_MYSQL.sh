#!/bin/bash


var1=$(netstat -l | grep mysql)
dialog --backtitle "Test MySQL" --infobox "$var1" 6 80
sleep 4

netstat -l | grep mysql

if test $? -eq 0; then
	dialog --backtitle "Test MySQL" --infobox "Test Correcto. \n \nMySQL funciona bien." 6 80
	sleep 4
else
	dialog --backtitle "Test MySQL" --infobox "Test Incorrecto." 6 80

fi

# $? es el estado de la salida del ultimo comando ejecutado. 0=correcto, 1=incorrecto.

#etc.
