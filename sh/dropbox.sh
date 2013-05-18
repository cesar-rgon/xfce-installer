#!/bin/bash
comandos="echo 'Descargando e instalando Dropbox ...' 2>>log.txt;"
comandos+="cd /home/$1 2>>log.txt;"
if [ `uname -i` == "x86_64" ]
then
   # Arquitectura 64 bits
   comandos+="wget -O - 'https://www.dropbox.com/download?plat=lnx.x86_64' 2>&1 | tar xzf - 2>>log.txt;"
else
   # Arquitectura 32 bits
   comandos+="wget -O - 'https://www.dropbox.com/download?plat=lnx.x86' 2>&1 | tar xzf - 2>>log.txt;"
fi
comandos+="chown $1:$1 -R "/home/$1/.dropbox-dist" 2>>log.txt;"

# Sobrescribiendo el acceso de inicio creado por el paquete nautilus-dropbox
comandos+="echo 'Creando autoarranque de Dropbox en el inicio de sesion ...' 2>>log.txt;"
comandos+="mkdir -p /home/$1/.config/autostart 2>>log.txt;"
comandos+="echo '[Desktop Entry]' > /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'Name=Dropbox' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'GenericName=Sincronizador de Ficheros' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'Exec=bash /home/$1/.dropbox-dist/dropboxd &' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'Type=Application' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'Categories=Network;FileTransfer;' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'Icon=dropbox' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'Comment=Sincronizar con nube Dropbox.' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'Terminal=false' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="echo 'StartupNotify=false' >> /home/$1/.config/autostart/dropbox.desktop 2>>log.txt;"
comandos+="chown $1:$1 -R /home/$1/.config"

eval $comandos | dialog --title "$2" --backtitle "$3" --progressbox 20 76
