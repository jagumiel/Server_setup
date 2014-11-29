#!/bin/bash

#declare -i dias
dialog --inputbox \
"Inserte el numero de dias que quiere mostrar" 0 0 2> /tmp/inputbox.tmp.$$
retval=$?
dias=`cat /tmp/inputbox.tmp.$$`
rm -f /tmp/inputbox.tmp.$$
case $retval in
0)
dialog --infobox "A continuacion se imprimiran los logs de los ultimos $dias dias" 6 50
sleep 3
dias=$((dias-1)) #Hacemos esto porque son los ultimos dos dias, inclusive hoy.
fecha=$(date -d "$dias day ago" '+%a %b %d %H:%M:%S %Y')


while [ 0 -le $dias ] #le=less or equals
do
	./print_log_by_date.sh $fecha
	dias=$((dias-1))
	fecha=$(date -d "$dias day ago" '+%a %b %d %H:%M:%S %Y')
done
;;
1)
echo "Operacion cancelada.";;
esac

#etc

