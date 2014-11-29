#!/bin/bash
# Mostrar todos los intentos fallidos de conexion

./logs_compilator.sh
username="$(id -u -n)" #No siempre va a ser euti el user, asi vale para cualquiera
cd /home/$username/errores
less all_errors.txt | grep ""
