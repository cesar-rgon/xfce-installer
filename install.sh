#!/bin/bash
########################################################################################################################
# VARIABLES
########################################################################################################################
function inicializaVariables()
{
   autor="Cesar Rodriguez Gonzalez"
   descripcion="Xfce Installer. Instalador Xfce con aplicaciones" # Título de fondo
   version="1.0"
   ultimaFechaModificacion="02-05-2013"
   distribucionProbada="Ubuntu Server 12.04, 12.10 y 13.04"
   versionUbuntu=`lsb_release -rs`
   codigoUbuntu=`lsb_release -cs`
   anchoDialogo=$((`tput cols` - 4))
   altoDialogo=$((`tput lines` - 6))
   totalPasos=13 # Numero total de pasos que tiene la instalacion
   accion=1 # Accion=0. Se pulsa botón Aceptar. Accion=1. Se pulsa botón cancelar.
   usuario="" # Nombre del usuario linux
   instalaGdebi=0 # 0.No se ha instalado gdebi. 1, sí se ha instalado.
   instalaNemo=0  # Por defecto no se instala el explorador de ficheros Nemo (sólo Thunar).
   instalaLightdm=0   # Indica si se instala la pantalla de autenticacion de usuario y entrada a Xfce.
   instalaNetworkManager=0 # Indica si se instala Network Manager
   inicioAutomatico=0 # Inicio automático del usuario. 0 No inicia automáticamente. 1 sí lo hace.
   programasEliminar="byobu xterm" # Paquetes de la instalacion de Xfce a eliminar porque no usamos
   configuraAmuleDaemon=0 # Por defecto no se accede a la pantalla de configurar aMule-Daemon (0=false, 1=true)
   instalaDeluged=0 # 0.No se ha instalado deluged. 1, sí se ha instalado.
   instalaPyload=0 # 0.No se ha instalado pyLoad. 1, sí se ha instalado.
   instalaQbittorrentDaemon=0 # 0.No se ha instalado qbittorrent nox daemon. 1, sí se ha instalado.
   instalaUtorrent=0 # 0.No se ha instalado utorrent. 1, sí se ha instalado.
   instalaCompiz=0 # 0.No se ha instalado compiz. 1, sí se ha instalado.
   escritorioXfce="ESCRITORIO:\n---------------------------------------------------------------\n   Xfce (X Free Choresterol Environment)" # Escritorio Xfce
   gestorEscritorios="GESTOR DE ESCRITORIOS:\n---------------------------------------------------------------\n   Lightdm (Light Desktop Manager con tema Gtk Greeter)\n" # Gestor de escritorios Lightdm
   
   # Además de los paquetes base, se van a ir añadiendo paquetes opcionales segun la selección de programas a instalar por el usuario.
   paquetesRepositorio="dmz-cursor-theme gnome-icon-theme-full language-pack-gnome-es shimmer-wallpapers xdg-utils xfce4-datetime-plugin zenity"
if [ $versionUbuntu == "12.04" ]; then
	paquetesRepositorio+=" shimmer-themes-greybird"
else
	paquetesRepositorio+=" shimmer-themes"
fi

   # Programas variados a instalar para el escritorio. Son los programas "base" o comunes a toda instalacion
   programasBase="APLICACIONES BASE:\n
---------------------------------------------------------------\n
   DateTime (fecha y calendario para el panel de tareas de Xfce)\n
   Faenza (tema de iconos del sistema)\n
   Greybird (tema de escritorio)\n
   Mscorefonts (Fuentes comunes de Microsoft)\n
   Zenity (Dialogos en ventanas)\n"
   
   programasOpcionales="APLICACIONES OPCIONALES:\n
---------------------------------------------------------------\n" # Se van a ir añadiendo las descripciones de los programas opcionales seleccionados por el usuario.

   # Paquetes opcionales del repositorio estándar (paquetes del repositorio - descripción de cada utilidad)
   abiword=("abiword" "  Abiword (Editor ligero de documentos word)\n")
   aMule=("amule" "  aMule (descargas P2P en la red eDonkey)\n")
   aMuleDaemon=("amule amule-daemon amule-utils-gui" "  aMule Daemon (Servidor aMule para descargas P2P en la red eDonkey)\n")
   alacarte=("alacarte"  "  Alacarte (editor del menu de aplicaciones)\n")
   audacious=("audacious" "  Audacious (reproductor de audio mp3 estilo WinAmp)\n")
   bleachbit=("bleachbit" "  Bleachbit (utilidad de limpieza de ficheros temporales)\n")
   bluefish=("bluefish" "  Bluefish (entorno de desarrollo y programacion web)\n")
   calibre=("calibre" "  Calibre (Visor, conversor y catalogador de ebooks)\n")
   catfish=("catfish" "  Catfish (utilidad grafica para realizar busqueda de ficheros)\n")
   chromium=("chromium-browser" "  Chromium (navegador web open-source basado en Chrome)\n")
   centroSoftwareGnome=("software-center" "  Centro de software de Ubuntu (gestor de programas de Gnome)\n")
   centroSoftwareLxde=("lubuntu-software-center" "  Centro de software de Lubuntu (gestor de programas ligero de Lxde)\n")
   clementine=("clementine" "  Clementine (biblioteca de audio muy completa)\n")
   codecsVideoAudio=("gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly" "  Gstreamer (Paquete de codecs de video y audio)\n")
   compiz=("compiz compizconfig-settings-manager fusion-icon" "  Compiz (Decorador de ventanas con efectos de escritorio 3D)\n")
   compresor7zip=("p7zip-full" "  Compresor 7zip\n")
   compresorRar=("rar unrar" "  Compresor / descompresor Rar\n")
   deluge=("deluge" "  Deluge (descargas P2P mediante ficheros torrent)\n")
   deluged=("deluge deluged deluge-webui" "  Deluged (descargas P2P mediante ficheros torrent. Demonio)\n")
   dropbox=("nautilus-dropbox" "  Dropbox (sincronizacion con la nube)\n")
   escaner=("simple-scan" "  Simple scan (escaneo de documentos)\n")
   evince=("evince" "  Evince (visor de ficheros Pdf)\n")
   evolution=("evolution" "  Evolution (gestor de correos tipo Office)\n")
   fileroller=("file-roller thunar-archive-plugin" "  FileRoller (Ventana que gestiona compresion / descompresion de ficheros)\n") 
   filezilla=("filezilla" "  Filezilla (cliente de transferencia ftp)\n")
   firefox=("firefox firefox-locale-es" "  Firefox (navegador web de Mozilla)\n")
   flashplugin=("flashplugin-installer" "  Plugin para reproducir videos Flash en navegadores web\n")
   galculator=("galculator" "  Galculator (calculadora de Xfce)\n")
   gcstar=("gcstar" "  Gcstar (Catalogador de peliculas, musica, libros, etc)\n")
   gdebi=("gdebi" "  Gdebi (utilidad grafica para instalar paquetes deb)\n")
   geany=("geany" "  Geany (editor de texto avanzado y entorno de programacion)\n")
   gedit=("gedit" "  Gedit (editor de textos estandar y mas usado)\n")
   gimp=("gimp" "  Gimp (editor de imagenes)\n")
   gmplayer=("gnome-mplayer" "  Gmplayer (reproductor de video con interfaz grafica)\n")
   gnumeric=("gnumeric" "  Gnumeric (Editor ligero de hojas de calculo)\n")
   gparted=("gparted" "  Gparted (utilidad para administrar particiones del disco duro)\n")
   gpicview=("gpicview" "  Gpicview (visor de fotos ligero)\n")
   grabacion=("xfburn" "  Xfburn (grabacion de CD-rom y DVD-rom)\n")
   hardinfo=("hardinfo" "  Hardinfo (utilidad de deteccion del hardware del equipo)\n")
   impresora=("cups xfprint4 system-config-printer-gnome" "  Xfprint4 (gestiona impresion de documentos)\n")
   impresoraPdf=("cups-pdf" "  Cups-pdf (impresora de documentos PDF)\n")
   indicators=("indicator-applet-complete indicator-sound-gtk2 xfce4-indicator-plugin" "  Indicadores en el panel de sistema para red, mensajeria, sonido y otros\n")
   integraConDominio=("likewise-open-gui" "  Likewise Open (Integra a dominio de Windows Server)\n")
   jdk=("openjdk-6-jre" "  Java Development Kit (JRE para desarrolladores)\n")
   jockey=("jockey-gtk" "  Jockey (Utilidad para instalar drivers. Solo Ubuntu 12.04)\n")
   klavaro=("klavaro" "  Klavaro (curso de mecanografia)\n")
   libreoffice=("libreoffice libreoffice-help-es libreoffice-l10n-es" "  LibreOffice (suite ofimatica de documentos, hojas de calculo, etc)\n")
   lightdmGtkGreeter=("lightdm-gtk-greeter plymouth-theme-ubuntu-logo" "  Lightdm (Light Desktop Manager con tema Gtk Greeter)\n")
   luckybackup=("luckybackup" "  LuckyBackup (Sincronizador de ficheros y copias de seguridad)\n")
   lxtask=("lxtask" "  Lxtask (Monitor del sistema ligero)\n")
   mcomix=("mcomix" "  Mcomix (Visor de comics)\n")
   midori=("midori" "  Midori (navegador web ligero)\n")
   mousepad=("mousepad" "  Mousepad (editor de textos sencillo y ligero)\n")
   mplayer=("mplayer" "  Mplayer (reproductor de video desde consola)\n")
   networkManager=("network-manager" "  Network Manager (gestor de perfiles de red cableada y wifi)\n")
   notes=("xfce4-notes" "  Notas post-it de Xfce\n")
   pidgin=("pidgin pidgin-extprefs pidgin-facebookchat" "  Pidgin (Chat multiprotocolo)\n")
   pluginBateria=("xfce4-battery-plugin" "  Plugin de consumo de bateria para el panel de tareas de Xfce\n") 
   powerManager=("xfce4-power-manager" "  Ventana de administracion de energia\n")
   qbittorrent=("qbittorrent" "  Qbittorrent (descargas P2P mediante ficheros torrent)\n")
   qbittorrentDaemon=("qbittorrent-nox" "  Qbittorrent Nox Daemon (descargas P2P mediante ficheros torrent. Demonio)\n")
   redLocal=("gvfs-backends gvfs-fuse python-glade2 system-config-samba" "  Acceso a recursos compartidos de la red (Samba)\n")
   remmina=("remmina" "  Remmina (Cliente de conexion remota SSH,SFTP,etc)\n")
   screenshooter=("xfce4-screenshooter" "  Screenshooter (Salvapantallas de Xfce)\n")
   selectorIdioma=("language-selector-gnome" "  Selector de idiomas\n")
   synaptic=("synaptic" "  Synaptic (gestor de paquetes de instalacion)\n")
   systemMonitor=("gnome-system-monitor" "  Monitor del sistema de Gnome\n")
   terminalGnome=("gnome-terminal" "  Terminal de Gnome\n")
   terminalXfce=("xfce4-terminal" "  Terminal de Xfce\n")
   thumbnailGnome=("ffmpegthumbnailer" "  Previews de fotos y videos en el explorador de ficheros Nemo\n")
   thunderbird=("thunderbird thunderbird-locale-es" "  Thunderbird (gestor de correos de Mozilla)\n")
   tvEnLinux=("mplayer rtmpdump curl" "  TV en Linux (canales de television online)\n")
   ubuntuone=("ubuntuone-control-panel" "  Ubuntu One (sincronizacion con la nube de Canonical)\n")
   updateManager=("update-manager" "  Update Manager (Gestor de actualizaciones del sistema)\n")
   userSettings=("gnome-system-tools" "  Ventana de gestion de usuarios del sistema\n")
   videolan=("vlc" "  Videolan (reproductor de video con codecs propios e interfaz grafica)\n")
   virtualbox=("virtualbox" "  Virtualbox (virtualiza maquinas virtuales con S.O.)\n")
   webcam=("guvcview" "  Guvcview (captura fotos y videos de la camara web)\n")
   wine=("wine" "  Wine (emulador de software de Windows)\n")
   xbmc=("xbmc" "  Xbmc (centro multimedia de videos, fotos y musica)\n")
   xscreensaver=("xscreensaver" "  Xscreensaver (salvapantallas de Xfce)\n")
 
   # Paquetes de repositorios de terceros (paquetes del repositorio - descripción de cada utilidad)
   faenza=("faenza-icon-theme faience-icon-theme" "  Faenza (tema de iconos del sistema)\n")
   grubcustomizer=("grub-customizer" "  GrubCustomizer (administrador de Grub2)\n")
   chrome=("google-chrome-stable" "  Chrome (navegador web de Google)\n")
   nemo=("nemo nemo-fileroller nemo-share" "  Nemo (Explorador de ficheros de Cinnamon)\n")
   opera=("opera" "  Opera (navegador web de Opera Software)\n")
   jdownloader=("jdownloader" "  jDownloader (gestor de descargas directas de servidores)\n")
   jupiter=("jupiter" "  Jupiter (regula el rendimiento del sistema, modos idle-performance)\n")
   
   # URLs de paquetes deb, nombre de cada paquete, descripción de cada utilidad
   debGoogleEarth32=("http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb" "google-earth-stable_current_i386.deb" "  Google Earth 32bits (Mapa del mundo 3D con fotos)\n")
   debGoogleEarth64=("http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb" "google-earth-stable_current_amd64.deb" "  Google Earth 64bits (Mapa del mundo 3D con fotos)\n")
   debPyload=("http://get.pyload.org/get/ubuntu" "pyload_linux.deb" "  pyLoad (gestor de descargas directas de servidores. Demonio. Ligero)\n")
   debTeamviewer32=("http://www.teamviewer.com/download/teamviewer_linux.deb" "teamviewer_linux_32.deb" "  Teamviewer 32bits (acceso a/desde escritorio remoto)\n")
   debTeamviewer64=("http://www.teamviewer.com/download/teamviewer_linux_x64.deb" "teamviewer_linux_64.deb" "  Teamviewer 64bits (acceso a/desde escritorio remoto)\n")
   debSkype32=("http://www.skype.com/go/getskype-linux-beta-ubuntu-32" "skype_linux_32.deb" "  Skype 32bits (mensajeria por chat y voIp)\n")
   debSkype64=("http://www.skype.com/go/getskype-linux-beta-ubuntu-64" "skype_linux_64.deb" "  Skype 64bits (mensajeria por chat y voIp)\n")
   debSteam=("http://media.steampowered.com/client/installer/steam.deb" "steam_latest.deb" "  Steam (Plataforma online de juegos)\n")
   urlsDeb="" # Se van a ir agregando las URLs de los paquetes deb a descargar según la seleccion de programas opcionales del usuario
   paquetesDeb="" # Se van a ir agregando los nombres de los paquetes deb a descargar según la seleccion de programas opcionales del usuario

   # Scripts de instalación aplicaciones, descripción de cada uno
   scriptDeluged=("./sh/deluged.sh" "  Deluged (descargas P2P mediante ficheros torrent. Demonio)\n")
   scriptPyload=("./sh/pyload.sh" "  pyLoad (gestor de descargas directas de servidores)\n")
   scriptQbittorrentDaemon=("./sh/qbittorrent.sh" "  Qbittorrent Nox Daemon (descargas P2P mediante ficheros torrent. Demonio)\n")
   scriptTvEnLinux=("./sh/tv-en-linux.sh" "  TV en linux (canales de television online)\n")
   scriptUtorrent=("./sh/utorrent.sh" "  Utorrent (descargas P2P mediante ficheros torrent)\n")
   scripts="" # Se van a ir agregando scripts de instalación según la selección de programas opcionales del usuario. Por defecto, siempre se instala LXDE Menu Editor

   # Repositorios de terceros para los programas correspondientes (comandos - descripción - Valor opcional booleano de instalación)
   repositorioChrome=("" "Repositorio del navegador Google Chrome" 0)
   repositorioChrome[0]="wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub 2>&1 | apt-key add - ; " 
   repositorioChrome[0]+="echo \"deb http://dl.google.com/linux/chrome/deb/ stable main #${repositorioChrome[1]}\" >> /etc/apt/sources.list.d/google.list"

   repositorioFaenza=("add-apt-repository -y ppa:tiheum/equinox 2>&1" "Repositorio de tema de iconos Faenza")
   repositorioFaenza[0]+=";sed -i 's/ main/ main #${repositorioFaenza[1]}/g' /etc/apt/sources.list.d/tiheum-equinox*.list"
   #repositorioFaenza=("" "Repositorio de tema de iconos Faenza")
   #repositorioFaenza[0]="apt-key add ./conf/faenza.key ; "
   #repositorioFaenza[0]+="echo \"deb http://ppa.launchpad.net/tiheum/equinox/ubuntu precise main #${repositorioFaenza[1]}\" > /etc/apt/sources.list.d/tiheum-equinox-precise.list ; "
   #repositorioFaenza[0]+="echo \"deb-src http://ppa.launchpad.net/tiheum/equinox/ubuntu precise main #${repositorioFaenza[1]}\" >> /etc/apt/sources.list.d/tiheum-equinox-precise.list ; "

   repositorioGrubCustomizer=("add-apt-repository -y ppa:danielrichter2007/grub-customizer 2>&1" "Repositorio del gestor de Grub2: Grub-Customizer" 0)
   repositorioGrubCustomizer[0]+=";sed -i 's/ main/ main #${repositorioGrubCustomizer[1]}/g' /etc/apt/sources.list.d/danielrichter2007-grub-customizer*.list"

   repositoriojDownloader=("add-apt-repository -y ppa:jd-team/jdownloader 2>&1" "Repositorio de la utilidad jDownloader" 0)
   repositoriojDownloader[0]+=";sed -i 's/ main/ main #${repositoriojDownloader[1]}/g' /etc/apt/sources.list.d/jd-team-jdownloader*.list"

   repositorioJupiter=("add-apt-repository -y ppa:webupd8team/jupiter 2>&1" "Repositorio de la utilidad Jupiter" 0)
   repositorioJupiter[0]+=";sed -i 's/ main/ main #${repositorioJupiter[1]}/g' /etc/apt/sources.list.d/webupd8team-jupiter*.list"

   repositorioNemo=("add-apt-repository -y ppa:gwendal-lebihan-dev/cinnamon-stable 2>&1" "Repositorio de Cinnamon (para utilidad Nemo)" 0)
   repositorioNemo[0]+=";sed -i 's/ main/ main #${repositorioNemo[1]}/g' /etc/apt/sources.list.d/gwendal-lebihan-dev-cinnamon-stable*.list"
      
   repositorioOpera=("" "Repositorio del navegador Opera" 0)
   repositorioOpera[0]="wget -O - http://deb.opera.com/archive.key 2>&1 | apt-key add - ; "
   repositorioOpera[0]+="echo \"deb http://deb.opera.com/opera/ stable non-free #${repositorioOpera[1]}\" >> /etc/apt/sources.list.d/opera.list"

   repositoriosTerceros="${repositorioFaenza[0]} 2>>log.txt;" # Se van a ir agregando repositorios de Terceros segun las selecciones de programas en el menu de instalacion.
   descripcionRepoTerceros="REPOSITORIOS DE TERCEROS:\n
---------------------------------------------------------------\n
   ${repositorioFaenza[1]}\n" # Se van a ir añadiendo las descripciones de los repositorios de terceros según instalación.
   
   # Se comprueba si existe el fichero de configuración asociado a la versión
   if [ -e ./sh/versions/$versionUbuntu.xfce.repo.sh ]
   then
	  # Se eliminan los comentarios (líneas que comienzan por #) y los saltos de línea.
      repositoriosTerceros+=`sed -e '/^#[^!]/d' ./sh/versions/$versionUbuntu.xfce.repo.sh | tr -d '\r\n'`
      # Se eliminan los comentarios (líneas que comienzan por #)
      descripcionRepoTerceros+=`sed -e '/^#[^!]/d' ./sh/versions/$versionUbuntu.xfce.description`
      descripcionRepoTerceros+="  "
   fi
}

