#!/bin/bash

username="$(id -u -n)" #No siempre va a ser euti el user, asi vale para cualquiera
sudo rm /home/$username/errores/*
rmdir /home/$username/errores/
mkdir -p /home/$username/errores/
sudo chmod 777 -R /var/log/apache2/ #Obtengo privilegios
cp /var/log/apache2/error.log /home/$username/errores/
cp /var/log/apache2/error.log.* /home/$username/errores/
cd /home/$username/errores/
gunzip error.log.*.gz
cat * > all_errors.txt

sudo chmod 755 -R /var/log/apache2/ #Restablecemos privilegios

#etc
