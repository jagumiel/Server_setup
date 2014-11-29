#!/bin/bash

sudo service mysql start
sudo /etc/init.d/mysql start

echo "Se ha iniciado MySQL"

DIR_TEMP="temp"

nomBD=""
nomUser=""
pass=""
passwordSQL=""

dialog --backtitle "Configuracion de MySQL" --title "Crear usuario" \
--form "\nIntroduzca los datos:" 25 60 10 \
	"Nombre de la base de datos:" 		1 1	"$nomBD" 	1 30 15 0 \
	"Nombre del usuario (root?):"    	2 1	"$nomUser"  	2 30 15 0 \
	"Contrasena deseada para user:"    	3 1	"$pass"  	3 30 25 0 \
	"Contrasena del servidor:"     		4 1	"$passwordSQL" 	4 30 25 0 \
2>$DIR_TEMP/datos.txt #El form dialog da todas las salidas en una variable, en este caso archivo de texto.

nomBD=$(sed -n '1p' $DIR_TEMP/datos.txt) #Coge la linea n de un fichero de texto
nomUser=$(sed -n '2p' $DIR_TEMP/datos.txt)
pass=$(sed -n '3p' $DIR_TEMP/datos.txt)
passwordSQL=$(sed -n '4p' $DIR_TEMP/datos.txt)
rm $DIR_TEMP/datos.txt #Por seguridad, no interesa dejar estos datos visibles.

#Ahora creamos los comandos de mySQL con los datos proporcionados.
C1="CREATE DATABASE IF NOT EXISTS $nomBD;"
C2="GRANT ALL PRIVILEGES ON *.* TO '$nomUser'@'localhost' IDENTIFIED BY '$pass';"
C3="FLUSH PRIVILEGES;" #Recarga para que los cambios en los permisos tengan efecto.

Instruccion="${C1}${C2}${C3}"

mysql -u root -p$passwordSQL -e "$Instruccion"
dialog --infobox "A continuacion se mostraran todas las bases de datos existentes. Compruebe que la que acaba de crear se encuentra en la lista." 10 50
sleep 6
mysql -u root -p$passwordSQL -e "show databases;"
read -p "Pulse \"Enter\" cuando haya acabado de revisar la tabla."

dialog --title "Test PHP" \
       --yesno "Se han mostrado las bases de datos. Se encuentra la que acaba de crear en la lista?" 7 60
        respuesta3=$?
	case $respuesta3 in
		0) dialog --infobox "Base de Datos creada correctamente." 8 34
		   sleep 3;;
		1) dialog --infobox "No se ha creado la Base de Datos. Compruebe que la contrasena sea correcta." 8 34
		   sleep 3;;
	      255) echo "Tecla [ESC] pulsada.";;
	esac
#etc