########################################################################################################################
# COMPROBAR USUARIO ADMINISTRADOR
########################################################################################################################
# Se comprueba si el script se está ejecutando como usuario administrador (root tiene id = 0)
if [ $(id -u) != 0 ]
then
   echo ""
   echo "Este script debe ser ejecutado como usuario administrador."
   echo "Para ejecutar el script: sudo bash ./install.sh"
   echo "Si el script tiene permiso de ejecucion basta con: sudo ./install.sh"
   echo "Para dar permiso de ejecucion: chmod +x install.sh"
   echo ""
   exit 1
fi

########################################################################################################################
# PREPARAR INSTALADOR
########################################################################################################################
inicializaVariables
# Si hubo una instalación anterior errónea, se repara antes de continuar
echo "   Reparando posibles errores ..."
dpkg --configure -a >/dev/null 2>>log.txt
echo "   Instalando paquetes necesarios ..."
# Se instala "dialog": paquete necesario para mostrar las ventajas de diálogos del instalador
# Se instala "python-software-properties": paquete necesario para que funcione correctamente gdebi, además de contener add-apt-repository en Ubuntu 12.04
# Se instala "software-properties-common": paquete necesario para usar add-apt-repository a partir de Ubuntu 12.10
apt-get -y install dialog python-software-properties software-properties-common --fix-missing >/dev/null 2>>log.txt

