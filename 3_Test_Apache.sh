#!/bin/bash
#Test de Apache
	
	var1=$(sudo service apache2 start) #Arrancamos el servicio, por si acaso.
	dialog --infobox "$var1" 6 34
	var2=$(ps ax | grep httpd) #Mirar si sale httpd
	dialog --title "Test Apache" \
	       --yesno "$var2 \n Puede leer \"httpd\" en la linea superior?" 12 80
	#0 significa si
	#1 significa no
	#255 significa Esc
	respuesta1=$?
	case $respuesta1 in
		0) echo "33" | dialog --gauge "Prueba satisfactoria. \nHa pasado el primer test." 10 70 0
		   sleep 3 #La progress bar es por estetica y por probar diferentes opciones de los dialogs.
		   #Mirar que Apache esté escuchando a los puertos 80 y 443. http y https.
		   varHTTP=$(netstat -l | grep -w  http) 
		   varHTTPS=$(netstat -l | grep -w  https)
		   dialog --title "Test Apache" \
	       		  --yesno "$varHTTP \n$varHTTPS \n \n 
			  Esta escuchando en HTTP y HTTPS?" 12 80
			  respuesta2=$?
			  case $respuesta2 in
				  0) echo "66" | dialog --gauge "Prueba satisfactoria. \nHa pasado el segundo test." 10 70 0
				     sleep 3
				     sensible-browser http://127.0.0.1/
				     dialog --title "Test Apache" \
					--yesno "Ha aparecido el mensaje \"It works\" en su navegador?" 7 60
				        respuesta3=$?
					case $respuesta3 in
						0) echo "100" | dialog --gauge "Prueba satisfactoria. \nHa pasado el tercer test." 10 70 0
				     sleep 3
				     dialog --infobox "Tests finalizados. Apache funciona correctamente." 8 34
				     sleep 2;;
						1) 	dialog --infobox "Prueba insatisfactoria. No ha superado el test." 8 34
							sleep 3;;
						255) echo "Tecla [ESC] pulsada.";;
					esac;;
				  1) dialog --infobox "Prueba insatisfactoria. No ha superado el test." 8 34
				     sleep 3;;
				  255) echo "Tecla [ESC] pulsada.";;
			  esac
		;;
		1) dialog --infobox "Prueba insatisfactoria. No ha superado el test." 8 34
		   sleep 3;;
		255) echo "Tecla [ESC] pulsada.";;
	esac
function prueba3(){
	#curl 127.0.0.1 #Esto muestra la página web. Como es consola, solo muestra el codigo html.
	#Hemos probado en una instalacion limpia de Ubuntu y no reconoce "curl". Abrimos con el navegador.
	sensible-browser http://127.0.0.1/
	dialog --title "Test Apache" \
	--yesno "Ha aparecido el mensaje \"It works\" en su navegador?" 7 60
	respuesta=$?
	case $respuesta in
		0) echo "Prueba satisfactoria.";;
		1) echo "Prueba insatisfactoria. No ha superado el test.";;
		255) echo "Tecla [ESC] pulsada.";;
	esac
}

#etc.
