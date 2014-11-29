#!/bin/bash

#EL PROBLEMA EN ESTE SCRIPT ES QUE SI ES DIA 01, EL DIA ES 1, ENTONCES NO LO VA A LEER.
#GOOGLE LONG 2 INTEGER
#SOLUCION INT DIA=7, WHILE DIA!=0 TOMAR LOS VALORES E IMPRIMIR.

./logs_compilator.sh

fecha=$(date +"%a %b %d %H:%M:%S %Y")
declare -i dia=${fecha:8:2}
echo "hoy es $dia"
mes=${fecha:3:4}
declare -i anio=${fecha:20:4}

username="$(id -u -n)" #No siempre va a ser euti el user, asi vale para cualquiera.

sudo mkdir -p /home/$username/errores #El -p crea todos los subdirectorios que falten. Omite error de directorio ya existente.
cd /home/$username/errores
if [ $mes == "ene" ]; then
	mes=" Jan "

elif [ $mes == "feb" ]; then
	mes=" Feb "

elif [ $mes == "mar" ]; then
	mes=" Mar "

elif [ $mes == "abr" ]; then
	mes=" Apr "

elif [ $mes == "may" ]; then
	mes=" May "

elif [ $mes == "jun" ]; then
	mes=" Jun "

elif [ $mes == "jul" ]; then
	mes=" Jul "

elif [ $mes == "ago" ]; then
	mes=" Aug "

elif [ $mes == "sep" ]; then
	mes=" Sep "

elif [ $mes == "oct" ]; then
	mes=" Oct "

elif [ $mes == "nov" ]; then
	mes=" Nov "

else
	mes=" Dec "
fi

fecha="${dia}${mes}"

fecha_ant=$(date  --date="7 days ago ")
#fecha_ant=$(date -d '-7day' +%Y%m%d)
echo "estoy imprimiendo $fecha_ant"
declare -i dia_ant=${fecha_ant:8:2}
echo $dia_ant
mes_ant=${fecha_ant:4:3}
echo $mes_ant
declare -i anio_ant=${fecha_ant:25:4}
echo $anio_ant

if [ $mes_ant == "ene" ]; then
	mes_ant=" Jan "

elif [ $mes_ant == "feb" ]; then
	mes=" Feb "

elif [ $mes_ant == "mar" ]; then
	mes_ant=" Mar "

elif [ $mes_ant == "abr" ]; then
	mes_ant=" Apr "

elif [ $mes_ant == "may" ]; then
	mes_ant=" May "

elif [ $mes_ant == "jun" ]; then
	mes_ant=" Jun "

elif [ $mes_ant == "jul" ]; then
	mes_ant=" Jul "

elif [ $mes_ant == "ago" ]; then
	mes_ant=" Aug "

elif [ $mes_ant == "sep" ]; then
	mes_ant=" Sep "

elif [ $mes_ant == "oct" ]; then
	mes_ant=" Oct "

elif [ $mes_ant == "nov" ]; then
	mes_ant=" Nov "

else
	mes_ant=" Dec "
fi

fecha_ant="${dia_ant}${mes_ant}"
echo "se imprimiran los logs desde $fecha_ant hasta $fecha"
echo ""
echo "Inicio de pruebas:"
read temp

dia_ant=$((dia_ant+1))
echo $dia_ant
read temp
echo "tiene que salir 1"
#$dia_ant=$((dia_ant-dia_ant+1))
declare -i dia_ant=01
echo $dia_ant
read temp


username="$(id -u -n)" #No siempre va a ser euti el user, asi vale para cualquiera.
cd /home/$username/errores/

if [ $mes_ant==$mes ]; then
	while [ $dia_ant != $dia ]
	do
		less all_errors.txt | grep "$fecha_ant"
		dia_ant=$((dia_ant+1))
		fecha_ant="${dia_ant}${mes_ant}"
	done
else
	while [ "$dia_ant" < "31" ] #Y si no tiene 31 dias?
	do
		less all_errors.txt | grep "$fecha_ant"
		dia_ant=$((dia_ant+1))
		fecha_ant="${dia_ant}${mes_ant}"
	done
	
	declare -i dia_ant=01
	$mes_ant=$((mes))

	while [ $dia_ant != $dia ]
	do
		less all_errors.txt | grep "$fecha_ant"
		dia_ant=$((dia_ant+1))
		fecha_ant="${dia_ant}${mes_ant}"
	done

fi


#etc
