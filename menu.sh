#!/bin/bash
# Menu de la aplicacion
#DUDA: Qué diferencia hay entre /bin/bash y /bin/sh?
#Mirar si poniendo UTF-32 se pueden poner tildes y la apertura de interrogacion

sudo apt-get install dialog

var1=$(pwd)
echo $var1

OPCION="temp/opcion.txt"
opt=0
while [ $opt -ne "12" ]; do
#Mostramos el menu.
dialog --backtitle "Instalacion y Gestion de Logs" --title "Menu Principal" \
--menu "\nQue desea hacer?" 20 70 20 \
	1 "Instalar Apache"\
	2 "Configurar Apache"\
	3 "Poner en marcha y testear el servicio web Apache"\
	4 "Instalar PHP"\
	5 "Configurar PHP"\
	6 "Testear el modulo PHP"\
	7 "Instalar MySQL"\
	8 "Configurar MySQL"\
	9 "Testear el servicio MySQL"\
	10 "Instalar la aplicacion"\
	11 "Gestionar intentos de conexion y mostrar Logs"\
	12 "Salir"\
	2> $OPCION


	if [ $? -eq 0 ]; then
	opt=`more $OPCION`
	#cd log_printer
	#rm $OPCION
	#cd ..

		case $opt in
		1)  dialog --infobox "Ha elegido instalar Apache" 6 30
		    sleep 3
		    chmod +x 1_Install_Apache.sh
		    ./1_Install_Apache.sh
            	    ;;
		2)  dialog --infobox "Ha elegido Configurar Apache" 6 30
		    sleep 3
		    chmod +x 2_Configure_Apache.sh
		    ./2_Configure_Apache.sh
	            ;;
		3)  dialog --infobox "Ha elegido probar el servicio web Apache" 6 30
		    sleep 3
		    dialog --infobox "A continuacion se haran unos tests" 6 30
		    sleep 3
		    chmod +x 3_Test_Apache.sh
		    ./3_Test_Apache.sh
	            ;;
		4)  dialog --infobox "Ha elegido instalar PHP" 6 30
		    sleep 3
		    chmod +x 4_Install_PHP.sh
		    ./4_Install_PHP.sh
	            ;;
		5)  dialog --infobox "Ha elegido configurar PHP" 6 30
		    sleep 3
		    chmod +x 5_Configure_PHP.sh
		    ./5_Configure_PHP.sh
	            ;;
		6)  dialog --infobox "Ha elegido probar el modulo PHP" 6 30
		    sleep 3
		    chmod +x 6_Test_PHP.sh
		    ./6_Test_PHP.sh
	            ;;
		7)  dialog --infobox "Ha elegido instalar MySQL" 6 30
		    sleep 3
		    chmod +x 7_Install_MYSQL.sh
		    ./7_Install_MYSQL.sh
	            ;;
		8)  dialog --infobox "Ha elegido Configurar MySQL" 6 30
		    sleep 3
		    chmod +x 8_Configure_MYSQL.sh
		    ./8_Configure_MYSQL.sh
	            ;;
		9)  dialog --infobox "Ha elegido probar el servicio MySQL" 6 30
		    sleep 3
		    chmod +x 9_Test_MYSQL.sh
		    ./9_Test_MYSQL.sh
	            ;;
		10)  dialog --infobox "Ha elegido instalar la aplicacion" 6 30
		    sleep 3
		    chmod +x 10_Install_App.sh
		    ./10_Install_App.sh
	            ;;
		11)  dialog --infobox "Ha elegido gestionar los intentos de conexion y mostrar los Logs" 6 30
		    sleep 3
		    chmod +x 11_Show_Logs.sh
		    ./11_Show_Logs.sh
	            ;;
		12) dialog --backtitle "Programa de instalacion y mantenimiento para aplicaciones Web" \
			   --msgbox "Programa creado por: \n -Mikel Barcina \n -Jose Angel Gumiel \n \n ISO - 2014" 12 34
			   opt=13
	    	    echo "Programa finalizado"
		    opt=13
           	    exit
            	    ;;
	   	 esac
	else
		opt=13
	fi
done

#etc
