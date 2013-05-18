#!/bin/bash
# Se comprueba si el script se está ejecutando como usuario administrador (root tiene id = 0)
if [ $(id -u) != 0 ]
then
	echo "Este script debe ser ejecutado como usuario administrador."
	echo "Para ejecutar el script: sudo bash ./deluged.sh"
	echo "Si el script tiene permiso de ejecucion basta con: sudo ./deluged.sh"
	echo "Para dar permiso de ejecucion: chmod +x deluged.sh"
	exit 1
fi

# Se copia fichero de configuración del script de arranque de deluged
comandos+="cp conf/deluge-daemon /etc/default 2>>log.txt;"

# Se establece el usuario de la aplicación dentro del fichero que se acaba de copiar
comandos+="sed -i \"s/USERNAME/$1/g\" /etc/default/deluge-daemon 2>>log.txt;"	

# Se copia fichero que permite iniciar/parar deluged como demonio
comandos+="cp sh/deluge-daemon /etc/init.d 2>>log.txt;"

# Se añade usuario y contraseña al fichero de autenticación de deluge
# comandos+="mkdir -p /home/$1/.config/deluge 2>>log.txt;"
# comandos+="echo \"$1:deluge:10\" >> /home/$1/.config/deluge/auth 2>>log.txt;"
# comandos+="chown -R $1:$1 /home/$1/.config 2>>log.txt;"

# Se activa la conexión remota
comandos+="sed -i 's/\"allow_remote\": false,/\"allow_remote\": true,/g' /home/$1/.config/deluge/core.conf 2>>log.txt;"

# Se desactiva el modo clásico en Deluge
comandos+="sed -i 's/\"classic_mode\": true,/\"classic_mode\": false,/g' /home/$1/.config/deluge/gtkui.conf 2>>log.txt;"

# Se copian los lanzadores del menú para iniciar y finalizar deluged y cliente web
comandos+="cp ./menu/deluged-start.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/deluged-stop.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/deluge-web.desktop /usr/share/applications 2>>log.txt;"

# Se crean enlaces simbólicos para que deluged se inicie automáticamente desde consola
comandos+="update-rc.d -f deluge-daemon defaults 2>>log.txt;"
# En caso de querer quitar este inicio de deluged más adelante, escribir en consola: # update-rc.d -f deluge-daemon remove

# Se ejecutan todos los comandos
eval $comandos | dialog --title "$2" --backtitle "$3" --progressbox 20 76
