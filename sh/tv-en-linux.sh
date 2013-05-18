#!/bin/bash
# Se comprueba si el script se está ejecutando como usuario administrador (root tiene id = 0)
if [ $(id -u) != 0 ]
then
	echo "Este script debe ser ejecutado como usuario administrador."
	echo "Para ejecutar el script: sudo bash ./tv-en-linux.sh"
	echo "Si el script tiene permiso de ejecucion basta con: sudo ./tv-en-linux.sh"
	echo "Para dar permiso de ejecucion: chmod +x tv-en-linux.sh"
	exit 1
fi

# Se descarga el script
comandos+="mkdir /usr/share/TVenLinux 2>>log.txt;"
comandos+="wget -O /usr/share/TVenLinux/TVenLinux.sh http://www.tvenlinux.com/TVenLinux.sh 2>&1;"
comandos+="chmod +x /usr/share/TVenLinux/TVenLinux.sh 2>>log.txt;"

# Se copia el lanzador del menú para iniciar la aplicación
comandos+="cp ./menu/tv-en-linux.desktop /usr/share/applications 2>>log.txt;"

# Se ejecutan todos los comandos
eval $comandos | dialog --title "$2" --backtitle "$3" --progressbox 20 76
