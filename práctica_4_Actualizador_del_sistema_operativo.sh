#/bin/bash

# Script para actualizar el Sistema Operativo

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Update

sudo apt update

# Upgrade

sudo apt upgrade -y

# Limpiar archivos antiguos o deprecated.

sudo apt autoremove

# Actualizar todos los paquetes flatpak.

flatpak update

# Actualizar los paquetes snap.

snap refresh

# Mostrar un mensaje al finalizar el script.

echo -e "\n ${blueColour} Se han realizado todas las actualizaciones. ${endColour} /n"
