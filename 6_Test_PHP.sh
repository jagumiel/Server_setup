#!/bin/bash
#Test de PHP

username="$(id -u -n)"
sudo adduser $username www-data #Anade al user al grupo www-data
#sudo chown $username.users /var/www
#sudo chown -R www-data:www-data /var/www
sudo chmod -R g+rwx /var/www #Da permisos al grupo
sudo chmod 777 -R /var/www/
#sudo cp testphp.php /var/www/
echo "<?php phpinfo();?>" > /var/www/testphp.php #No tengo permiso, con sudo antes, tampoco me deja.
sensible-browser /var/www/testphp.php #Se podría poner firefox, pero mejor el predeterminado, que sabemos que esta instalado.
sudo chmod 755 -R /var/www/ #Permisos de rwx para admin y rx para el resto.

dialog --title "Test PHP" \
       --yesno "Ha aparecido el archivo php en su navegador para descargar y tiene una linea codigo dentro?" 7 60
        respuesta3=$?
	case $respuesta3 in
		0) dialog --infobox "Prueba satisfactoria. \n *Ha pasado el test." 8 34
		   sleep 3;;
		1) dialog --infobox "Prueba insatisfactoria. *No ha superado el test." 8 34
		   sleep 3;;
	      255) echo "Tecla [ESC] pulsada.";;
	esac

#etc. 

