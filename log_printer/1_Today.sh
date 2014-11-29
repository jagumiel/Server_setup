#!/bin/bash

./logs_compilator.sh
fecha=`date +"%a %b %d %H:%M:%S %Y"`
dia=${fecha:8:2}
mes=${fecha:3:4}
anio=${fecha:20:4}

username="$(id -u -n)" #No siempre va a ser euti el user, asi vale para
cd /home/$username/errores


if [ $mes == "ene" ]; then
	mes=$" Jan "

elif [ $mes == "feb" ]; then
	mes=$" Feb "

elif [ $mes == "mar" ]; then
	mes=$" Mar "

elif [ $mes == "abr" ]; then
	mes=$" Apr "

elif [ $mes == "may" ]; then
	mes=$" May "

elif [ $mes == "jun" ]; then
	mes=$" Jun "

elif [ $mes == "jul" ]; then
	mes=$" Jul "

elif [ $mes == "ago" ]; then
	mes=$" Aug "

elif [ $mes == "sep" ]; then
	mes=$" Sep "

elif [ $mes == "oct" ]; then
	mes=$" Oct "

elif [ $mes == "nov" ]; then
	mes=$" Nov "

else
	mes=$" Dec "
fi

hoy="${dia}${mes}${anio}"
echo "Se imprimiran los errores del $hoy"
echo " "
hoy="${mes}${dia}" #El anio no es necesario en absoluto.

username="$(id -u -n)" #No siempre va a ser euti el user, asi vale para cualquiera
cd /home/$username/errores
less all_errors.txt | grep "$hoy" #Debería mostrar los errores de hoy.