########################################################################################################################
# INICIO DEL INSTALADOR
########################################################################################################################
dialog --title "Sobre este instalador:" --backtitle "$descripcion" --msgbox \
"\nAUTOR:          $autor\n
DESCRIPCION:    $descripcion\n
VERSION:        $version\n
MODIFICADO:     $ultimaFechaModificacion\n
PROBADO EN:     $distribucionProbada\n
PRERREQUISITOS: Instalar sistema base de linux. Conexion a internet" 12 $anchoDialogo

########################################################################################################################
# PASO 1: USUARIO LINUX
########################################################################################################################
titulo="Paso 1/$totalPasos: Usuario linux (no root)"
echo "$titulo">>log.txt
until [ $accion -eq 0 ] && [ -n "$usuario" ] # Se muestra el cuadro de diálogo hasta que se introduzca un nombre de usuario no vacío y se pulse "Aceptar".
do
  dialog --title "$titulo" --backtitle "$descripcion" --inputbox "Introduce nombre de usuario de inicio de sesion:" 9 $anchoDialogo 2>/tmp/inputbox.tmp
  accion=$?
  usuario=`cat /tmp/inputbox.tmp`
done
rm -f /tmp/inputbox.tmp 1>/dev/null 2>>log.txt


########################################################################################################################
# PASO 2: CONFIGURACION DEL EQUIPO
########################################################################################################################
titulo="Paso 2/$totalPasos: Configuracion del equipo"
echo "$titulo">>log.txt
caracteristicas=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCaracteristicas del ordenador:" 16 $anchoDialogo 7 \
1 "El ordenador es un portatil" off \
2 "El ordenador esta conectado a una red local" off \
3 "El ordenador esta en un dominio" off \
4 "El ordenador tiene grabadora de CD-rom/DVD-rom" off \
5 "El ordenador tiene instalada una camara web" off \
6 "El ordenador tiene instalada una impresora" off \
7 "El ordenador tiene instalado un escaner" off`
if [ $? -eq 0 ]
then
   for c in $caracteristicas
   do
      case $c in
         1) paquetesRepositorio+=" ${pluginBateria[0]}"
            programasOpcionales+=" ${pluginBateria[1]}";;
		 2) paquetesRepositorio+=" ${redLocal[0]}"
            programasOpcionales+=" ${redLocal[1]}";;
		 3) paquetesRepositorio+=" ${integraConDominio[0]}"
			programasOpcionales+=" ${integraConDominio[1]}";;
         4) paquetesRepositorio+=" ${grabacion[0]}"
            programasOpcionales+=" ${grabacion[1]}";;
         5) paquetesRepositorio+=" ${webcam[0]}"
            programasOpcionales+=" ${webcam[1]}";;
         6) paquetesRepositorio+=" ${impresora[0]}"
            programasOpcionales+=" ${impresora[1]}";;
         7) paquetesRepositorio+=" ${escaner[0]}"
            programasOpcionales+=" ${escaner[1]}";;
      esac
   done
fi

########################################################################################################################
# PASO 3: SELECCION DE PROGRAMAS A INSTALAR
########################################################################################################################
titulo="Paso 3/$totalPasos: Programas a instalar"
echo "$titulo">>log.txt

accion=1
seleccionados=()
until [ $accion -eq 0 ] && [ ${#seleccionados[*]} -gt 0 ] # Se muestra el cuadro de diálogo hasta que se pulse "Aceptar".
do
   lightdm=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --menu "\nCategoria 1/10: Pantalla de autenticacion de usuarios y entrada a Xfce:" 11 $anchoDialogo 3 \
   1 "Instala Lightdm. El usuario inicia sesion automaticamente." \
   2 "Instala Lightdm. El usuario debe autenticarse por entorno grafico." \
   3 "No instalar Lightdm. El usuario debe autenticarse en consola."`
   accion=$?
   seleccionados=($lightdm)
done
for l in $lightdm
do
   case $l in
      1) paquetesRepositorio+=" ${lightdmGtkGreeter[0]}"
		 instalaLightdm=1
         inicioAutomatico=1
         gestorEscritorios+="   El usuario inicia sesion automaticamente." ;;
      2) paquetesRepositorio+=" ${lightdmGtkGreeter[0]}"
	     instalaLightdm=1
         inicioAutomatico=0
         gestorEscritorios+="   El usuario debe autenticarse." ;;
      3) instalaLightdm=0 ;;
   esac
done


compresores=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 2/10: Compresores:" 12 $anchoDialogo 3 \
1 "Compresor 7zip" on \
2 "Compresor/descompresor Rar" on \
3 "Ventana grafica para comprimir/descomprimir (File-Roller)" on`

if [ $? -eq 0 ]
then
   for c in $compresores
   do
      case $c in
		1) paquetesRepositorio+=" ${compresor7zip[0]}"
		   programasOpcionales+=" ${compresor7zip[1]}" ;;
		2) paquetesRepositorio+=" ${compresorRar[0]}"
		   programasOpcionales+=" ${compresorRar[1]}" ;;
		3) paquetesRepositorio+=" ${fileroller[0]}"
		   programasOpcionales+=" ${fileroller[1]}" ;;
      esac
   done
