#!/bin/bash
# Se comprueba si el script se está ejecutando como usuario administrador (root tiene id = 0)
if [ $(id -u) != 0 ]
then
	echo "Este script debe ser ejecutado como usuario administrador."
	echo "Para ejecutar el script: sudo bash ./amule-daemon.sh"
	echo "Si el script tiene permiso de ejecucion basta con: sudo ./amule-daemon.sh"
	echo "Para dar permiso de ejecucion: chmod +x amule-daemon.sh"
	exit 1
fi

comandos="echo 'Creando fichero de configuracion de amule-daemon ...' 2>>log.txt;"
# Se crea copia de seguridad del fichero de configuracion
comandos+="cp /etc/default/amule-daemon /etc/default/amule-daemon.backup 2>>log.txt;"
# Se copia el fichero de configuracion de aMule que acepta usuarios remotos con contraseña "admin" por defecto
# (Este paso ya se hace desde el script principal)
# comandos+="mkdir /home/$1/.aMule 2>>log.txt;"
# comandos+="cp ./conf/amule.conf /home/$1/.aMule 2>>log.txt;"
# Se agrega al final del fichero las líneas con rutas referentes al usuario
comandos+="echo TempDir=/home/$1/.aMule/Temp >> /home/$1/.aMule/amule.conf 2>>log.txt;"
comandos+="echo IncomingDir=/home/$1/.aMule/Incoming >> /home/$1/.aMule/amule.conf 2>>log.txt;"
comandos+="echo OSDirectory=/home/$1/.aMule/ >> /home/$1/.aMule/amule.conf 2>>log.txt;"
comandos+="chown $1:$1 -R /home/$1/.aMule 2>>log.txt;"
# Amule daemon solo puede ser arrancado por un usuario. No tiene sentido copiar configuraciones en /etc/skell destinado a otros futuros usuarios creados.
# Se crea el fichero de configuración de amule-daemon con el usuario especificado
comandos+="echo '# Configuration for /etc/init.d/amule-daemon' >/etc/default/amule-daemon 2>>log.txt;"
comandos+="echo '# The init.d script will only run if this variable non-empty.'>>/etc/default/amule-daemon 2>>log.txt;"
comandos+="echo AMULED_USER=\"$1\" >>/etc/default/amule-daemon 2>>log.txt;"
comandos+="echo '# You can set this variable to make the daemon use an alternative HOME.'>>/etc/default/amule-daemon 2>>log.txt;"
comandos+="echo '# The daemon will use $AMULED_HOME/.aMule as the directory, so if you'>>/etc/default/amule-daemon 2>>log.txt;"
comandos+="echo '# want to have $AMULED_HOME the real root (with an Incoming and Temp'>>/etc/default/amule-daemon 2>>log.txt;"
comandos+="echo '# directories), you can do `ln -s . $AMULED_HOME/.aMule`.'>>/etc/default/amule-daemon 2>>log.txt;"
comandos+="echo AMULED_HOME=\"\">>/etc/default/amule-daemon 2>>log.txt;"
# Se copian los lanzadores del menú para iniciar y finalizar amule-daemon
comandos+="cp ./menu/amuled-start.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/amuled-stop.desktop /usr/share/applications 2>>log.txt;"

# amule-daemon, por defecto arranca desde la consola.
# No necesita lanzador de autoarranque en Xfce a no ser que borremos los enlaces simbólicos que hacen que amule-daemon inicie desde consola.
# Para hacer esto, bastaría con ejecutar el siguiente comando como administrador: # update-rc.d -f amule-daemon remove
# La operación contraria, es decir, volver a crear los enlaces simbólicos sería:  # update-rc.d -f amule-daemon defaults

# En el caso de que necesitaramos lanzador de autoarranque de Xfce, descomentamos las siguientes líneas: ¡Ojo! solo funciona para el usuario habilitado de amule-daemon
# comandos+="echo 'Creando autoarranque de amule-daemon en el inicio de sesion ...' 2>>log.txt;"
# comandos+="mkdir -p /home/$1/.config/autostart 2>>log.txt;"
# comandos+="echo '[Desktop Entry]' > /home/$1/.config/autostart/amule-daemon.desktop 2>>log.txt;"
# comandos+="echo 'Name=aMule daemon' >> /home/$1/.config/autostart/amule-daemon.desktop 2>>log.txt;"
# comandos+="echo 'Exec=bash /etc/init.d/amule-daemon start' >> /home/$1/.config/autostart/amule-daemon.desktop 2>>log.txt;"
# comandos+="echo 'Type=Application' >> /home/$1/.config/autostart/amule-daemon.desktop 2>>log.txt;"
# comandos+="echo 'Categories=Network;FileTransfer' >> /home/$1/.config/autostart/amule-daemon.desktop 2>>log.txt;"
# comandos+="echo 'Icon=' >> /home/$1/.config/autostart/amule-daemon.desktop 2>>log.txt;"
# comandos+="echo 'Comment=Descargas P2P por protocolo eDonkey.' >> /home/$1/.config/autostart/amule-daemon.desktop 2>>log.txt;"
# comandos+="chown $1:$1 -R /home/$1/.config"
eval $comandos | dialog --title "$2" --backtitle "$3" --progressbox 20 76
