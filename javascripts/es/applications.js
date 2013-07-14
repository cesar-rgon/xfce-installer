var applicationData = {
	title: "Lista de aplicaciones del script",
	mainDescription: "Listado de aplicaciones que puede seleccionar el usuario durante el proceso de instalación del script",
	categoryText: "Categoría",
	homepageText: "Página Web",
	categoryList: [
		{ category: "Accesorios",
		  applicationList: [
			{name: "Alacarte. Editor de menú", image: "../../images/applications/alacarte.jpg", homepage: "https://launchpad.net/alacarte", description: "Editor de lanzadores en el menú del panel del escritorio", id: "a1"},
			{name: "Buscador de Aplicaciones", image: "../../images/applications/application-finder.jpg", homepage: "http://docs.xfce.org/xfce/xfce4-appfinder/start", description: "Busca aplicaciones por nombre", id: "a2"},
			{name: "Captura-pantallas de Xfce", image: "../../images/applications/xfce4-screenshooter.jpg", homepage: "http://goodies.xfce.org/projects/applications/xfce4-screenshooter", description: "Te permite capturar la pantalla entera, la ventana activa o una región seleccionada", id: "a3"},
			{name: "Catfish", image: "../../images/applications/catfish.jpg", homepage: "http://twotoasts.de/index.php/catfish/", description: "Utilidad gráfica para realizar busqueda de ficheros", id: "a4"},
			{name: "File Roller", image: "../../images/applications/file-roller.jpg", homepage: "http://fileroller.sourceforge.net/", description: "Herramienta gráfica para comprimir-descomprimir ficheros", id: "a5"},
			{name: "Galculator", image: "../../images/applications/galculator.jpg", homepage: "http://galculator.sourceforge.net/", description: "Calculadora de Xfce", id: "a6"},
			{name: "Nemo", image: "../../images/applications/nemo.jpg", homepage: "http://en.wikipedia.org/wiki/Nemo_%28file_manager%29", description: "Explorador de ficheros de Cinnamon", id: "a7"},
			{name: "Notas de Xfce", image: "../../images/applications/xfce4-notes.jpg", homepage: "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin", description: "Notas post-it de Xfce", id: "a8"},
			{name: "Orage", image: "../../images/applications/orage.jpg", homepage: "https://launchpad.net/orage", description: "Fecha y calendario de Xfce", id: "a9"},
			{name: "Terminal de Gnome", image: "../../images/applications/terminal.jpg", homepage: "https://launchpad.net/gnome-terminal", description: "Consola de Gnome", id: "a10"},
			{name: "Terminal de Xfce", image: "../../images/applications/terminal.jpg", homepage: "http://docs.xfce.org/apps/terminal/start", description: "Consola de Xfce", id: "a11"},
			{name: "Thunar", image: "../../images/applications/thunar.jpg", homepage: "http://docs.xfce.org/xfce/thunar/start", description: "Explorador de ficheros de Xfce", id: "a12"}
		  ]
		},
		{ category: "Desarrollo",
		  applicationList: [
			{name: "Bluefish", image: "../../images/applications/bluefish.jpg", homepage: "http://bluefish.openoffice.nl/index.html", description: "Editor avanzado para desarrollo web", id: "a13"},
			{name: "Geany", image: "../../images/applications/geany.jpg", homepage: "http://www.geany.org/", description: "Editor de texto avanzado para edicion y programacion", id: "a14"},
			{name: "Open JDK", image: "../../images/applications/open-jdk.jpg", homepage: "http://openjdk.java.net/", description: "Versión open-source de las herramientas de desarrollo Java", id: "a15"}
		  ]
		},
		{ category: "Educación",
		  applicationList: [
			{name: "Klavaro", image: "../../images/applications/klavaro.jpg", homepage: "http://klavaro.sourceforge.net/en/", description: "Curso de mecanografía", id: "a16"}
		  ]
		},
		{ category: "Gráficos",
		  applicationList: [
			{name: "Gimp", image: "../../images/applications/gimp.jpg", homepage: "http://www.gimp.org/", description: "Editor de imágenes avanzado", id: "a17"},
			{name: "Gpicview", image: "../../images/applications/gpicview.jpg", homepage: "http://lxde.sourceforge.net/gpicview/", description: "Visor de imágenes ligero", id: "a18"}
		  ]		
		},
		{ category: "Internet",
		  applicationList: [
			{name: "aMule", image: "../../images/applications/amule.jpg", homepage: "http://amule.forumer.com/index.php", description: "Cliente de descargas P2P para enlaces eDonkey", id: "a19"},
			{name: "Chrome", image: "../../images/applications/chrome.jpg", homepage: "https://www.google.com/intl/es/chrome/browser/", description: "Navegador web de Google", id: "a20"},
			{name: "Chromium", image: "../../images/applications/chromium.jpg", homepage: "http://www.chromium.org/Home", description: "Navegador web open-source basado en Chrome", id: "a21"},
			{name: "Deluge", image: "../../images/applications/deluge.jpg", homepage: "http://deluge-torrent.org/", description: "Cliente de descargas P2P para enlaces torrent", id: "a22"},
			{name: "Dropbox", image: "../../images/applications/dropbox.jpg", homepage: "https://www.dropbox.com/", description: "Servicio de sincronización con la nube", id: "a23"},
			{name: "Evolution", image: "../../images/applications/evolution.jpg", homepage: "http://projects.gnome.org/evolution/", description: "Cliente de correos similar a Outlook", id: "a24"},
			{name: "Filezilla", image: "../../images/applications/filezilla.jpg", homepage: "https://filezilla-project.org/", description: "Cliente FTP", id: "a25"},
			{name: "Firefox", image: "../../images/applications/firefox.jpg", homepage: "http://www.mozilla.org/es-ES/firefox/new/", description: "Navegador web de Mozilla", id: "a26"},
			{name: "Google Earth", image: "../../images/applications/google-earth.jpg", homepage: "http://www.google.com/intl/es/earth/index.html", description: "Fotografías, imágenes por satélite y vistas 3D de calles", id: "a27"},
			{name: "jDownloader", image: "../../images/applications/jdownloader.jpg", homepage: "http://jdownloader.org/es/home/index?s=lng_es", description: "Gestor de descarga directa desde servidores de Internet", id: "a28"},
			{name: "Microtorrent", image: "../../images/applications/utorrent.jpg", homepage: "http://www.utorrent.com/intl/es/", description: "Servidor de descargas P2P para enlaces torrent", id: "a29"},
			{name: "Midori", image: "../../images/applications/midori.jpg", homepage: "http://twotoasts.de/index.php/midori/", description: "Navegador web de Xfce", id: "a30"},
			{name: "Opera", image: "../../images/applications/opera.jpg", homepage: "http://www.opera.com", description: "Navegador web de Opera Software", id: "a31"},
			{name: "Pidgin", image: "../../images/applications/pidgin.jpg", homepage: "http://www.pidgin.im/", description: "Cliente multiprotocolo de mensajeria instantanea", id: "a32"},
			{name: "Pyload", image: "../../images/applications/pyload.jpg", homepage: "http://pyload.org/", description: "Gestor de descarga directa desde servidores de Internet", id: "a33"},
			{name: "Qbittorrent", image: "../../images/applications/qbittorrent.jpg", homepage: "http://www.qbittorrent.org/", description: "Cliente de descargas P2P para enlaces torrent", id: "a34"},
			{name: "Remmina", image: "../../images/applications/remmina.jpg", homepage: "http://remmina.sourceforge.net/", description: "Conexion remota a traves de protocolos RDP, SFTP, SSH o VNC", id: "a35"},
			{name: "Skype", image: "../../images/applications/skype.jpg", homepage: "http://www.skype.com/es/", description: "Cliente de mensajeria instantanea y VoIP", id: "a36"},
			{name: "Teamviewer", image: "../../images/applications/teamviewer.jpg", homepage: "http://www.teamviewer.com/es/index.aspx", description: "Cliente de conexion remota. Controla escritorio remoto", id: "a37"},
			{name: "Thunderbird", image: "../../images/applications/thunderbird.jpg", homepage: "https://www.mozilla.org/es-ES/thunderbird/", description: "Cliente de correos de Mozilla", id: "a38"},
			{name: "Ubuntu One", image: "../../images/applications/ubuntu-one.jpg", homepage: "https://one.ubuntu.com/", description: "Servicio de sincronizacion con la nube de Canonical", id: "a39"}
		  ]		
		},		
		{ category: "Juegos",
		  applicationList: [
			{name: "Steam", image: "../../images/applications/steam.jpg", homepage: "http://store.steampowered.com/?l=spanish", description: "Plataforma de juegos online", id: "a40"}
		  ]		
		},	
		{ category: "Multimedia",
		  applicationList: [
			{name: "Audacious", image: "../../images/applications/audacious.jpg", homepage: "http://audacious-media-player.org/", description: "Reproductor de audio MP3 estilo WinAmp", id: "a41"},
			{name: "Clementine", image: "../../images/applications/clementine.jpg", homepage: "http://www.clementine-player.org/es/", description: "Biblioteca de musica completa y reproductor de audio", id: "a42"},
			{name: "Gcstar", image: "../../images/applications/gcstar.jpg", homepage: "http://www.gcstar.org/", description: "Catalogador de peliculas, musica y libros", id: "a43"},
			{name: "Gmplayer", image: "../../images/applications/gmplayer.jpg", homepage: "http://www.mplayerhq.hu", description: "Interfaz gráfica para el reproductor multimedia Mplayer", id: "a44"},
			{name: "Guvcview", image: "../../images/applications/guvcview.jpg", homepage: "http://guvcview.sourceforge.net/", description: "Herramienta para capturar fotos y videos desde tu camara web", id: "a45"},
			{name: "Mezclador de Xfce", image: "../../images/applications/xfce4-mixer.jpg", homepage: "https://launchpad.net/xfce4-mixer", description: "Mixer and audio device control", id: "a46"},
			{name: "TV en Linux", image: "../../images/applications/tv-en-linux.jpg", homepage: "http://www.tvenlinux.com/", description: "Canales espanoles de television online", id: "a47"},
			{name: "Videolan", image: "../../images/applications/videolan.jpg", homepage: "http://www.videolan.org/index.es.html", description: "Reproductor multimedia con codecs propios", id: "a48"},
			{name: "Xbmc", image: "../../images/applications/xbmc.jpg", homepage: "http://xbmc.org/", description: "Centro multimedia completo", id: "a49"},
			{name: "Xfburn", image: "../../images/applications/xfburn.jpg", homepage: "http://goodies.xfce.org/projects/applications/xfburn", description: "Utilidad de grabacion de CD o DVD", id: "a50"}
		  ]		
		},
		{ category: "Oficina",
		  applicationList: [
			{name: "Abiword", image: "../../images/applications/abiword.jpg", homepage: "http://www.abisource.com/", description: "Editor ligero de documentos de texto", id: "a51"},
			{name: "Calibre", image: "../../images/applications/calibre.jpg", homepage: "http://calibre-ebook.com/", description: "Visor, conversor y catalogador de ebooks", id: "a52"},
			{name: "Evince", image: "../../images/applications/evince.jpg", homepage: "http://projects.gnome.org/evince/", description: "Visor de documentos Pdf", id: "a53"},
			{name: "Gedit", image: "../../images/applications/gedit.jpg", homepage: "http://projects.gnome.org/gedit/", description: "Editor de textos por defecto de Gnome", id: "a54"},
			{name: "Gnumeric", image: "../../images/applications/gnumeric.jpg", homepage: "http://projects.gnome.org/gnumeric/", description: "Editor ligero de hojas de cálculo", id: "a55"},
			{name: "Libreoffice", image: "../../images/applications/libreoffice.jpg", homepage: "http://www.libreoffice.org/", description: "Suite ofimática para documentos, hojas de calculo y otros", id: "a56"},
			{name: "Lucky Backup", image: "../../images/applications/lucky-backup.jpg", homepage: "http://luckybackup.sourceforge.net/", description: "Sincronizador de ficheros y copias de seguridad", id: "a57"},
			{name: "Mcomix", image: "../../images/applications/mcomix.jpg", homepage: "http://sourceforge.net/p/mcomix/wiki/Home/", description: "Visor de comics", id: "a58"},
			{name: "Mousepad", image: "../../images/applications/mousepad.jpg", homepage: "http://git.xfce.org/apps/mousepad/", description: "Editor de textos sencillo de Xfce", id: "a59"},
			{name: "Simple Scan", image: "../../images/applications/simple-scan.jpg", homepage: "https://launchpad.net/simple-scan", description: "Escaneador de documentos", id: "a60"}
		  ]		
		},		
		{ category: "Sistema",
		  applicationList: [
			{name: "Bleachbit", image: "../../images/applications/bleachbit.jpg", homepage: "http://bleachbit.sourceforge.net/", description: "Utilidad de limpieza del sistema", id: "a61"},
			{name: "Centro Software Lubuntu", image: "../../images/applications/lubuntu-software-center.jpg", homepage: "https://launchpad.net/lubuntu-software-center", description: "Gestor de programas de Lxde", id: "a62"},
			{name: "Centro Software Ubuntu", image: "../../images/applications/ubuntu-software-center.jpg", homepage: "https://launchpad.net/software-center", description: "Gestor de programas de Gnome", id: "a63"},
			{name: "Compiz", image: "../../images/applications/compiz.jpg", homepage: "http://www.compiz.org/", description: "Gestor de composicion Opengl con efectos de escritorio", id: "a64"},
			{name: "Gdebi", image: "../../images/applications/gdebi.jpg", homepage: "https://launchpad.net/gdebi", description: "Instalador de paquetes Deb", id: "a65"},
			{name: "Tareas programadas", image: "../../images/applications/gnome-schedule.jpg", homepage: "http://gnome-schedule.sourceforge.net/", description: "Administrador de tareas programadas", id: "a66"},
			{name: "Log del sistema de Gnome", image: "../../images/applications/logviewer.jpg", homepage: "https://launchpad.net/gnome-system-log", description: "Visor de registro del sistema de Gnome", id: "a67"},
			{name: "Gparted", image: "../../images/applications/gparted.jpg", homepage: "http://gparted.sourceforge.net/", description: "Herramienta de administración de particiones del disco duro", id: "a68"},
			{name: "Grub Customizer", image: "../../images/applications/grub-customizer.jpg", homepage: "https://launchpad.net/grub-customizer", description: "Administrador de Grub2", id: "a69"},
			{name: "Hard Info", image: "../../images/applications/hard-info.jpg", homepage: "http://wiki.hardinfo.org/HomePage", description: "Herramienta de deteccion de hardware", id: "a70"},
			{name: "Likewise Open", image: "../../images/applications/likewise.jpg", homepage: "http://www.powerbrokeropen.org/", description: "Servicios de autenticacion para dominios del Directorio Activo", id: "a71"},
			{name: "Lxtask. Monitor de sistema", image: "../../images/applications/monitor-sistema.jpg", homepage: "https://launchpad.net/ubuntu/+source/lxtask", description: "Administrador de tareas ligero y monitor del sistema", id: "a72"},
			{name: "Monitor de sistema de Gnome", image: "../../images/applications/monitor-sistema.jpg", homepage: "https://launchpad.net/ubuntu/+source/gnome-system-monitor", description: "Administrador de tareas y monitor del sistema de Gnome", id: "a73"},
			{name: "Network Manager", image: "../../images/applications/network-manager.jpg", homepage: "http://projects.gnome.org/NetworkManager/", description: "Gestor de perfiles de red cableada e inalambrica", id: "a74"},
			{name: "Samba", image: "../../images/applications/samba.jpg", homepage: "https://launchpad.net/samba", description: "Servidor de archivos y comparticiones en la red compatible con Windows", id: "a75"},
			{name: "Synaptic", image: "../../images/applications/synaptic.jpg", homepage: "http://www.nongnu.org/synaptic/", description: "Herramienta gráfica para la gestión de paquetes del sistema", id: "a76"},
			{name: "Update Manager", image: "../../images/applications/update-manager.jpg", homepage: "https://launchpad.net/ubuntu/+source/update-manager", description: "Administrador de actualizaciones del sistema", id: "a77"},
			{name: "Usuarios y Grupos", image: "../../images/applications/users-groups.jpg", homepage: "https://launchpad.net/ubuntu/+source/gnome-system-tools", description: "Herramienta gráfica para gestión de usuarios del sistema", id: "a78"},
			{name: "Virtualbox", image: "../../images/applications/virtual-box.jpg", homepage: "https://www.virtualbox.org/", description: "Virtualizacion para diferentes sistemas operativos", id: "a79"},
			{name: "Wine", image: "../../images/applications/wine.jpg", homepage: "http://www.winehq.org/", description: "Emulador de software de Windows", id: "a80"},
			{name: "Xscreensaver", image: "../../images/applications/xscreensaver.jpg", homepage: "http://www.jwz.org/xscreensaver/", description: "Salvapantallas de Xfce", id: "a81"}
		  ]		
		}
	]
}

var applicationsTemplate = Handlebars.templates['applications.template']; 
document.getElementById('content-and-aside').innerHTML = applicationsTemplate(applicationData);
