#!/bin/bash
# Menu de seleccion de logs

var1=$(pwd)
echo $var1

OPCION="temp/opcion.txt"
opt=0
while [ $opt -ne 6 ]; do
#Mostramos el menu.
dialog --backtitle "Imprimir logs" --title "Menu" \
--menu "\nElija una opcion" 20 70 20 \
	1 "Intentos de hoy"\
	2 "Intentos de la ultima semana"\
	3 "Intentos del ultimo mes"\
	4 "EXTRA. Imprimir ultimos n dias"\
	5 "Mostrar todo"\
	6 "Volver atras"\
	2> $OPCION

	if [ $? -eq 0 ]; then
	opt=`more $OPCION`
	cd log_printer
	chmod +x print_log_by_date.sh
	chmod +x logs_compilator.sh
	#rm $OPCION
	    	case $opt in
		1)  dialog --infobox "Ha elegido mostrar los intentos de conexion de hoy" 6 30
		    sleep 3
		    chmod +x 1_Today.sh
		    ./1_Today.sh
		    echo " "
		    echo " "
		    echo "Se ha terminado de imprimir el log de errores."
		    echo " "
		    read -p "Cuando haya terminado de revisar el log pulse la tecla \"Enter\" para continuar."
		    cd ..
		    ;;

		 2) dialog --infobox "Ha elegido mostrar los intentos de conexion de la ultima semana" 6 30
		    sleep 3
		    chmod +x 2_Last_Week.sh
		    ./2_Last_Week.sh
		    echo " "
		    echo " "
		    echo "Se ha terminado de imprimir el log de errores."
		    echo " "
		    read -p "Cuando haya terminado de revisar el log pulse la tecla \"Enter\" para continuar."
		    cd ..
		    ;;
		 3) dialog --infobox "Ha elegido mostrar los intentos de conexion del ultimo mes" 6 30
		    sleep 3
		    chmod +x 3_Last_Month.sh
		    ./3_Last_Month.sh
		    echo " "
		    echo " "
		    echo "Se ha terminado de imprimir el log de errores."
		    echo " "
		    read -p "Cuando haya terminado de revisar el log pulse la tecla \"Enter\" para continuar."
		    cd ..
		    ;;
		 4) dialog --infobox "Ha elegido mostrar tantos dias como desee." 6 30
		    sleep 3
		    chmod +x 4_user_decides.sh
		    ./4_user_decides.sh
		    echo " "
		    echo " "
		    echo "Se ha terminado de imprimir el log de errores."
		    echo " "
		    read -p "Cuando haya terminado de revisar el log pulse la tecla \"Enter\" para continuar."
		    cd ..
		    ;;
		 5) dialog --infobox "Ha elegido mostrar todos los intentos de conexion" 6 30
		    sleep 3
		    chmod +x 5_All.sh
		    ./5_All.sh
		    echo " "
		    echo " "
		    echo "Se ha terminado de imprimir el log de errores."
		    echo " "
		    read -p "Cuando haya terminado de revisar el log pulse la tecla \"Enter\" para continuar."
		    cd ..
		    ;;
		 6) echo "Volver al menu principal"
		    cd ..
		    break
		    ;;
	    esac
	else
		opt=6
	fi
done

#etc
