#!/bin/bash
# Esta herramienta está hecha para el nível 12-13 de la plataforma OverTheWire.
# El script esta diseñado para descomprimir archivos que han sido comprimidos
# muchas veces.

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
    echo -e "\n\n[!]Saliendo...\n"
    exit 1
}

#Ctrl+C
trap ctrl_c INT

first_file_name="data.gz"  # Archivo que vamos a descomprimir
decompressed_file_name="$(7z l data.gz | tail -n 3 | head -n 1 | xargs | awk 'NF{print $NF}')"

7z x $first_file_name &>/dev/null

echo -e "\n${greenColour}[+] Estos son los archivos que hemos descomprimido: ${endColour}\n"
echo -e "------------------------------------------------------"

while [ $decompressed_file_name ];do
   echo -e "\n${greenColour}[+]${endColour} Nuevo archivo descomprimido:${purpleColour} $decompressed_file_name ${endColour}"
   7z x $decompressed_file_name &>/dev/null
   decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | xargs | awk 'NF{print $NF}')"
done