fi
    
desarrollo=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 3/10: Desarrollo:" 12 $anchoDialogo 3 \
1 "Editor de texto avanzado y entorno de programacion (Geany)" off \
2 "Entorno de desarrollo Web y programacion (Bluefish)" off \
3 "Java Develoment Kit (OpenJDK)" on`

if [ $? -eq 0 ]
then
   for d in $desarrollo
   do
      case $d in
		1) paquetesRepositorio+=" ${geany[0]}"
		   programasOpcionales+=" ${geany[1]}" ;;
		2) paquetesRepositorio+=" ${bluefish[0]}"
		   programasOpcionales+=" ${bluefish[1]}" ;;
		3) paquetesRepositorio+=" ${jdk[0]}"
		   programasOpcionales+=" ${jdk[1]}" ;;
      esac
   done
fi

descargas=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 4/10: Descargas:" 18 $anchoDialogo 9 \
1 "Descargas P2P para enlaces eDonkey (aMule)" off \
2 "Descargas P2P para enlaces eDonkey para conexiones remotas (aMule daemon)" off \
3 "Descargas P2P para ficheros .torrent (Deluge)" off \
4 "Descargas P2P para ficheros .torrent. Demonio. (Deluged)" off \
5 "Descargas P2P para ficheros .torrent (Qbitorrent)" off \
6 "Descargas P2P para ficheros .torrent. Demonio. (Qbitorrent Nox)" off \
7 "Descargas P2P para ficheros .torrent. Demonio. (uTorrent Server)" off \
8 "Descargas directas de servidores. Demonio. Ligero (pyLoad)" off \
9 "Descargas directas de servidores. Popular (jDownloader)" off`

if [ $? -eq 0 ]
then
   for d in $descargas
   do
      case $d in
		1) paquetesRepositorio+=" ${aMule[0]}"
           programasOpcionales+=" ${aMule[1]}"
           # Se quita el aMule normal de la siguiente opcion, ya que se instala en la iteracion actual.
           repoaMuleDaemon[0]="amule-daemon amule-utils-gui" ;;
        2) paquetesRepositorio+=" ${aMuleDaemon[0]}"
           programasOpcionales+=" ${aMuleDaemon[1]}"
           configuraAmuleDaemon=1;;
        3) paquetesRepositorio+=" ${deluge[0]}"
           programasOpcionales+=" ${deluge[1]}";;
        4) paquetesRepositorio+=" ${deluged[0]}"
           programasOpcionales+=" ${deluged[1]}"
           scripts+=" ${scriptDeluged[0]}"
           instalaDeluged=1 ;;
		5) paquetesRepositorio+=" ${qbittorrent[0]}"
           programasOpcionales+=" ${qbittorrent[1]}";;
        6) paquetesRepositorio+=" ${qbittorrentDaemon[0]}"
           programasOpcionales+=" ${qbittorrentDaemon[1]}"
           scripts+=" ${scriptQbittorrentDaemon[0]}"
           instalaQbittorrentDaemon=1 ;;
        7) scripts+=" ${scriptUtorrent[0]}"
           programasOpcionales+=" ${scriptUtorrent[1]}"
		   instalaUtorrent=1;;
		8) urlsDeb+=" ${debPyload[0]}"
		   scripts+=" ${scriptPyload[0]}"
           paquetesDeb+=" ${debPyload[1]}"
           programasOpcionales+=" ${debPyload[2]}"
           instalaPyload=1;;
        9) programasOpcionales+=" ${jdownloader[1]}"
		   repositoriojDownloader[2]=1
           repositoriosTerceros+="${repositoriojDownloader[0]} 2>>log.txt; "
		   descripcionRepoTerceros+="   ${repositoriojDownloader[1]}\n";;
      esac
   done
fi

escritorio=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 5/10: Utilidades del escritorio:" 15 $anchoDialogo 6 \
1 "Capturador de pantalla de Xfce (Xfce4-Screenshooter)" on \
2 "Editor del menu de aplicaciones (Alacarte)" on \
3 "Efectos de escritorio con Opengl 3D (Compiz)" off \
4 "Indicadores en el panel de sistema para red, mensajería, sonido y otros" on \
5 "Utilidad de limpieza de ficheros temporales (Bleachbit)" on \
6 "Utilidad grafica para realizar busqueda de ficheros (Catfish)" on`

if [ $? -eq 0 ]
then
   for e in $escritorio
   do
      case $e in
		1) paquetesRepositorio+=" ${screenshooter[0]}"
           programasOpcionales+=" ${screenshooter[1]}";;
		2) paquetesRepositorio+=" ${alacarte[0]}"
           programasOpcionales+=" ${alacarte[1]}";;
		3) paquetesRepositorio+=" ${compiz[0]}"
		   programasOpcionales+=" ${compiz[1]}"
		   instalaCompiz=1 ;;
		4) paquetesRepositorio+=" ${indicators[0]}"
		   programasOpcionales+=" ${indicators[1]}" ;;
		5) paquetesRepositorio+=" ${bleachbit[0]}"
		   programasOpcionales+=" ${bleachbit[1]}" ;;
		6) paquetesRepositorio+=" ${catfish[0]}"
		   programasOpcionales+=" ${catfish[1]}" ;;
      esac
   done
fi

juegos=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 6/10: Juegos:" 10 $anchoDialogo 1 \
1 "Plataforma online de juegos (Steam)" off`

if [ $? -eq 0 ]
then
   for j in $juegos
   do
      case $j in
		1) urlsDeb+=" ${debSteam[0]}"
		   paquetesDeb+=" ${debSteam[1]}"
		   programasOpcionales+=" ${debSteam[2]}" ;;
      esac
   done
fi	  

multimedia=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 7/10: Multimedia:" 21 $anchoDialogo 12 \
1 "Canales de television online (TV en linux)" off \
2 "Catalogador de peliculas, musica, libros, etc (Gcstar)" off \
3 "Centro multimedia de videos, fotos y musica (Xbmc)" off \
4 "Editor de imagenes (Gimp)" off \
5 "Pack de codecs de audio y video (Gstreamer)" on \
6 "Plugin para reproducir videos Flash en navegadores web" on \
7 "Reproductor de audio Audacious (similar a winamp, ligero)" off \
8 "Reproductor de audio Clementine (biblioteca de audio)" off \
9 "Reproductor de video con codecs propios e interfaz (Videolan)" on \
10 "Reproductor de video con interfaz grafica (Gnome Mplayer)" off \
11 "Reproductor de video desde consola (Mplayer)" on \
12 "Visor de fotos ligero (Gpicview)" on`

if [ $? -eq 0 ]
then
   for m in $multimedia
   do
      case $m in
        1) paquetesRepositorio+=" ${tvEnLinux[0]}"
		   programasOpcionales+=" ${tvEnLinux[1]}"
		   scripts+=" ${scriptTvEnLinux[0]}";;
        2) paquetesRepositorio+=" ${gcstar[0]}"
		   programasOpcionales+=" ${gcstar[1]}";;
	    3) paquetesRepositorio+=" ${xbmc[0]}"
		   programasOpcionales+=" ${xbmc[1]}";;
		4) paquetesRepositorio+=" ${gimp[0]}"
		   programasOpcionales+=" ${gimp[1]}";;
		5) paquetesRepositorio+=" ${codecsVideoAudio[0]}"
		   programasOpcionales+=" ${codecsVideoAudio[1]}";;
		6) paquetesRepositorio+=" ${flashplugin[0]}"
		   programasOpcionales+=" ${flashplugin[1]}";;
		7) paquetesRepositorio+=" ${audacious[0]}"
		   programasOpcionales+=" ${audacious[1]}" ;;
		8) paquetesRepositorio+=" ${clementine[0]}"
		   programasOpcionales+=" ${clementine[1]}" ;;
		9) paquetesRepositorio+=" ${videolan[0]}"
		   programasOpcionales+=" ${videolan[1]}" ;;
		10) paquetesRepositorio+=" ${gmplayer[0]}"
		   programasOpcionales+=" ${gmplayer[1]}" ;;
        11) paquetesRepositorio+=" ${mplayer[0]}"
		   programasOpcionales+=" ${mplayer[1]}" ;;
		12) paquetesRepositorio+=" ${gpicview[0]}"
		   programasOpcionales+=" ${gpicview[1]}" ;;
      esac
   done
fi

oficina=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 8/10: Oficina:" 22 $anchoDialogo 13 \
1 "Calcudora de Xfce (Galculator)" on \
2 "Curso de mecanografia (Klavaro)" off \
3 "Editor de textos estandar (Gedit)" on \
4 "Editor de textos sencillo (Mousepad)" off \
5 "Editor ligero de documentos de word (Abiword)" off \
6 "Editor ligero de hojas de calculo (Gnumeric)" off \
7 "Impresora de documentos PDF (cups-pdf)" off \
8 "Notas post-it de Xfce (Xfce4-notes)" on \
9 "Sincronizador de ficheros y copias de seguridad (LuckyBackup)" off \
10 "Suite ofimatica de documentos, hojas de calculo, etc (LibreOffice)" on \
11 "Visor, conversor y catalogador de ebooks (Calibre)" off \
12 "Visor de comics (Mcomix)" off \
13 "Visor de ficheros Pdf (Evince)" on`

