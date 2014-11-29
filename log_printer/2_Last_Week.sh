#!/bin/bash

declare -i dias=7
echo "una semana tiene $dias dias"

fecha=$(date -d "$dias day ago" '+%a %b %d %H:%M:%S %Y')
echo "A continuacion se imprimiran los logs desde $fecha"

while [ 0 -le $dias ] #le=less or equals
do
	./print_log_by_date.sh $fecha
	dias=$((dias-1))
	fecha=$(date -d "$dias day ago" '+%a %b %d %H:%M:%S %Y')
done

#etc
