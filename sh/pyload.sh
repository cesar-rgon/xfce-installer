#!/bin/bash
# Se comprueba si el script se está ejecutando como usuario administrador (root tiene id = 0)
if [ $(id -u) != 0 ]
then
	echo "Este script debe ser ejecutado como usuario administrador."
	echo "Para ejecutar el script: sudo bash ./utorrent.sh"
	echo "Si el script tiene permiso de ejecucion basta con: sudo ./utorrent.sh"
	echo "Para dar permiso de ejecucion: chmod +x utorrent.sh"
	exit 1
fi

# Se copia fichero que permite iniciar/parar pyLoad como demonio
comandos+="cp sh/pyload-daemon /etc/init.d 2>>log.txt;"

# Se establece el usuario de la aplicación dentro del script que se acaba de copiar
comandos+="sed -i \"s/USERNAME/$1/g\" /etc/init.d/pyload-daemon 2>>log.txt;"	

# Se copian los lanzadores del menú para iniciar y finalizar pyLoad
comandos+="cp ./menu/pyload-cli.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/pyload-start.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/pyload-stop.desktop /usr/share/applications 2>>log.txt;"

# Se Crean enlaces simbólicos para que pyLoad se inicie automáticamente desde consola
comandos+="update-rc.d -f pyload-daemon defaults 2>>log.txt;"
# En caso de querer quitar este inicio de pyLoad más adelante, escribir en consola: # update-rc.d -f pyload-daemon remove

# No se crea lanzador de autoarranque con el inicio de sesión de Xfce ya que inicia automáticamente desde consola.
# En caso de necesitar el autoarranque de Xfce, descomentar las siguientes líneas. 
#comandos+="echo 'Creando autoarranque en el inicio de sesión ...' >>log.txt;"
#comandos+="echo 'Creando autoarranque en el inicio de sesión ...';"
#comandos+="echo '[Desktop Entry]' > /etc/xdg/autostart/pyload-daemon.desktop;"
#comandos+="echo 'Name=pyLoad Daemon' >> /etc/xdg/autostart/pyload-daemon.desktop;"
#comandos+="echo 'Exec=/usr/bin/pyLoadCore --daemon' >> /etc/xdg/autostart/pyload-daemon.desktop;"
#comandos+="echo 'Type=Application' >> /etc/xdg/autostart/pyload-daemon.desktop;"
#comandos+="echo 'Categories=Network;FileTransfer' >> /etc/xdg/autostart/pyload-daemon.desktop;"
#comandos+="echo 'Icon=pyload' >> /etc/xdg/autostart/pyload-daemon.desktop;"
#comandos+="echo 'Comment=Gestor de descargas directas' >> /etc/xdg/autostart/pyload-daemon.desktop;"

# Se ejecutan todos los comandos
eval $comandos | dialog --title "$2" --backtitle "$3" --progressbox 20 76