if [ $? -eq 0 ]
then
   for o in $oficina
   do
      case $o in
        1) paquetesRepositorio+=" ${galculator[0]}"
		   programasOpcionales+=" ${galculator[1]}" ;;
		2) paquetesRepositorio+=" ${klavaro[0]}"
		   programasOpcionales+=" ${klavaro[1]}";;
        3) paquetesRepositorio+=" ${gedit[0]}"
		   programasOpcionales+=" ${gedit[1]}";;
		4) paquetesRepositorio+=" ${mousepad[0]}"
		   programasOpcionales+=" ${mousepad[1]}";;
		5) paquetesRepositorio+=" ${abiword[0]}"
		   programasOpcionales+=" ${abiword[1]}";;
		6) paquetesRepositorio+=" ${gnumeric[0]}"
		   programasOpcionales+=" ${gnumeric[1]}";;
		7) paquetesRepositorio+=" ${impresoraPdf[0]}"
		   programasOpcionales+=" ${impresoraPdf[1]}";;		
		8) paquetesRepositorio+=" ${notes[0]}"
		   programasOpcionales+=" ${notes[1]}";;
		9) paquetesRepositorio+=" ${luckybackup[0]}"
		   programasOpcionales+=" ${luckybackup[1]}";;
		10) paquetesRepositorio+=" ${libreoffice[0]}"
		    programasOpcionales+=" ${libreoffice[1]}";;
		11) paquetesRepositorio+=" ${calibre[0]}"
		    programasOpcionales+=" ${calibre[1]}";;
		12) if [ $versionUbuntu == "12.04" ]; then
				repositorioMcomix=("add-apt-repository -y ppa:blca/ppa 2>&1" "Repositorio del visor de comics Mcomix")
				repositorioMcomix[0]+=";sed -i 's/ main/ main #${repositorioMcomix[1]}/g' /etc/apt/sources.list.d/blca-ppa*.list"
				repositoriosTerceros+="${repositorioMcomix[0]} 2>>log.txt; "
				descripcionRepoTerceros+="   ${repositorioMcomix[1]}\n"
			fi
			paquetesRepositorio+=" ${mcomix[0]}"
		    programasOpcionales+=" ${mcomix[1]}";;
		13) paquetesRepositorio+=" ${evince[0]}"
		    programasOpcionales+=" ${evince[1]}";;
      esac
   done
fi

sistema=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 9/10: Utilidades del sistema:" 30 $anchoDialogo 20 \
1 "Cambia rendimiento del pc, modos idle-performance (Jupiter)" off \
2 "Centro de software avanzado de Ubuntu" on \
3 "Centro de software ligero de Lubuntu" off \
4 "Emulador de software de Windows (Wine)" off \
5 "Explorador de ficheros (Nemo)" off \
6 "Gestor de actualizaciones del sistema" on \
7 "Gestor de paquetes (Synaptic)" off \
8 "Gestor de perfiles de red cableada y wifi (Network Manager)" on \
9 "Grubcustomizer (administrador de arranque Grub2)" on \
10 "Monitor del sistema de Gnome" off \
11 "Monitor del sistema ligero (Lxtask)" on \
12 "Selector de idiomas" on \
13 "Salvapantallas de Xfce (Xscreensaver)" on \
14 "Utilidad de deteccion del hardware del equipo (Hardinfo)" off \
15 "Utilidad grafica para instalar paquetes deb (Gdebi)" on \
16 "Utilidad para administrar particiones del disco duro (Gparted)" on \
17 "Utilidad para instalar drivers (Jockey). Solo Ubuntu 12.04" on \
18 "Ventana de administracion de energia" on \
19 "Ventana de gestion de usuarios del sistema" on \
20 "Virtualiza distintos Sistemas Operativos (VirtualBox)" off`

if [ $? -eq 0 ]
then
   for s in $sistema
   do
      case $s in
		1) programasOpcionales+=" ${jupiter[1]}"
		   repositorioJupiter[2]=1
		   repositoriosTerceros+="${repositorioJupiter[0]} 2>>log.txt; "
		   descripcionRepoTerceros+="   ${repositorioJupiter[1]}\n" ;;
		2) paquetesRepositorio+=" ${centroSoftwareGnome[0]}"
		   programasOpcionales+=" ${centroSoftwareGnome[1]}";;
		3) paquetesRepositorio+=" ${centroSoftwareLxde[0]}"
		   programasOpcionales+=" ${centroSoftwareLxde[1]}";;	 
		4) paquetesRepositorio+=" ${wine[0]}"
		   programasOpcionales+=" ${wine[1]}";;
		5) paquetesRepositorio+=" ${terminalGnome[0]} ${thumbnailGnome[0]}"
		   programasBase+=" ${terminalGnome[1]}"
		   repositoriosTerceros+="${repositorioNemo[0]} 2>>log.txt; "
		   descripcionRepoTerceros+="   ${repositorioNemo[1]}\n"
		   programasOpcionales+=" ${nemo[1]} ${thumbnailGnome[1]}"
		   instalaNemo=1
		   repositorioNemo[2]=1 ;;
		6) paquetesRepositorio+=" ${updatemanager[0]}"
		   programasOpcionales+=" ${updateManager[1]}";;	 
		7) paquetesRepositorio+=" ${synaptic[0]}"
		   programasOpcionales+=" ${synaptic[1]}";;
		8) paquetesRepositorio+=" ${networkManager[0]}"
		   programasOpcionales+=" ${networkManager[1]}"
		   instalaNetworkManager=1 ;;
		9) repositoriosTerceros+="${repositorioGrubCustomizer[0]} 2>>log.txt; "
	       descripcionRepoTerceros+="   ${repositorioGrubCustomizer[1]}\n"
		   programasOpcionales+=" ${grubcustomizer[1]}" 
		   repositorioGrubCustomizer[2]=1 ;;
		10) paquetesRepositorio+=" ${systemMonitor[0]}"
		   programasOpcionales+=" ${systemMonitor[1]}";;
		11) paquetesRepositorio+=" ${lxtask[0]}"
		    programasOpcionales+=" ${lxtask[1]}";;
		12) paquetesRepositorio+=" ${selectorIdioma[0]}"
		    programasOpcionales+=" ${selectorIdioma[1]}";;
		13) paquetesRepositorio+=" ${xscreensaver[0]}"
		    programasOpcionales+=" ${xscreensaver[1]}";;
		14) paquetesRepositorio+=" ${hardinfo[0]}"
		    programasOpcionales+=" ${hardinfo[1]}";;
		15) paquetesRepositorio+=" ${gdebi[0]}"
		    programasOpcionales+=" ${gdebi[1]}"
			instalaGdebi=1;;
		16) paquetesRepositorio+=" ${gparted[0]}"
		    programasOpcionales+=" ${gparted[1]}";;
		17) if [ $versionUbuntu == "12.04" ]; then
				paquetesRepositorio+=" ${jockey[0]}"
				programasOpcionales+=" ${jockey[1]}"
		    fi ;;
		18) paquetesRepositorio+=" ${powerManager[0]}"
		    programasOpcionales+=" ${powerManager[1]}";;
		19) paquetesRepositorio+=" ${userSettings[0]}"
		    programasOpcionales+=" ${userSettings[1]}";;
		20) paquetesRepositorio+=" ${virtualbox[0]}"
		    programasOpcionales+=" ${virtualbox[1]}";;
      esac
   done
fi

