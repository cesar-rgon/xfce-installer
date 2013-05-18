#!/bin/bash
# Se comprueba si el script se está ejecutando como usuario administrador (root tiene id = 0)
if [ $(id -u) != 0 ]
then
	echo "Este script debe ser ejecutado como usuario administrador."
	echo "Para ejecutar el script: sudo bash ./qbittorrent.sh"
	echo "Si el script tiene permiso de ejecucion basta con: sudo ./qbittorrent.sh"
	echo "Para dar permiso de ejecucion: chmod +x qbittorrent.sh"
	exit 1
fi

# Se copia fichero que permite iniciar/parar qbittorrent-nox como demonio
comandos+="cp sh/qbittorrent-nox-daemon /etc/init.d 2>>log.txt;"

# Se establece el usuario de la aplicación dentro del script que se acaba de copiar
comandos+="sed -i \"s/USERNAME/$1/g\" /etc/init.d/qbittorrent-nox-daemon 2>>log.txt;"	

# Se copia fichero de configuración de qBittorrent
comandos+="mkdir -p /home/$1/.config/qBittorrent;"
comandos+="cp ./conf/qBittorrent.conf /home/$1/.config/qBittorrent/ 2>>log.txt;"

# Se copian los lanzadores del menú para iniciar y finalizar qbittorrent-nox
comandos+="cp ./menu/qbittorrent-nox-cli.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/qbittorrent-nox-start.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/qbittorrent-nox-stop.desktop /usr/share/applications 2>>log.txt;"

# Se crean enlaces simbólicos para que qbittorrent-nox se inicie automáticamente desde consola
comandos+="update-rc.d -f qbittorrent-nox-daemon defaults 2>>log.txt;"
# En caso de querer quitar este inicio de qbittorrent-nox-daemon más adelante, escribir en consola: # update-rc.d -f qbittorrent-nox-daemon-daemon remove

# No se crea lanzador de autoarranque con el inicio de sesión de Xfce ya que inicia automáticamente desde consola.
# En caso de necesitar el autoarranque de Xfce, descomentar las siguientes líneas. 
#comandos+="echo 'Creando autoarranque en el inicio de sesión ...' >>log.txt;"
#comandos+="echo 'Creando autoarranque en el inicio de sesión ...';"
#comandos+="echo '[Desktop Entry]' > /etc/xdg/autostart/qbittorrent-nox.desktop;"
#comandos+="echo 'Name=Qbittorrent Nox Daemon' >> /etc/xdg/autostart/qbittorrent-nox.desktop;"
#comandos+="echo 'Exec=qbittorrent-nox --webui-port=8081' >> /etc/xdg/autostart/qbittorrent-nox.desktop;"
#comandos+="echo 'Type=Application' >> /etc/xdg/autostart/qbittorrent-nox.desktop;"
#comandos+="echo 'Categories=Network;FileTransfer' >> /etc/xdg/autostart/qbittorrent-nox.desktop;"
#comandos+="echo 'Icon=' >> /etc/xdg/autostart/qbittorrent-nox.desktop;"
#comandos+="echo 'Comment=Descargas P2P de archivos .torrent' >> /etc/xdg/autostart/qbittorrent-nox.desktop;"

# Se ejecutan todos los comandos
eval $comandos | dialog --title "$2" --backtitle "$3" --progressbox 20 76
