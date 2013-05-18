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

# Variables
if [ `uname -i` == "x86_64" ]; then
	fichUtorrent="utorrent-server-3.0-ubuntu-10.10-27079.x64.tar.gz"
else
	fichUtorrent="utorrent-server-3.0-ubuntu-10.10-27079.tar.gz"
fi

urlUtorrent="http://ll.download3.utorrent.com/linux/$fichUtorrent"
dirInst="/usr/share"
dirUtorrent="utorrent-server-v3_0"

# Se elimina posible fichero de utorrent de una descarga anterior
comandos="rm /var/cache/apt/archives/$fichUtorrent 2>/dev/null;"

# Se descarga uTorrent
comandos+="echo 'Descargando uTorrent ...' >>log.txt;"
comandos+="echo 'Descargando uTorrent ...';"
comandos+="wget -P /var/cache/apt/archives $urlUtorrent 2>&1;"

# Se descomprime a la carpeta marcada por la variable dirInst
comandos+="echo 'Descomprimiendo uTorrent ...' >>log.txt;"
comandos+="echo 'Descomprimiendo uTorrent ...';"
comandos+=" tar -xzf /var/cache/apt/archives/$fichUtorrent -C $dirInst 2>>log.txt;"

# Se instala librería necesaria
comandos+="echo 'Instalando libreria ...' >>log.txt;"
comandos+="echo 'Instalando libreria ...';"
comandos+=" apt-get -y install libssl0.9.8 --fix-missing 2>>log.txt;"

# Se copia fichero que permite iniciar/parar utorrent como demonio
comandos+="cp sh/utorrent-daemon /etc/init.d 2>>log.txt;"

# Se copian los lanzadores del menú para iniciar y finalizar utorrent-daemon
comandos+="cp ./menu/utorrent-cli.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/utorrent-start.desktop /usr/share/applications 2>>log.txt;"
comandos+="cp ./menu/utorrent-stop.desktop /usr/share/applications 2>>log.txt;"

# Se Crean enlaces simbólicos para que utorrent se inicie automáticamente desde consola
comandos+="update-rc.d -f utorrent-daemon defaults 2>>log.txt;"
# En caso de querer quitar este inicio de utorrent más adelante, escribir en consola: # update-rc.d -f utorrent-daemon remove

# No se crea lanzador de autoarranque con el inicio de sesión de Xfce ya que inicia automáticamente desde consola.
# En caso de necesitar el autoarranque de Xfce, descomentar las siguientes líneas. 
#comandos+="echo 'Creando autoarranque en el inicio de sesión ...' >>log.txt;"
#comandos+="echo 'Creando autoarranque en el inicio de sesión ...';"
#comandos+="echo '[Desktop Entry]' > /etc/xdg/autostart/utorrent.desktop;"
#comandos+="echo 'Name=uTorrent Server' >> /etc/xdg/autostart/utorrent.desktop;"
#comandos+="echo 'Exec=bash $dirInst/$dirUtorrent/utorrent.sh' >> /etc/xdg/autostart/utorrent.desktop;"
#comandos+="echo 'Type=Application' >> /etc/xdg/autostart/utorrent.desktop;"
#comandos+="echo 'Categories=Network;FileTransfer' >> /etc/xdg/autostart/utorrent.desktop;"
#comandos+="echo 'Icon=' >> /etc/xdg/autostart/utorrent.desktop;"
#comandos+="echo 'Comment=Descargas P2P de archivos .torrent' >> /etc/xdg/autostart/utorrent.desktop;"

# Este script se usaría para el autoarranque de utorrent en Xfce.
#comandos+="echo 'Creando script de lanzamiento ...' >>log.txt;"
#comandos+="echo 'Creando script de lanzamiento ...';"
#comandos+="echo '#!/bin/bash' >$dirInst/$dirUtorrent/utorrent.sh;"
#comandos+="echo 'cd $dirInst/$dirUtorrent' >>$dirInst/$dirUtorrent/utorrent.sh;"
#comandos+="echo './utserver &' >>$dirInst/$dirUtorrent/utorrent.sh;"

# Se ejecutan todos los comandos
eval $comandos | dialog --title "$2" --backtitle "$3" --progressbox 20 76



