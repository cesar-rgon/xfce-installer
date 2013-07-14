var applicationData = {
	title: "Script's application list",
	mainDescription: "Application list that can be selected by user during script's installation process",
	categoryText: "Category",
	homepageText: "Homepage",
	categoryList: [
		{ category: "Accessories",
		  applicationList: [
			{name: "Alacarte Menu Editor", image: "../../images/applications/alacarte.jpg", homepage: "https://launchpad.net/alacarte", description: "Application launchers editor for desktop panel menu", id: "a1"},
			{name: "Application Finder", image: "../../images/applications/application-finder.jpg", homepage: "http://docs.xfce.org/xfce/xfce4-appfinder/start", description: "Search applications by name", id: "a2"},
			{name: "Catfish", image: "../../images/applications/catfish.jpg", homepage: "http://twotoasts.de/index.php/catfish/", description: "Graphic tool for file searching", id: "a4"},
			{name: "File Roller", image: "../../images/applications/file-roller.jpg", homepage: "http://fileroller.sourceforge.net/", description: "Graphic tool for file compression and uncompression", id: "a5"},
			{name: "Galculator", image: "../../images/applications/galculator.jpg", homepage: "http://galculator.sourceforge.net/", description: "Xfce's calculator", id: "a6"},
			{name: "Gnome Terminal", image: "../../images/applications/terminal.jpg", homepage: "https://launchpad.net/gnome-terminal", description: "Gnome's console", id: "a10"},			
			{name: "Nemo", image: "../../images/applications/nemo.jpg", homepage: "http://en.wikipedia.org/wiki/Nemo_%28file_manager%29", description: "Cinnamon's file manager", id: "a7"},
			{name: "Orage", image: "../../images/applications/orage.jpg", homepage: "https://launchpad.net/orage", description: "Xfce's date and calendar", id: "a9"},
			{name: "Thunar", image: "../../images/applications/thunar.jpg", homepage: "http://docs.xfce.org/xfce/thunar/start", description: "Xfce's file manager", id: "a12"},
			{name: "Xfce Notes", image: "../../images/applications/xfce4-notes.jpg", homepage: "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin", description: "Xfce's post-it notes", id: "a8"},
			{name: "Xfce Screenshooter", image: "../../images/applications/xfce4-screenshooter.jpg", homepage: "http://goodies.xfce.org/projects/applications/xfce4-screenshooter", description: "It allows you to capture the entire screen, the active window or a selected region", id: "a3"},
			{name: "Xfce Terminal", image: "../../images/applications/terminal.jpg", homepage: "http://docs.xfce.org/apps/terminal/start", description: "Xfce's console", id: "a11"}
		  ]
		},
		{ category: "Development",
		  applicationList: [
			{name: "Bluefish", image: "../../images/applications/bluefish.jpg", homepage: "http://bluefish.openoffice.nl/index.html", description: "Advanced editor for web development", id: "a13"},
			{name: "Geany", image: "../../images/applications/geany.jpg", homepage: "http://www.geany.org/", description: "Advanced text editor for edition and programming", id: "a14"},
			{name: "Open JDK", image: "../../images/applications/open-jdk.jpg", homepage: "http://openjdk.java.net/", description: "Open-source version of Java development tools", id: "a15"}
		  ]
		},
		{ category: "Education",
		  applicationList: [
			{name: "Klavaro", image: "../../images/applications/klavaro.jpg", homepage: "http://klavaro.sourceforge.net/en/", description: "Typing course", id: "a16"}
		  ]
		},
		{ category: "Games",
		  applicationList: [
			{name: "Steam", image: "../../images/applications/steam.jpg", homepage: "http://store.steampowered.com/?l=english", description: "Online games platform", id: "a40"}
		  ]		
		},			
		{ category: "Graphics",
		  applicationList: [
			{name: "Gimp", image: "../../images/applications/gimp.jpg", homepage: "http://www.gimp.org/", description: "Advanced image editor", id: "a17"},
			{name: "Gpicview", image: "../../images/applications/gpicview.jpg", homepage: "http://lxde.sourceforge.net/gpicview/", description: "Light image viewer", id: "a18"}
		  ]		
		},
		{ category: "Internet",
		  applicationList: [
			{name: "aMule", image: "../../images/applications/amule.jpg", homepage: "http://amule.forumer.com/index.php", description: "P2P download client for eDonkey links", id: "a19"},
			{name: "Chrome", image: "../../images/applications/chrome.jpg", homepage: "https://www.google.com/intl/en/chrome/browser/", description: "Google´s web browser", id: "a20"},
			{name: "Chromium", image: "../../images/applications/chromium.jpg", homepage: "http://www.chromium.org/Home", description: "Open-source web browser based in Chrome", id: "a21"},
			{name: "Deluge", image: "../../images/applications/deluge.jpg", homepage: "http://deluge-torrent.org/", description: "P2P download client for torrent links", id: "a22"},
			{name: "Dropbox", image: "../../images/applications/dropbox.jpg", homepage: "https://www.dropbox.com/", description: "Cloud synchronization service", id: "a23"},
			{name: "Evolution", image: "../../images/applications/evolution.jpg", homepage: "http://projects.gnome.org/evolution/", description: "Mail client like Outlook", id: "a24"},
			{name: "Filezilla", image: "../../images/applications/filezilla.jpg", homepage: "https://filezilla-project.org/", description: "FTP client", id: "a25"},
			{name: "Firefox", image: "../../images/applications/firefox.jpg", homepage: "http://www.mozilla.org/en-US/firefox/new/", description: "Mozilla´s web browser", id: "a26"},
			{name: "Google Earth", image: "../../images/applications/google-earth.jpg", homepage: "http://www.google.com/intl/us/earth/index.html", description: "Photographs, satellite images and 3D street views", id: "a27"},
			{name: "jDownloader", image: "../../images/applications/jdownloader.jpg", homepage: "http://jdownloader.org/home/index?s=lng_en", description: "Direct download manager from internet servers", id: "a28"},
			{name: "Microtorrent", image: "../../images/applications/utorrent.jpg", homepage: "http://www.utorrent.com/intl/en/", description: "P2P download server for torrent links", id: "a29"},
			{name: "Midori", image: "../../images/applications/midori.jpg", homepage: "http://twotoasts.de/index.php/midori/", description: "Xfce´s web browser", id: "a30"},
			{name: "Opera", image: "../../images/applications/opera.jpg", homepage: "http://www.opera.com", description: "Opera Software´s web browser", id: "a31"},
			{name: "Pidgin", image: "../../images/applications/pidgin.jpg", homepage: "http://www.pidgin.im/", description: "Multiprotocol instant messaging client", id: "a32"},
			{name: "Pyload", image: "../../images/applications/pyload.jpg", homepage: "http://pyload.org/", description: "Direct download manager from internet servers", id: "a33"},
			{name: "Qbittorrent", image: "../../images/applications/qbittorrent.jpg", homepage: "http://www.qbittorrent.org/", description: "P2P download client for torrent links", id: "a34"},
			{name: "Remmina", image: "../../images/applications/remmina.jpg", homepage: "http://remmina.sourceforge.net/", description: "Remote connection through RDP, SFTP, SSH or VNC protocols", id: "a35"},
			{name: "Skype", image: "../../images/applications/skype.jpg", homepage: "http://www.skype.com/en/", description: "VoIP and instant messaging client", id: "a36"},
			{name: "Teamviewer", image: "../../images/applications/teamviewer.jpg", homepage: "http://www.teamviewer.com/en/index.aspx", description: "Remote connection client. It controls remote desktop", id: "a37"},
			{name: "Thunderbird", image: "../../images/applications/thunderbird.jpg", homepage: "https://www.mozilla.org/en-US/thunderbird/", description: "Mozilla´s mail client", id: "a38"},
			{name: "Ubuntu One", image: "../../images/applications/ubuntu-one.jpg", homepage: "https://one.ubuntu.com/", description: "Canonical´s cloud synchronization service", id: "a39"}
		  ]		
		},
		{ category: "Multimedia",
		  applicationList: [
			{name: "Audacious", image: "../../images/applications/audacious.jpg", homepage: "http://audacious-media-player.org/", description: "MP3 audio player similar to WinAmp", id: "a41"},
			{name: "Clementine", image: "../../images/applications/clementine.jpg", homepage: "http://www.clementine-player.org/en/", description: "Complete music library and audio player", id: "a42"},
			{name: "Gcstar", image: "../../images/applications/gcstar.jpg", homepage: "http://www.gcstar.org/", description: "Films, music and videos cataloguer", id: "a43"},
			{name: "Gmplayer", image: "../../images/applications/gmplayer.jpg", homepage: "http://www.mplayerhq.hu", description: "Graphic interface for Mplayer multimedia player", id: "a44"},
			{name: "Guvcview", image: "../../images/applications/guvcview.jpg", homepage: "http://guvcview.sourceforge.net/", description: "Tool to capture photos and videos from your webcam", id: "a45"},
			{name: "TV on Linux", image: "../../images/applications/tv-en-linux.jpg", homepage: "http://www.tvenlinux.com/", description: "Online spanish television channels on Linux", id: "a47"},
			{name: "Videolan", image: "../../images/applications/videolan.jpg", homepage: "http://www.videolan.org/index.html", description: "Multimedia player with it´s own codecs", id: "a48"},
			{name: "Xbmc", image: "../../images/applications/xbmc.jpg", homepage: "http://xbmc.org/", description: "Complete multimedia center", id: "a49"},
			{name: "Xfburn", image: "../../images/applications/xfburn.jpg", homepage: "http://goodies.xfce.org/projects/applications/xfburn", description: "CD or DVD burning tool", id: "a50"},
			{name: "Xfce Mixer", image: "../../images/applications/xfce4-mixer.jpg", homepage: "https://launchpad.net/xfce4-mixer", description: "Mixer and audio device control", id: "a46"}
		  ]		
		},
		{ category: "Office",
		  applicationList: [
			{name: "Abiword", image: "../../images/applications/abiword.jpg", homepage: "http://www.abisource.com/", description: "Light text document editor", id: "a51"},
			{name: "Calibre", image: "../../images/applications/calibre.jpg", homepage: "http://calibre-ebook.com/", description: "Viewer, converter and cataloger of ebooks", id: "a52"},
			{name: "Evince", image: "../../images/applications/evince.jpg", homepage: "http://projects.gnome.org/evince/", description: "PDF document viewer", id: "a53"},
			{name: "Gedit", image: "../../images/applications/gedit.jpg", homepage: "http://projects.gnome.org/gedit/", description: "Gnome´s default text editor", id: "a54"},
			{name: "Gnumeric", image: "../../images/applications/gnumeric.jpg", homepage: "http://projects.gnome.org/gnumeric/", description: "Light spreadsheet editor", id: "a55"},
			{name: "Libreoffice", image: "../../images/applications/libreoffice.jpg", homepage: "http://www.libreoffice.org/", description: "Office suite for text documents, spreadsheets and more", id: "a56"},
			{name: "Lucky Backup", image: "../../images/applications/lucky-backup.jpg", homepage: "http://luckybackup.sourceforge.net/", description: "File synchronizer and backup tool", id: "a57"},
			{name: "Mcomix", image: "../../images/applications/mcomix.jpg", homepage: "http://sourceforge.net/p/mcomix/wiki/Home/", description: "Comic viewer", id: "a58"},
			{name: "Mousepad", image: "../../images/applications/mousepad.jpg", homepage: "http://git.xfce.org/apps/mousepad/", description: "Xfce´s simple text editor", id: "a59"},
			{name: "Simple Scan", image: "../../images/applications/simple-scan.jpg", homepage: "https://launchpad.net/simple-scan", description: "Document scanner", id: "a60"}
		  ]		
		},
		{ category: "System",
		  applicationList: [
			{name: "Bleachbit", image: "../../images/applications/bleachbit.jpg", homepage: "http://bleachbit.sourceforge.net/", description: "System clean tool", id: "a61"},
			{name: "Compiz", image: "../../images/applications/compiz.jpg", homepage: "http://www.compiz.org/", description: "OpenGL compositing manager with desktop effects", id: "a64"},
			{name: "Gdebi", image: "../../images/applications/gdebi.jpg", homepage: "https://launchpad.net/gdebi", description: "Deb package installer", id: "a65"},
			{name: "Gnome Schedule", image: "../../images/applications/gnome-schedule.jpg", homepage: "http://gnome-schedule.sourceforge.net/", description: "Scheduled task manager", id: "a66"},
			{name: "Gnome System Log", image: "../../images/applications/logviewer.jpg", homepage: "https://launchpad.net/gnome-system-log", description: "Gnome´s system log viewer", id: "a67"},
			{name: "Gnome System Monitor", image: "../../images/applications/monitor-sistema.jpg", homepage: "https://launchpad.net/ubuntu/+source/gnome-system-monitor", description: "Gnome´s task manager and system monitor", id: "a73"},
			{name: "Gparted", image: "../../images/applications/gparted.jpg", homepage: "http://gparted.sourceforge.net/", description: "Hard disk partition manager tool", id: "a68"},
			{name: "Grub Customizer", image: "../../images/applications/grub-customizer.jpg", homepage: "https://launchpad.net/grub-customizer", description: "Grub2 manager", id: "a69"},
			{name: "Hard Info", image: "../../images/applications/hard-info.jpg", homepage: "http://wiki.hardinfo.org/HomePage", description: "Hardware detection tool", id: "a70"},
			{name: "Likewise Open", image: "../../images/applications/likewise.jpg", homepage: "http://www.powerbrokeropen.org/", description: "Authentication services for Active Directory domains", id: "a71"},
			{name: "Lubuntu Software Center", image: "../../images/applications/lubuntu-software-center.jpg", homepage: "https://launchpad.net/lubuntu-software-center", description: "Lxde application manager", id: "a62"},
			{name: "Lxtask System Monitor", image: "../../images/applications/monitor-sistema.jpg", homepage: "https://launchpad.net/ubuntu/+source/lxtask", description: "Light task manager and system monitor", id: "a72"},
			{name: "Network Manager", image: "../../images/applications/network-manager.jpg", homepage: "http://projects.gnome.org/NetworkManager/", description: "Wired and wireless network profile manager", id: "a74"},
			{name: "Samba", image: "../../images/applications/samba.jpg", homepage: "https://launchpad.net/samba", description: "File server and shares on the local network based on Windows protocol", id: "a75"},
			{name: "Synaptic", image: "../../images/applications/synaptic.jpg", homepage: "http://www.nongnu.org/synaptic/", description: "Graphic tool for managing system packages", id: "a76"},
			{name: "Ubuntu Software Center", image: "../../images/applications/ubuntu-software-center.jpg", homepage: "https://launchpad.net/software-center", description: "Gnome application manager", id: "a63"},
			{name: "Update Manager", image: "../../images/applications/update-manager.jpg", homepage: "https://launchpad.net/ubuntu/+source/update-manager", description: "System update manager", id: "a77"},
			{name: "Users and Groups", image: "../../images/applications/users-groups.jpg", homepage: "https://launchpad.net/ubuntu/+source/gnome-system-tools", description: "Graphic tool for system users management", id: "a78"},
			{name: "Virtualbox", image: "../../images/applications/virtual-box.jpg", homepage: "https://www.virtualbox.org/", description: "Virtualization tool for different operating systems", id: "a79"},
			{name: "Wine", image: "../../images/applications/wine.jpg", homepage: "http://www.winehq.org/", description: "Windows software emulator", id: "a80"},
			{name: "Xscreensaver", image: "../../images/applications/xscreensaver.jpg", homepage: "http://www.jwz.org/xscreensaver/", description: "Xfce´s screensaver", id: "a81"}
		  ]		
		}		
	]
}

var applicationsTemplate = Handlebars.templates['applications.template']; 
document.getElementById('content-and-aside').innerHTML = applicationsTemplate(applicationData);