internet=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --separate-output --checklist "\nCategoria 10/10: Internet:" 24 $anchoDialogo 15 \
1 "Chat multiprotocolo (Pidgin)" off \
2 "Cliente de conexion remota. SSH, SFTP, etc (Remmina)" off \
3 "Cliente de transferencia Ftp (Filezilla)" off \
4 "Conexion a escritorio remoto (Teamviewer)" off \
5 "Gestor de correo de Mozilla (Thunderbird)" off \
6 "Gestor de correo estilo Outlook (Evolution)" off \
7 "Mapa del mundo 3D con fotos (Google Earth)" off \
8 "Mensajeria y comunicacion por voIp (Skype)" off \
9 "Navegador web Chrome (de Google)" off \
10 "Navegador web Chromium (basado en chrome, open-source)" off \
11 "Navegador web Firefox (de Mozilla)" on \
12 "Navegador web Midori (ligero)" off \
13 "Navegador web Opera (de Opera Software)" off \
14 "Sincronizacion con la nube de Dropbox" off \
15 "Sincronizacion con la nibe de Ubuntu One" off`

if [ $? -eq 0 ]
then
   for i in $internet
   do
      case $i in
		1) paquetesRepositorio+=" ${pidgin[0]}"
		   programasOpcionales+=" ${pidgin[1]}";;
		2) paquetesRepositorio+=" ${remmina[0]}"
		   programasOpcionales+=" ${remmina[1]}";;
		3) paquetesRepositorio+=" ${filezilla[0]}"
		   programasOpcionales+=" ${filezilla[1]}";;
		4) if [ `uname -i` == "x86_64" ]
           then
               urlsDeb+=" ${debTeamviewer64[0]}"
               paquetesDeb+=" ${debTeamviewer64[1]}"
               programasOpcionales+=" ${debTeamviewer64[2]}"
           else
               urlsDeb+=" ${debTeamviewer32[0]}"
               paquetesDeb+=" ${debTeamviewer32[1]}"
               programasOpcionales+=" ${debTeamviewer32[2]}"
           fi ;;
		5) paquetesRepositorio+=" ${thunderbird[0]}"
		   programasOpcionales+=" ${thunderbird[1]}" ;;
		6) paquetesRepositorio+=" ${evolution[0]}"
		   programasOpcionales+=" ${evolution[1]}" ;;
		7) if [ `uname -i` == "x86_64" ]
		   then
				urlsDeb+=" ${debGoogleEarth64[0]}"
				paquetesDeb+=" ${debGoogleEarth64[1]}"
				programasOpcionales+=" ${debGoogleEarth64[2]}"
		   else
				urlsDeb+=" ${debGoogleEarth32[0]}"
				paquetesDeb+=" ${debGoogleEarth32[1]}"
				programasOpcionales+=" ${debGoogleEarth32[2]}"
		   fi ;;
		8) if [ `uname -i` == "x86_64" ]
		   then
				urlsDeb+=" ${debSkype64[0]}"
				paquetesDeb+=" ${debSkype64[1]}"
				programasOpcionales+=" ${debSkype64[2]}"
		   else
				urlsDeb+=" ${debSkype32[0]}"
				paquetesDeb+=" ${debSkype32[1]}"
				programasOpcionales+=" ${debSkype32[2]}"
		   fi ;;
		9) repositoriosTerceros+="${repositorioChrome[0]} 2>>log.txt; "
		   descripcionRepoTerceros+="   ${repositorioChrome[1]}\n"
		   repositorioChrome[2]=1
		   programasOpcionales+=" ${chrome[1]}" ;;
		10) paquetesRepositorio+=" ${chromium[0]}"
		   programasOpcionales+=" ${chromium[1]}" ;;
		11) paquetesRepositorio+=" ${firefox[0]}"
		    programasOpcionales+=" ${firefox[1]}" ;;
		12) paquetesRepositorio+=" ${midori[0]}"
		    programasOpcionales+=" ${midori[1]}" ;;
		13) repositoriosTerceros+="${repositorioOpera[0]} 2>>log.txt; "
		    descripcionRepoTerceros+="   ${repositorioOpera[1]}\n"
		    repositorioOpera[2]=1
		    programasOpcionales+=" ${opera[1]}" ;;
		14) if [ $instalaNemo -eq 1 ]; then
				dropbox[0]="nemo-dropbox"
			fi
			paquetesRepositorio+=" ${dropbox[0]}"
		    programasOpcionales+=" ${dropbox[1]}" ;;
		15) paquetesRepositorio+=" ${ubuntuone[0]}"
		    programasOpcionales+=" ${ubuntuone[1]}" ;;
      esac
   done
fi

if [ $instalaNemo -eq 0 ]
then
	paquetesRepositorio+=" ${terminalXfce[0]}"
	programasBase+=" ${terminalXfce[1]}"
fi

########################################################################################################################
# PASO 4: ACCIÓN A REALIZAR AL FINALIZAR LA INSTALACIÓN
########################################################################################################################
titulo="Paso 4/$totalPasos: Accion a realizar al finalizar la instalacion:"
echo "$titulo">>log.txt

accion=1
seleccionados=()
until [ $accion -eq 0 ] && [ ${#seleccionados[*]} -gt 0 ] # Se muestra el cuadro de diálogo hasta que se pulse "Aceptar".
do
   menu=`dialog --title "$titulo" --backtitle "$descripcion" --stdout --menu "Seleccionar una accion:" 13 $anchoDialogo 5 \
   1 "Mostrar log. Esperar confirmacion. Reiniciar." \
   2 "Mostrar log. Esperar confirmacion. Apagar." \
   3 "Mostrar log. Esperar confirmacion. Salir a consola." \
   4 "Reiniciar automaticamente." \
   5 "Apagar automaticamente."`
   accion=$?
   seleccionados=($menu)
done
for m in $menu
do
   case $m in
      1) accionPostInstalacion=1;;
      2) accionPostInstalacion=2;;
      3) accionPostInstalacion=3;;
      4) accionPostInstalacion=4;;
      5) accionPostInstalacion=5;;
   esac
done

########################################################################################################################
# PASO 5: RESUMEN DE LAS APLICACIONES A INSTALAR
########################################################################################################################
titulo="Paso 5/$totalPasos: Resumen de las aplicaciones a instalar:"
echo "$titulo">>log.txt
if [ $instalaLightdm -eq 0 ]; then
	dialog --title "$titulo" --backtitle "$descripcion" --msgbox "\n$escritorioXfce\n\n\n$descripcionRepoTerceros\n\n$programasBase\n\n$programasOpcionales" $altoDialogo $anchoDialogo
else
	dialog --title "$titulo" --backtitle "$descripcion" --msgbox "\n$escritorioXfce\n\n\n$gestorEscritorios\n\n\n$descripcionRepoTerceros\n\n$programasBase\n\n$programasOpcionales" $altoDialogo $anchoDialogo
fi


########################################################################################################################
# PASO 6: INSTALAR FUENTES DE MICROSOFT
########################################################################################################################
titulo="Paso 6/$totalPasos: Instalar fuentes truetype de Microsoft:"
echo "$titulo">>log.txt
clear
apt-get -y install ttf-mscorefonts-installer --fix-missing 2>>log.txt

########################################################################################################################
# PASO 7: ACTUALIZAR REPOSITORIOS
########################################################################################################################
titulo="Paso 7/$totalPasos: Actualizando Repositorios ..."
echo "$titulo">>log.txt
comandos=""
if [ -n "$repositoriosTerceros" ]
then
	echo "Repositorios de terceros: $repositoriosTerceros">>log.txt
	comandos+="echo 'Agregando repositorios de terceros ...'; "
	# Se agregan los repositorios de terceros necesarios
	comandos+="$repositoriosTerceros"
	comandos+="echo \n'Actualizando repositorios ...'; "
fi
comandos+="apt-get update --fix-missing 2>>log.txt"
eval $comandos | dialog --title "$titulo" --backtitle "$descripcion" --progressbox $altoDialogo $anchoDialogo

########################################################################################################################
# PASO 8: ACTUALIZAR SISTEMA OPERATIVO
########################################################################################################################
titulo="Paso 8/$totalPasos: Actualizando Sistema Operativo ..."
echo "$titulo">>log.txt
apt-get -y dist-upgrade --fix-missing 2>>log.txt | dialog --title "$titulo" --backtitle "$descripcion" --progressbox $altoDialogo $anchoDialogo

########################################################################################################################
# PASO 9: INSTALAR ESCRITORIO XFCE
########################################################################################################################
titulo="Paso 9/$totalPasos: Instalando Escritorio Xfce ..."
echo "$titulo">>log.txt
apt-get -y install xfce4 2>&1 | dialog --title "$titulo" --backtitle "$descripcion" --progressbox $altoDialogo $anchoDialogo
if [ $? -ne 0 ]
then
   echo "Se ha producido al menos un error instalando el escritorio Xfce. Se aborta la instalacion" >>log.txt
   echo "Se ha producido al menos un error instalando el escritorio Xfce. Se aborta la instalacion"
   exit 1
fi

########################################################################################################################
# PASO 10: INSTALAR APLICACIONES
########################################################################################################################
titulo="Paso 10/$totalPasos: Instalando aplicaciones ..."
comandos="echo '$titulo'>>log.txt;"
# Se instalan los paquetes del repositorio estándar
if [ $instalaNemo -eq 1 ]
then
	# Se instala Nemo
	comandos+="apt-get -y install ${nemo[0]} --no-install-recommends --fix-missing 2>>log.txt;"
	# Se establece como explorador de ficheros predeterminado Nemo
	comandos+="mkdir -p /home/$usuario/.config/xfce4 2>>log.txt;"
	comandos+="cp ./conf/helpers.rc /home/$usuario/.config/xfce4/ 2>>log.txt;"
	comandos+="mkdir -p /etc/skel/.config/xfce4 2>>log.txt;"
        comandos+="cp ./conf/helpers.rc /etc/skel/.config/xfce4/ 2>>log.txt;"
        comandos+="mkdir -p /home/$usuario/.local/share/xfce4/helpers 2>>log.txt;"
        comandos+="cp ./conf/nemo.desktop /home/$usuario/.local/share/xfce4/helpers/ 2>>log.txt;"
	comandos+="mkdir -p /etc/skel/.local/share/xfce4/helpers 2>>log.txt;"
	comandos+="cp ./conf/nemo.desktop /etc/skel/.local/share/xfce4/helpers/ 2>>log.txt;"
	# Se asocia los previews de imágenes y videos a Nemo por medio de ffmpegthumbnailer
	comandos+="mkdir /usr/share/thumbnailers 2>>log.txt;"
	comandos+="cp ./conf/video.thumbnailer /usr/share/thumbnailers/ 2>>log.txt;"
fi
comandos+="apt-get -y install $paquetesRepositorio --fix-missing 2>>log.txt;"

# Se instala el tema de iconos de Faenza
comandos+="apt-get -y install ${faenza[0]} --fix-missing 2>>log.txt;"

# Se instala el administrador de Grub2
if [ ${repositorioGrubCustomizer[2]} -eq 1 ]
then
	comandos+="apt-get -y install ${grubcustomizer[0]} --fix-missing 2>>log.txt;"
fi

# Se instalan los paquetes de terceros
if [ ${repositorioChrome[2]} -eq 1 ]
then
   comandos+="apt-get -y install ${chrome[0]} --fix-missing 2>>log.txt;"
fi
if [ ${repositorioOpera[2]} -eq 1 ]
then
   comandos+="apt-get -y install ${opera[0]} --fix-missing 2>>log.txt;"
fi
if [ ${repositoriojDownloader[2]} -eq 1 ]
then
   comandos+="apt-get -y install ${jdownloader[0]} --fix-missing 2>>log.txt;"
fi
if [ ${repositorioJupiter[2]} -eq 1 ]
then
   comandos+="apt-get -y install ${jupiter[0]} --fix-missing 2>>log.txt;"
fi
if [ ${repositorioNemo[2]} -eq 1 ]
then
	comandos+="apt-get -y install ${nemo[0]} --fix-missing 2>>log.txt;"
fi

# Se instalan los paquetes deb sin repositorios
if [ -n "$urlsDeb" ] # Se comprueba que no sea un string vacio
then
   # Se descargan e instalan los paquetes debs de los programas seleccionados
   arrayUrlsDeb=($urlsDeb)
   arrayPaquetesDeb=($paquetesDeb)
   # Si no se ha instalado gdebi, se procede a instalar ahora
   if [ $instalaGdebi -eq 0 ]; then
		comandos+="apt-get -y install ${gdebi[0]} --fix-missing 2>>log.txt;"
   fi   
   for indice in ${!arrayUrlsDeb[*]}
   do
      comandos+="wget -O /var/cache/apt/archives/${arrayPaquetesDeb[$indice]} ${arrayUrlsDeb[$indice]} 2>&1;"      
      comandos+="gdebi --n /var/cache/apt/archives/${arrayPaquetesDeb[$indice]} 2>>log.txt;"
   done
fi
eval $comandos | dialog --title "$titulo" --backtitle "$descripcion" --progressbox $altoDialogo $anchoDialogo

if [ -n "$scripts" ]
then
   # Se ejecutan los scripts de otros programas. Aquellos que necesitan instalación personalizada: descomprimir, etc.
   for script in $scripts
   do
      bash $script "$usuario" "$titulo" "$descripcion;"
   done
fi

########################################################################################################################
# PASO 11: LIMPIAR PAQUETES USADOS EN LA INSTALACION
########################################################################################################################
titulo="Paso 11/$totalPasos: Limpiando paquetes no usados ..."
echo "$titulo">>log.txt
comandos="apt-get -y remove $programasEliminar 2>>log.txt;" 
# Se eliminan dependencias innecesarias
comandos+="apt-get -y autoremove 2>>log.txt;"
# Se elimina la caché de disco de programas descargados
comandos+="apt-get -y clean 2>>log.txt"
eval $comandos | dialog --title "$titulo" --backtitle "$descripcion" --progressbox $altoDialogo $anchoDialogo

########################################################################################################################
# PASO 12: CONFIGURACIONES VARIAS
########################################################################################################################
titulo="Paso 12/$totalPasos: Realizando configuraciones finales ..."
echo "$titulo">>log.txt

comandos="echo 'Agregando iconos nuevos a la caché del sistema ...' 2>>log.txt;"
# Se copian los nuevos iconos (aplicaciones, sistema, etc) a la carpeta de iconos del sistema
comandos+="cp -R ./icons/hicolor/* /usr/share/icons/hicolor/ 2>>log.txt;"
# Se actualiza la caché de iconos para que coja los nuevos iconos
comandos+="gtk-update-icon-cache /usr/share/icons/hicolor/ 2>>log.txt;"
# Se copian más iconos al tema Faenza para completar los necesarios para Xfce y el icono utorrent-Faenza
comandos+="mkdir -p /usr/share/icons/Faenza ;"
comandos+="cp -R ./icons/Faenza/* /usr/share/icons/Faenza/ 2>>log.txt;"
# Se copian los iconos de Faenza-Custom (Faenza-Dark con icono de PC tomado de Linux-Mint).
comandos+="mkdir -p /usr/share/icons/Faenza-Custom ;"
comandos+="cp -R ./icons/Faenza-Custom/* /usr/share/icons/Faenza-Custom/ 2>>log.txt;"
# Se añade el tema faenza a aMule
comandos+="mkdir -p /usr/share/amule/skins ;"
comandos+="cp -R ./icons/amule-faenza/* /usr/share/amule/skins 2>>log.txt;"

comandos+="echo 'Eliminando fondo de Debian del Grub ...' 2>>log.txt;"
comandos+="rm /usr/share/images/desktop-base/desktop-grub.png 2>>log.txt;"
comandos+="update-grub2 2>>log.txt;"

comandos+="echo 'Creando lanzador al script de configuracion de Xfce ...' 2>>log.txt;"
# Se copia el fichero del script de configuración al sistema
comandos+="cp ./sh/xfce4-config.sh /usr/share/xfce4/ 2>>log.txt;"
# Se copia el lanzador al fichero de configuración
comandos+="cp ./autostart/xfce4-config.desktop /etc/xdg/autostart/ 2>>log.txt;"
if [ $instalaPyload -eq 1 ]; then
	comandos+="sed -i 's/ARGUMENTO/pyLoadInstalado/g' /etc/xdg/autostart/xfce4-config.desktop 2>>log.txt;"	
else
	comandos+="sed -i 's/ARGUMENTO//g' /etc/xdg/autostart/xfce4-config.desktop 2>>log.txt;"	
fi

comandos+="echo 'Configurando panel del escritorio del usuario ...' 2>>log.txt;"
comandos+="mkdir -p /home/$usuario/.config/xfce4/xfconf/xfce-perchannel-xml 2>>log.txt;"
comandos+="mkdir -p /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml 2>>log.txt;"
# Se copia el fichero de configuración del panel a la carpeta home del usuario. Se copia también a la carpeta skel para que cuando se creen nuevos usuarios, hereden estos ficheros de configuración
comandos+="cp ./conf/xfce4-panel.xml /home/$usuario/.config/xfce4/xfconf/xfce-perchannel-xml 2>>log.txt;"
comandos+="cp ./conf/xfce4-panel.xml /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml 2>>log.txt;"

comandos+="echo 'Configurando comparticiones samba ...' 2>>log.txt;"
# Se hace copia de seguridad del fichero de configuración de samba
comandos+="cp /etc/samba/smb.conf /etc/samba/smb.conf.backup 2>>log.txt;"
# Se añade línea de configuración en samba para permitir comparticiones de cualquier directorio del sistema
comandos+="sed -i 's/\[global\]/\[global\]\nusershare owner only = False/g' /etc/samba/smb.conf 2>>log.txt;"

comandos+="echo 'Configurando acciones personalizadas de Thunar ...' 2>>log.txt;"
# Se copia fichero de acciones personalizadas de Thunar y script de compartición de carpetas
comandos+="cp ./conf/uca.xml /etc/xdg/Thunar/uca.xml 2>>log.txt;"
comandos+="cp ./sh/share.sh /etc/xdg/Thunar/share.sh 2>>log.txt;"

if [ $instalaNemo -eq 1 ]; then
	comandos+="echo 'Eliminando entradas a Cinnamon en lista de escritorios de Lightdm ...' 2>>log.txt;"
	comandos+="mv /usr/share/xsessions/cinnamon.desktop /usr/share/xsessions/cinnamon.desktop.old 2>>log.txt;"
	comandos+="mv /usr/share/xsessions/cinnamon2d.desktop /usr/share/xsessions/cinnamon2d.desktop.old 2>>log.txt;"
fi

if [ $instalaLightdm -eq 1 ]
then
	comandos+="echo 'Personalizando pantalla de login de Lightdm ...' 2>>log.txt;"
	comandos+="cp /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.backup 2>>log.txt;"
	comandos+="cp ./conf/lightdm-gtk-greeter.conf /etc/lightdm/ 2>>log.txt;"
	if [ $versionUbuntu == "12.04" ]; then
		# El tema que se pone por defecto es "greybird-git"
		comandos+="sed -i 's/theme-name=TEMA/theme-name=greybird-git/g' /etc/lightdm/lightdm-gtk-greeter.conf 2>>log.txt;"
	else
		if [ $versionUbuntu == "12.10" ]; then
			# El tema que se pone por defecto es "Greybird"
			comandos+="sed -i 's/theme-name=TEMA/theme-name=Greybird/g' /etc/lightdm/lightdm-gtk-greeter.conf 2>>log.txt;"
		else
			# El tema que se pone por defecto es "Blackbird"
			comandos+="sed -i 's/theme-name=TEMA/theme-name=Blackbird/g' /etc/lightdm/lightdm-gtk-greeter.conf 2>>log.txt;"
		fi
	fi
	if [ $versionUbuntu == "12.04" || $versionUbuntu == "12.10" ] ; then
		# Se cambia el icono por defecto de lightdm a uno de xfce-faenza
		comandos+="cp /usr/share/lightdm-gtk-greeter/greeter.ui /usr/share/lightdm-gtk-greeter/greeter.ui.backup 2>>log.txt;"
		comandos+="sed -i 's/<property name=\"icon_name\">computer/<property name=\"icon_name\">xfce/g' /usr/share/lightdm-gtk-greeter/greeter.ui 2>>log.txt;"
	fi

	comandos+="echo 'Configurando Lightdm para que inicie por defecto el escritorio Xfce...' 2>>log.txt;"
	# Equivale a editar /etc/lightdm/lightdm.conf e insertar o cambiar la línea: user-session=xfce
	comandos+="/usr/lib/lightdm/lightdm-set-defaults -s xfce 2>>log.txt;"

	if [ $inicioAutomatico -eq 1 ]
	then
		comandos+="echo 'Configurando Lightdm para el inicio de sesion automatico del usuario...'>>log.txt;"
		comandos+="echo \"autologin-user=$usuario\" >>/etc/lightdm/lightdm.conf 2>>log.txt;"
		comandos+="echo 'autologin-user-timeout=0' >>/etc/lightdm/lightdm.conf 2>>log.txt;"
	fi
fi

if [ $instalaCompiz -eq 1 ] # Se ha instalado efectos de escritorio
then
   comandos+="echo 'Creando autoarranque de Compiz en el inicio de sesion ...' 2>>log.txt;"
   # Se copia lanzador de arranque global. Para todas las sesiones de usuario
   comandos+="cp ./autostart/compiz.desktop /etc/xdg/autostart/ 2>>log.txt;"
   # Se crea lanzador de arranque desactivado para la sesión de usuario (Por defecto, compiz está desactivado)
   comandos+="mkdir -p /home/$usuario/.config/autostart 2>>log.txt;"
   comandos+="echo '[Desktop Entry]' > /home/$usuario/.config/autostart/compiz.desktop 2>>log.txt;"
   comandos+="echo 'Hidden=true' >> /home/$usuario/.config/autostart/compiz.desktop 2>>log.txt;"
   comandos+="chmod 664 /home/$usuario/.config/autostart/compiz.desktop 2>>log.txt;"
   # Se crea lanzador de arranque desactivado en el directorio skel para los futuros usuarios que se creen del sistema.
   comandos+="mkdir -p /etc/skel/.config/autostart 2>>log.txt;"
   comandos+="cp /home/$usuario/.config/autostart/compiz.desktop /etc/skel/.config/autostart 2>>log.txt;"
fi

comandos+="chown $usuario:$usuario -R /home/$usuario/.config 2>>log.txt;"
comandos+="chown $usuario:$usuario -R /home/$usuario/.local 2>>log.txt;"

if [ $instalaNetworkManager -eq 1 ] # Se ha instalado Network Manager
then
	comandos+="echo 'Desconfigurando interfaces de red ...' 2>>log.txt;"
	# Se hace una copia del fichero de interfaces de red
	comandos+="cp /etc/network/interfaces /etc/network/interfaces.old 2>>log.txt;"
	# Se copia fichero sin configuración de las interfaces de red
	comandos+="cp ./conf/interfaces /etc/network/ 2>>log.txt;"
fi
eval $comandos | dialog --title "$titulo" --backtitle "$descripcion" --progressbox $altoDialogo $anchoDialogo

if [ $configuraAmuleDaemon -eq 1 ]
then
	comandos+="echo 'Configuracion por defecto de aMule ...' 2>>log.txt;"
	# Este fichero establece el tema Faenza por defecto y activa el control remoto de la aplicación
	comandos+="mkdir /home/$usuario/.aMule 2>>log.txt;"
	comandos+="cp ./conf/amule.conf /home/$usuario/.aMule 2>>log.txt;"
	comandos+="chown -R $usuario:$usuario /home/$usuario/.aMule 2>>log.txt;"
	comandos+="mkdir /etc/skel/.aMule 2>>log.txt;"
	comandos+="cp ./conf/amule.conf /etc/skel/.aMule 2>>log.txt;"
	# Se selecciona el tema Faenza en aMuleGui
	comandos+="sed -i 's/Skin=/Skin=System:faenza.zip/g' /home/$usuario/.aMule/remote.conf 2>>log.txt"
	
	eval $comandos | dialog --title "$titulo" --backtitle "$descripcion" --progressbox $altoDialogo $anchoDialogo
	# En el caso de haber seleccionado amule-daemon, se ejecuta script de configuración
	bash ./sh/amule-daemon.sh "$usuario" "$titulo" "$descripcion"
fi

########################################################################################################################
# PASO 13: LOG DE INSTALACION
########################################################################################################################
cp ./log.txt /home/$usuario >/dev/null
chown $usuario:$usuario /home/$usuario/log.txt >/dev/null 2>&1

case $accionPostInstalacion in
	1) textoPI="Se procede a reiniciar el sistema."
		accionPI="reboot"
		echo "Mostrar log y reinicir sistema..." >> log.txt;;
	2) textoPI="Se procede a apagar el sistema."
		accionPI="poweroff"
		echo "Mostrar log y apagar sistema..." >> log.txt;;
	3) textoPI="Se procede a salir a consola."
		accionPI="cd /home/$usuario"
		echo "Mostrar log y salir a consola..." >> log.txt;;
	4) accionPI="reboot"
		echo "Reiniciar sistema..." >> log.txt;;
	5) accionPI="poweroff"
		echo "Apagar sistema..." >> log.txt;;
esac
	
if [ $accionPostInstalacion -le 3 ]
then
	dialog --title "Log de la instalacion:" --backtitle "$descripcion" --textbox "./log.txt" $altoDialogo $anchoDialogo

	alto=13
	texto=""
	if [ $configuraAmuleDaemon -eq 1 ]
	then
		alto=$(($alto+3))
		texto+="\nPara conectarse a aMule-Daemon:
Menu->Internet->aMuleGUI-> Conectar a:localhost;\n
Puerto:4712; usuario:amule; contrasena:admin\n"
	fi
	if [ $instalaDeluged -eq 1 ]
	then
		alto=$(($alto+5))
		texto+="\nPara conectarse a Deluged:\n
1. Aplicacion: Menu->Internet->Deluge-> Usar asistente de conexion remota.\n
   Para agregar usuario remoto: nano .config/deluge/auth-> $usuario:CONTRASENA:10\n
2. Web: Menu->Internet->Deluge-Web-> contraseña: deluge\n
   Para cambiar contrasena: Usar preferencias en pagina web de deluge"
	fi
	if [ $instalaPyload -eq 1 ]
	then
		alto=$(($alto+3))
		texto+="\nPara conectarse a Pyload:
Menu->Internet->pyLoad Web-> usuario:<<ElQueEspecifique>>; contrasena:<<LaQueEspecifique>>\n
La primera vez que ejecute pyLoad le pedira especificar usuario y contrasena."
	fi
	if [ $instalaQbittorrentDaemon -eq 1 ]
	then
		alto=$(($alto+2))
		texto+="\nPara conectarse a qBittorrent Nox Daemon:
Menu->Internet->qBittorrent Nox Daemon-> usuario:admin; contrasena:adminadmin\n"
	fi
	
	if [ $instalaUtorrent -eq 1 ]
	then
		alto=$(($alto+2))
		texto+="\nPara conectarse a Utorrent Server:
Menu->Internet->utorrent-> usuario:admin; contrasena:\n"
	fi

	texto+="\nPara volver a consultar el log ejecutar desde consola:\n
nano /home/$usuario/log.txt\n
\n$textoPI\n"
	dialog --title "Instalacion finalizada." --backtitle "$descripcion" --msgbox "$texto" $alto $anchoDialogo
fi
eval $accionPI 2>>log.txt
