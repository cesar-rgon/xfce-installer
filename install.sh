#!/bin/bash
########################################################################################################################
# VARIABLES
########################################################################################################################
function initVariables()
{
	author="Cesar Rodriguez Gonzalez"
	englishTranslationAuthors="Cesar Rodriguez Gonzalez. Isidro Rodriguez Gonzalez"
	version="1.2"
	lastDateModified="23-10-2013"
	ubuntuVersion=`lsb_release -rs`
	dialogWidth=$((`tput cols` - 4))
	dialogHeight=$((`tput lines` - 6))
	totalSteps=14 					# Total number of steps of the installation
	tempDir="/tmp/xfce-installer.tmp"
	logFile="$tempDir/log.txt"
	action=1 						# Action=0. Accept button is pressed. Accion=1. Cancel button is pressed.
	user="" 						# Linux user name
	nemoInstalled=0  				# 0.Nemo file browser is not installed. 1.Nemo file browser is installed.
	lightdmInstalled=0   			# 0.Lightdm application is not installed. 1.Lightdm application is installed.
	linuxTVInstalled=0				# 0.Linux TV is not installed. 1. Linux TV is installed.
	networkManagerInstalled=0 		# 0.Network Manager application is not installed. 1.Network Manager application is installed.
	automaticLogin=0			 	# 0.Not user automatic login. 1. User automatic login.
	amuleDaemonInstalled=0 			# 0.Amule daemon application is not installed. 1.Amule daemon application installed.
	delugedInstalled=0 				# 0.Deluge application is not installed. 1.Deluge application installed.
	pyloadInstalled=0 				# 0.Pyload application is not installed. 1.Pyload application is installed.
	qbittorrentDaemonInstalled=0 	# 0.Qbittorrent daemon application is not installed. 1. Qbittorrent daemon application is installed.
	utorrentInstalled=0 			# 0.uTorrent application is not installed. 1. uTorrent application is installed.
	compizInstalled=0 				# 0.Compiz application is not installed. 1. Compiz application is installed.
	systemMonitorInstalled=0		# 0.Gnome system monitor is not installed. 1. Gnome system monitor is installed.
	packagesToDelete="byobu xterm" 	# Packages to delete at the end of the installation process.
	xfceDesktop="$desktop:\n---------------------------------------------------------------\n   Xfce: X Free Choresterol Environment"
	desktopManagerSummary="$desktopManager:\n---------------------------------------------------------------\n   $lightdmDescription\n"
	# Ubuntu's repository packages to install. Initially added default packages.
	repositoryPackages="dmz-cursor-theme gdebi gnome-icon-theme-full language-selector-gnome pavucontrol shimmer-themes shimmer-wallpapers xdg-utils xfce4-datetime-plugin zenity"
	# Common programs installed always.
	basePrograms="$baseProgramsDescription:\n
---------------------------------------------------------------\n
   $dateTimeDescription\n
   $faenzaDescription\n
   $greybirdDescription\n
   $languageSelectorDescription\n
   $mscorefontsDescription\n
   $zenityDescription\n"
	# Selected programs by user during installation process
	optionalPrograms="$optionalProgramsSummary:\n
---------------------------------------------------------------\n"
	debUrls="" 						# Deb package URL list formed by selected programs by user to install.
	debPackages="" 					# Deb package name list formed by selected programs by user to install.
	
	# Optional packages from standard repository (package name - description)
	zipCompressor=("p7zip-full" "  $zipCompressorDescription\n")
	abiword=("abiword" "  $abiwordDescription\n")
	aMule=("amule" "  $aMuleDescription\n")
	aMuleDaemon=("amule amule-daemon amule-utils-gui" "  $aMuleDaemonDescription\n")
	alacarte=("alacarte"  "  $alacarteDescription\n")
	audacious=("audacious" "  $audaciousDescription\n")
	batteryPlugin=("xfce4-battery-plugin" "  $batteryPluginDescription\n") 
	bleachbit=("bleachbit" "  $bleachbitDescription\n")
	bluefish=("bluefish" "  $bluefishDescription\n")
	bluetooth=("blueman" "  $bluemanDescription\n")
	burning=("xfburn" "  $burningDescription\n")
	calibre=("calibre" "  $calibreDescription\n")
	catfish=("catfish" "  $catfishDescription\n")
	whiskermenu=("xfce4-whiskermenu-plugin" "  $whiskermenuDescription\n")
	chromium=("chromium-browser" "  $chromiumDescription\n")
	clementine=("clementine" "  $clementineDescription\n")
	compiz=("compiz compizconfig-settings-manager fusion-icon" "  $compizDescription\n")
	deluge=("deluge" "  $delugeDescription\n")
	deluged=("deluge deluged deluge-webui deluge-console" "  $delugedDescription\n")
	dropbox=("nautilus-dropbox" "  $dropboxDescription\n")
	evince=("evince" "  $evinceDescription\n")
	evolution=("evolution" "  $evolutionDescription\n")
	fileroller=("file-roller thunar-archive-plugin" "  $filerollerDescription\n") 
	filezilla=("filezilla" "  $filezillaDescription\n")
	firefox=("firefox" "  $firefoxDescription\n")
	flashplugin=("flashplugin-installer" "  $flashpluginDescription\n")
	galculator=("galculator" "  $galculatorDescription\n")
	gcstar=("gcstar" "  $gcstarDescription\n")
	geany=("geany" "  $geanyDescription\n")
	gedit=("gedit" "  $geditDescription\n")
	gimp=("gimp" "  $gimpDescription\n")
	gmplayer=("gnome-mplayer" "  $gmplayerDescription\n")
	gnomeSoftwareCenter=("software-center software-properties-gtk" "  $gnomeSoftwareCenterDescription\n")
	gnomeTerminal=("gnome-terminal" "  $gnomeTerminalDescription\n")
	gnomeThumbnail=("ffmpegthumbnailer" "  $gnomeThumbnailDescription\n")
	gnumeric=("gnumeric" "  $gnumericDescription\n")
	gparted=("gparted" "  $gpartedDescription\n")
	gpicview=("gpicview" "  $gpicviewDescription\n")
	hardinfo=("hardinfo" "  $hardinfoDescription\n")
	indicators=("indicator-applet-complete indicator-sound-gtk2 xfce4-indicator-plugin" "  $indicatorsDescription\n")
	jdk=("openjdk-6-jre" "  $jdkDescription\n")
	jockey=("jockey-gtk" "  $jockeyDescription\n")
	klavaro=("klavaro" "  $klavaroDescription\n")
	libreoffice=("libreoffice" "  $libreofficeDescription\n")
	lightdmGtkGreeter=("lightdm-gtk-greeter plymouth-theme-ubuntu-logo" "  $lightdmGtkGreeterDescription\n")	
	likewiseOpen=("likewise-open-gui" "  $likewiseOpenDescription\n")
	linuxTV=("mplayer rtmpdump curl" "  $linuxTVDescription\n")
	localNetwork=("gvfs-backends gvfs-fuse python-glade2 system-config-samba" "  $localNetworkDescription\n")	
	logViewer=("gnome-system-log" "  $logViewerDescription\n")
	luckybackup=("luckybackup" "  $luckybackupDescription\n")	
	lxdeSoftwareCenter=("lubuntu-software-center software-properties-gtk" "  $lxdeSoftwareCenterDescription\n")
	lxtask=("lxtask" "  $lxtaskDescription\n")
	mcomix=("mcomix" "  $mcomixDescription\n")
	midori=("midori" "  $midoriDescription\n")
	mousepad=("mousepad" "  $mousepadDescription\n")
	mplayer=("mplayer" "  $mplayerDescription\n")
	networkManager=("network-manager" "  $networkManagerDescription\n")
	# pidgin-facebookchat package has been removed because it isn't included in Ubuntu 13.10
	pidgin=("pidgin pidgin-extprefs" "  $pidginDescription\n")
	powerManager=("xfce4-power-manager" "  $powerManagerDescription\n")
	# xfprint4 package has been removed because it isn't included in Ubuntu 13.10
	printer=("cups system-config-printer-gnome" "  $printerDescription\n")
	printerPdf=("cups-pdf" "  $printerPdfDescription\n")
	qbittorrent=("qbittorrent" "  $qbittorrentDescription\n")
	qbittorrentDaemon=("qbittorrent-nox" "  $qbittorrentDaemonDescription\n")
	rarCompressor=("rar unrar" "  $rarCompressorDescription\n")
	remmina=("remmina" "  $remminaDescription\n")
	scanner=("simple-scan" "  $scannerDescription\n")
	schedule=("gnome-schedule" "  $scheduleDescription\n")
	screenshooter=("xfce4-screenshooter" "  $screenshooterDescription\n")
	synaptic=("synaptic software-properties-gtk" "  $synapticDescription\n")
	systemMonitor=("gnome-system-monitor" "  $systemMonitorDescription\n")
	thunderbird=("thunderbird" "  $thunderbirdDescription\n")
	tomboy=("tomboy" "  $tomboyDescription\n")
	ubuntuone=("ubuntuone-control-panel" "  $ubuntuoneDescription\n")
	updateManager=("update-manager" "  $updateManagerDescription\n")
	userSettings=("gnome-system-tools" "  $userSettingsDescription\n")
	videoAudioCodecs=("gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly" "  $videoAudioCodecsDescription\n")
	videolan=("vlc" "  $videolanDescription\n")
	virtualbox=("virtualbox" "  $virtualboxDescription\n")
	webcam=("guvcview" "  $webcamDescription\n")
	wine=("wine" "  $wineDescription\n")
	xbmc=("xbmc" "  $xbmcDescription\n")
	xfceTerminal=("xfce4-terminal" "  $xfceTerminalDescription\n")
	xscreensaver=("xscreensaver" "  $xscreensaverDescription\n")
 
	# Third-party repository packages (repository packages - description)
	faenza=("faenza-icon-theme faience-icon-theme" "  $faenzaDescription\n")
	grubcustomizer=("grub-customizer" "  $grubcustomizerDescription\n")
	chrome=("google-chrome-stable" "  $chromeDescription\n")
	nemo=("nemo nemo-fileroller nemo-share" "  $nemoDescription\n")
	opera=("opera" "  $operaDescription\n")
	jdownloader=("jdownloader" "  $jdownloaderDescription\n")
   
	# Deb packages (deb package URL - package name - description)
	debGoogleEarth32=("http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb" "google-earth-stable_current_i386.deb" "  $debGoogleEarthDescription\n")
	debGoogleEarth64=("http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb" "google-earth-stable_current_amd64.deb" "  $debGoogleEarthDescription\n")
	debPyload=("http://get.pyload.org/get/ubuntu" "pyload_linux.deb" " $debPyloadDescription\n")
	debTeamviewer32=("http://www.teamviewer.com/download/teamviewer_linux.deb" "teamviewer_linux_32.deb" "  $debTeamviewerDescription\n")
	debTeamviewer64=("http://www.teamviewer.com/download/teamviewer_linux_x64.deb" "teamviewer_linux_64.deb" "  $debTeamviewerDescription\n")
	debSkype32=("http://www.skype.com/go/getskype-linux-beta-ubuntu-32" "skype_linux_32.deb" "  $debSkypeDescription\n")
	debSkype64=("http://www.skype.com/go/getskype-linux-beta-ubuntu-64" "skype_linux_64.deb" "  $debSkypeDescription\n")
	debSteam=("http://media.steampowered.com/client/installer/steam.deb" "steam_latest.deb" "  $debSteamDescription\n")

	# Application scripts
	scriptAmuleDaemon="./sh/amule-daemon.sh"
	scriptDeluged="./sh/deluged.sh"
	scriptLinuxTV="./sh/tv-en-linux.sh"
	scriptPyload="./sh/pyload.sh"
	scriptQbittorrentDaemon="./sh/qbittorrent.sh"
	scriptUtorrent="./sh/utorrent.sh"
	
	# Third-party repositories (terminal commands - description - optional boolean value of installation process: 0. No install it. 1. Install it.)
	chromeRepository=("" "$chromeRepositoryDescription" 0)
	chromeRepository[0]="wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub 2>&1 | apt-key add - ; " 
	chromeRepository[0]+="echo \"deb http://dl.google.com/linux/chrome/deb/ stable main #$chromeRepositoryDescription\" >> /etc/apt/sources.list.d/google-chrome.list"

	#faenzaRepository=("add-apt-repository -y ppa:tiheum/equinox 2>&1" "$faenzaRepositoryDescription")
	#faenzaRepository[0]+=";sed -i \"s/ main/ main #$faenzaRepositoryDescription/g\" /etc/apt/sources.list.d/tiheum-equinox*.list"
	faenzaRepository=("" "$faenzaRepositoryDescription")
	faenzaRepository[0]="apt-key add ./conf/faenza.key ; "
	faenzaRepository[0]+="echo \"deb http://ppa.launchpad.net/tiheum/equinox/ubuntu precise main #$faenzaRepositoryDescription\" > /etc/apt/sources.list.d/tiheum-equinox-precise.list ; "
	faenzaRepository[0]+="echo \"deb-src http://ppa.launchpad.net/tiheum/equinox/ubuntu precise main #$faenzaRepositoryDescription\" >> /etc/apt/sources.list.d/tiheum-equinox-precise.list ; "

	grubcustomizerRepository=("add-apt-repository -y ppa:danielrichter2007/grub-customizer 2>&1" "$grubcustomizerRepositoryDescription" 0)
	grubcustomizerRepository[0]+=";sed -i \"s/ main/ main #$grubcustomizerRepositoryDescription/g\" /etc/apt/sources.list.d/danielrichter2007-grub-customizer*.list"

	jDownloaderRepository=("add-apt-repository -y ppa:jd-team/jdownloader 2>&1" "$jDownloaderRepositoryDescription" 0)
	jDownloaderRepository[0]+=";sed -i \"s/ main/ main #$jDownloaderRepositoryDescription/g\" /etc/apt/sources.list.d/jd-team-jdownloader*.list"

	whiskermenuRepository=("" "$whiskermenuRepositoryDescription" 0)
	if [ "$ubuntuVersion" == "12.04" ]; then
		whiskermenuRepository[0]+="add-apt-repository -y ppa:landronimirc/xfce 2>&1"
		whiskermenuRepository[0]+=";sed -i \"s/ main/ main #$whiskermenuRepositoryDescription/g\" /etc/apt/sources.list.d/landronimirc-xfce*.list"
	else
		whiskermenuRepository[0]+="add-apt-repository -y ppa:gottcode/gcppa 2>&1"
		whiskermenuRepository[0]+=";sed -i \"s/ main/ main #$whiskermenuRepositoryDescription/g\" /etc/apt/sources.list.d/gottcode-gcppa*.list"
	fi
		
	nemoRepository=("add-apt-repository -y ppa:gwendal-lebihan-dev/cinnamon-stable 2>&1" "$nemoRepositoryDescription" 0)
	nemoRepository[0]+=";sed -i \"s/ main/ main #$nemoRepositoryDescription/g\" /etc/apt/sources.list.d/gwendal-lebihan-dev-cinnamon-stable*.list"
      
	operaRepository=("" "$operaRepositoryDescription" 0)
	operaRepository[0]="wget -O - http://deb.opera.com/archive.key 2>&1 | apt-key add - ; "
	operaRepository[0]+="echo \"deb http://deb.opera.com/opera/ stable non-free #$operaRepositoryDescription\" >> /etc/apt/sources.list.d/opera.list"

	# Third-party repository list formed by selected programs by user during installation process
	thirdPartyRepositories="${faenzaRepository[0]} 2>>$logFile;"
	# Third-party repository description list formed by selected programs by user during installation process
	thirdPartyRepositoriesSummary="$thirdPartyRepositoriesDescription:\n
---------------------------------------------------------------\n
   ${faenzaRepository[1]}\n"
   
	if [ "$ubuntuVersion" == "12.04" ]; then
		repositoryPackages+=" shimmer-themes-greybird"
		thirdPartyRepositories+="add-apt-repository -y ppa:xubuntu-dev/xfce-4.10 2>&1;"
		thirdPartyRepositories+="sed -i \"s/ main/ main #$xfceRepositoryDescription/g\" /etc/apt/sources.list.d/xubuntu-dev-xfce-4_10-precise.list 2>>$logFile;"
		thirdPartyRepositories+="add-apt-repository -y ppa:geany-dev/ppa 2>&1;"
		thirdPartyRepositories+="sed -i \"s/ main/ main #$geanyRepositoryDescription/g\" /etc/apt/sources.list.d/geany-dev-ppa-precise.list 2>>$logFile;"
		thirdPartyRepositories+="add-apt-repository -y ppa:shimmerproject/ppa 2>&1;"
		thirdPartyRepositories+="sed -i \"s/ main/ main #$greybirdRepositoryDescription/g\" /etc/apt/sources.list.d/shimmerproject-ppa-precise.list 2>>$logFile;"
		thirdPartyRepositoriesSummary+="   $xfceRepositoryDescription\n   $geanyRepositoryDescription\n   $greybirdRepositoryDescription\n"
	fi
}

########################################################################################################################
# SELECT SCRIPT LANGUAGE
########################################################################################################################
if [[ "$LANG" == "es"* ]]; then		# System language is spanish or latin so apply spanish language to this script.
	. ./languages/es.properties
else								# System language is not spanish nor latin so apply english language to this script.
	. ./languages/en.properties
fi

########################################################################################################################
# CHECK ROOT USER
########################################################################################################################
# Check if the script is being running like root user (root user has id equal to 0)
if [ $(id -u) != 0 ]
then
	echo ""
	echo "$terminalMessage1"
	echo "$terminalMessage2 sudo bash ./install.sh"
	echo "$terminalMessage3 sudo ./install.sh"
	echo "$terminalMessage4 chmod +x install.sh"
	echo ""
	exit 1
fi

########################################################################################################################
# PREPARING INSTALLER
########################################################################################################################
initVariables
mkdir $tempDir
chmod 777 $tempDir
# Repair previous wrong installation process, if this was the case
echo "   $terminalMessage5 ..."
dpkg --configure -a >/dev/null 2>>$logFile
echo "   $terminalMessage6 ..."
# Install "dialog" package: Needed for showing installer dialog windows.
# Install "python-software-properties" package: Needed to run gdebi application and "add-apt-repository" command in Ubuntu 12.04
# Install "software-properties-common" package: Needed to run "add-apt-repository" command for Ubuntu 12.10 and above.
apt-get -y install dialog python-software-properties software-properties-common --fix-missing >/dev/null 2>>$logFile

########################################################################################################################
# SCRIPT CREDITS
########################################################################################################################
whiteSpaces="                  "
printf "\n%.21s%s\n" "$authorLabel:$whiteSpaces" "$author" > $tempDir/credits.tmp
printf "%.21s%s\n" "$descriptionLabel:$whiteSpaces" "$description" >> $tempDir/credits.tmp
printf "%.21s%s\n" "$versionLabel:$whiteSpaces" "$version" >> $tempDir/credits.tmp
printf "%.21s%s\n" "$modifiedLabel:$whiteSpaces" "$lastDateModified" >> $tempDir/credits.tmp
printf "%.21s%s\n" "$testedLabel:$whiteSpaces" "$testedDistros" >> $tempDir/credits.tmp
printf "%.21s%s\n" "$prerequisitesLabel:$whiteSpaces" "$prerequisitesMessage" >> $tempDir/credits.tmp
printf "%.21s%s\n" "$englishTranslationLabel:$whiteSpaces" "$englishTranslationAuthors" >> $tempDir/credits.tmp

dialog --title "$titleMessage0:" --backtitle "$description" --textbox $tempDir/credits.tmp 13 $dialogWidth

########################################################################################################################
# STEP 1: LINUX USER
########################################################################################################################
title="$step 1/$totalSteps: $titleMessage1"
echo "$title">>$logFile
# Loop until the username is not empty and press the "Accept" button.
until [ $action -eq 0 ] && [ -n "$user" ]
do
	dialog --title "$title" --backtitle "$description" --inputbox "$dialogMessage1" 9 $dialogWidth 2>$tempDir/username.tmp
	action=$?
	user=`cat $tempDir/username.tmp`
done

########################################################################################################################
# STEP 2: COMPUTER FEATURES
########################################################################################################################
title="$step 2/$totalSteps: $titleMessage2"
echo "$title">>$logFile
features=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$dialogMessage2:" 17 $dialogWidth 8 \
1 "$menuMessage21" off \
2 "$menuMessage22" off \
3 "$menuMessage23" off \
4 "$menuMessage24" off \
5 "$menuMessage25" off \
6 "$menuMessage26" off \
7 "$menuMessage27" off \
8 "$menuMessage28" off`
if [ $? -eq 0 ]
then
	for f in $features
	do
		case $f in
		1) repositoryPackages+=" ${batteryPlugin[0]}"
			optionalPrograms+=" ${batteryPlugin[1]}";;
		2) repositoryPackages+=" ${localNetwork[0]}"
			optionalPrograms+=" ${localNetwork[1]}";;
		3) repositoryPackages+=" ${likewiseOpen[0]}"
			optionalPrograms+=" ${likewiseOpen[1]}";;
		4) repositoryPackages+=" ${burning[0]}"
			optionalPrograms+=" ${burning[1]}";;
		5) repositoryPackages+=" ${webcam[0]}"
			optionalPrograms+=" ${webcam[1]}";;
		6) repositoryPackages+=" ${printer[0]}"
			optionalPrograms+=" ${printer[1]}";;
		7) repositoryPackages+=" ${scanner[0]}"
			optionalPrograms+=" ${scanner[1]}";;
		8) repositoryPackages+=" ${bluetooth[0]}"
			optionalPrograms+=" ${bluetooth[1]}";;
		esac
	done
fi

########################################################################################################################
# STEP 3: INSTALLATION PROFILES
########################################################################################################################
title="$step 3/$totalSteps: $profileTitle"
echo "$title">>$logFile
action=1
selected=()
# Loop until the "Accept" button is pressed.
until [ $action -eq 0 ] && [ ${#selected[*]} -gt 0 ]
do
	profiles=`dialog --title "$title" --backtitle "$description" --stdout --menu "\n$profileMessage:" 13 $dialogWidth 4 \
	1 "$newerDesktopProfile" \
	2 "$oldDesktopProfile" \
	3 "$officeProfile" \
	4 "$serverProfile"`
	action=$?
	selected=($profiles)	
done
for p in $profiles
do
	case $p in
	1) compressorOptions=("on" "on" "on")
		developmentOptions=("off" "off" "on")
		downloadOptions=("off" "off" "off" "off" "off" "off" "off" "off" "off")
		desktopOptions=("on" "on" "on" "on" "on" "on" "on")
		gamesOptions=("on")
		multimediaOptions=("off" "on" "on" "off" "on" "off" "on" "on" "on" "off" "on" "off")
		officeOptions=("off" "off" "off" "on" "on" "on" "off" "off" "on" "off" "off" "off" "on")
		systemOptions=("off" "off" "off" "on" "on" "on" "on" "on" "on" "on" "off" "off" "on" "on" "on" "on" "off" "off" "on")
		internetOptions=("off" "off" "off" "off" "off" "on" "off" "off" "off" "on" "off" "on" "off" "off" "off");;
	2) compressorOptions=("on" "on" "on")
		developmentOptions=("off" "off" "off")
		downloadOptions=("off" "off" "off" "off" "off" "off" "off" "off" "off")
		desktopOptions=("on" "off" "on" "off" "off" "off" "on")
		gamesOptions=("off")
		multimediaOptions=("on" "off" "off" "off" "off" "on" "on" "on" "on" "off" "off" "off")		
		officeOptions=("on" "off" "off" "on" "on" "off" "on" "off" "off" "off" "off" "on" "off")
		systemOptions=("off" "on" "on" "on" "on" "on" "on" "off" "on" "on" "off" "off" "off" "off" "on" "on" "off" "off" "off")
		internetOptions=("off" "off" "off" "off" "off" "off" "off" "on" "off" "on" "off" "off" "off" "off" "off");;
	3) compressorOptions=("on" "on" "on")
		developmentOptions=("off" "off" "on")
		downloadOptions=("off" "off" "off" "off" "off" "off" "off" "off" "off")
		desktopOptions=("on" "on" "on" "off" "on" "on" "on")
		gamesOptions=("off")
		multimediaOptions=("off" "off" "on" "off" "on" "off" "on" "off" "off" "off" "off" "off")		
		officeOptions=("off" "off" "on" "on" "on" "on" "off" "off" "on" "off" "off" "off" "on")
		systemOptions=("off" "off" "off" "off" "off" "off" "on" "off" "on" "on" "off" "off" "on" "on" "on" "on" "off" "off" "on")
		internetOptions=("off" "off" "off" "off" "off" "on" "off" "off" "off" "off" "off" "on" "off" "on" "off");;
	4) compressorOptions=("on" "on" "on")
		developmentOptions=("off" "off" "on")
		downloadOptions=("off" "off" "off" "off" "off" "off" "off" "off" "off")
		desktopOptions=("on" "on" "on" "off" "on" "off" "on")
		gamesOptions=("off")
		multimediaOptions=("off" "off" "off" "off" "off" "off" "on" "off" "off" "off" "off" "off")		
		officeOptions=("off" "off" "off" "off" "on" "on" "off" "off" "off" "off" "off" "off" "off")
		systemOptions=("on" "off" "on" "on" "on" "on" "on" "off" "off" "on" "on" "on" "off" "off" "on" "off" "off" "off" "off")
		internetOptions=("off" "off" "off" "off" "on" "on" "off" "off" "off" "off" "on" "off" "off" "off" "off");;
	esac
done

########################################################################################################################
# STEP 4: SELECTION OF PROGRAMS TO INSTALL
########################################################################################################################
title="$step 4/$totalSteps: $titleMessage3"
echo "$title">>$logFile

action=1
selected=()
# Loop until the "Accept" button is pressed.
until [ $action -eq 0 ] && [ ${#selected[*]} -gt 0 ]
do
	lightdm=`dialog --title "$title" --backtitle "$description" --stdout --menu "\n$category 1/10: $dialogMessage3:" 12 $dialogWidth 3 \
	1 "$menuMessage31" \
	2 "$menuMessage32" \
	3 "$menuMessage33"`
	action=$?
	selected=($lightdm)
done
for l in $lightdm
do
	case $l in
	1) repositoryPackages+=" ${lightdmGtkGreeter[0]}"
		lightdmInstalled=1
		automaticLogin=1
		desktopManagerSummary+="   $infoMessage1" ;;
	2) repositoryPackages+=" ${lightdmGtkGreeter[0]}"
		lightdmInstalled=1
		automaticLogin=0
		desktopManagerSummary+="   $infoMessage2" ;;
	3) lightdmInstalled=0 ;;
	esac
done


compressors=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 2/10: $compressors:" 12 $dialogWidth 3 \
1 "$zipCompressorDescription" ${compressorOptions[0]} \
2 "$filerollerDescription" ${compressorOptions[1]} \
3 "$rarCompressorDescription" ${compressorOptions[2]}`

if [ $? -eq 0 ]
then
	for c in $compressors
	do
		case $c in
		1) repositoryPackages+=" ${zipCompressor[0]}"
			optionalPrograms+=" ${zipCompressor[1]}" ;;
		2) repositoryPackages+=" ${fileroller[0]}"
			optionalPrograms+=" ${fileroller[1]}" ;;			
		3) repositoryPackages+=" ${rarCompressor[0]}"
			optionalPrograms+=" ${rarCompressor[1]}" ;;
		esac
	done
fi

development=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 3/10: $development:" 12 $dialogWidth 3 \
1 "$bluefishDescription" ${developmentOptions[0]} \
2 "$geanyDescription" ${developmentOptions[1]} \
3 "$jdkDescription" ${developmentOptions[2]}`

if [ $? -eq 0 ]
then
	for d in $development
	do
		case $d in
		1) repositoryPackages+=" ${bluefish[0]}"
			optionalPrograms+=" ${bluefish[1]}" ;;
		2) repositoryPackages+=" ${geany[0]}"
			optionalPrograms+=" ${geany[1]}" ;;
		3) repositoryPackages+=" ${jdk[0]}"
			optionalPrograms+=" ${jdk[1]}" ;;
		esac
	done
fi

downloads=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 4/10: $downloads:" 18 $dialogWidth 9 \
1 "$aMuleDescription" ${downloadOptions[0]} \
2 "$aMuleDaemonDescription" ${downloadOptions[1]} \
3 "$delugeDescription" ${downloadOptions[2]} \
4 "$delugedDescription" ${downloadOptions[3]} \
5 "$jdownloaderDescription" ${downloadOptions[4]} \
6 "$debPyloadDescription" ${downloadOptions[5]} \
7 "$qbittorrentDescription" ${downloadOptions[6]} \
8 "$qbittorrentDaemonDescription" ${downloadOptions[7]} \
9 "$utorrentDescription" ${downloadOptions[8]}`

if [ $? -eq 0 ]
then
	for d in $downloads
	do
		case $d in
		1) repositoryPackages+=" ${aMule[0]}"
			optionalPrograms+=" ${aMule[1]}"
			repoaMuleDaemon[0]="amule-daemon amule-utils-gui" ;;
		2) repositoryPackages+=" ${aMuleDaemon[0]}"
			optionalPrograms+=" ${aMuleDaemon[1]}"
			amuleDaemonInstalled=1;;
		3) repositoryPackages+=" ${deluge[0]}"
			optionalPrograms+=" ${deluge[1]}";;
		4) repositoryPackages+=" ${deluged[0]}"
			optionalPrograms+=" ${deluged[1]}"
			delugedInstalled=1 ;;
		5) optionalPrograms+=" ${jdownloader[1]}"
			jDownloaderRepository[2]=1
			thirdPartyRepositories+="${jDownloaderRepository[0]} 2>>$logFile; "
			thirdPartyRepositoriesSummary+="   ${jDownloaderRepository[1]}\n";;
		6) debUrls+=" ${debPyload[0]}"
			debPackages+=" ${debPyload[1]}"
			optionalPrograms+=" ${debPyload[2]}"
			pyloadInstalled=1;;			
		7) repositoryPackages+=" ${qbittorrent[0]}"
			optionalPrograms+=" ${qbittorrent[1]}";;
		8) repositoryPackages+=" ${qbittorrentDaemon[0]}"
			optionalPrograms+=" ${qbittorrentDaemon[1]}"
			qbittorrentDaemonInstalled=1 ;;
		9) 	optionalPrograms+=" ${scriptUtorrent[1]}"
			utorrentInstalled=1;;
		esac
	done
fi

desktop=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 5/10: $desktopTools:" 16 $dialogWidth 7 \
1 "$alacarteDescription" ${desktopOptions[0]} \
2 "$bleachbitDescription" ${desktopOptions[1]} \
3 "$catfishDescription" ${desktopOptions[2]} \
4 "$compizDescription" ${desktopOptions[3]} \
5 "$indicatorsDescription" ${desktopOptions[4]} \
6 "$screenshooterDescription" ${desktopOptions[5]} \
7 "$whiskermenuDescription" ${desktopOptions[6]}`

if [ $? -eq 0 ]
then
	for d in $desktop
	do
		case $d in
		1) repositoryPackages+=" ${alacarte[0]}"
			optionalPrograms+=" ${alacarte[1]}";;
		2) repositoryPackages+=" ${bleachbit[0]}"
			optionalPrograms+=" ${bleachbit[1]}" ;;
		3) repositoryPackages+=" ${catfish[0]}"
			optionalPrograms+=" ${catfish[1]}" ;;
		4) repositoryPackages+=" ${compiz[0]}"
			optionalPrograms+=" ${compiz[1]}"
			compizInstalled=1 ;;
		5) repositoryPackages+=" ${indicators[0]}"
			optionalPrograms+=" ${indicators[1]}" ;;
		6) repositoryPackages+=" ${screenshooter[0]}"
			optionalPrograms+=" ${screenshooter[1]}";;
		7) 	thirdPartyRepositories+="${whiskermenuRepository[0]} 2>>$logFile; "
			thirdPartyRepositoriesSummary+="   ${whiskermenuRepository[1]}\n"
			whiskermenuRepository[2]=1
			repositoryPackages+=" ${whiskermenu[0]}"
			optionalPrograms+=" ${whiskermenu[1]}" ;;
		esac
	done
fi

games=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 6/10: $games:" 10 $dialogWidth 1 \
1 "$debSteamDescription" ${gamesOptions[0]}`
if [ $? -eq 0 ]
then
	for g in $games
	do
		case $g in
		1) debUrls+=" ${debSteam[0]}"
			debPackages+=" ${debSteam[1]}"
			optionalPrograms+=" ${debSteam[2]}" ;;
		esac
	done
fi  

multimedia=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 7/10: $multimedia:" 21 $dialogWidth 12 \
1 "$audaciousDescription" ${multimediaOptions[0]} \
2 "$clementineDescription" ${multimediaOptions[1]} \
3 "$flashpluginDescription" ${multimediaOptions[2]} \
4 "$gcstarDescription" ${multimediaOptions[3]} \
5 "$gimpDescription" ${multimediaOptions[4]} \
6 "$gmplayerDescription" ${multimediaOptions[5]} \
7 "$gpicviewDescription" ${multimediaOptions[6]} \
8 "$videoAudioCodecsDescription" ${multimediaOptions[7]} \
9 "$mplayerDescription" ${multimediaOptions[8]} \
10 "$linuxTVDescription" ${multimediaOptions[9]} \
11 "$videolanDescription" ${multimediaOptions[10]} \
12 "$xbmcDescription" ${multimediaOptions[11]}`
if [ $? -eq 0 ]
then
	for m in $multimedia
	do
		case $m in
		1) repositoryPackages+=" ${audacious[0]}"
			optionalPrograms+=" ${audacious[1]}" ;;
		2) repositoryPackages+=" ${clementine[0]}"
			optionalPrograms+=" ${clementine[1]}" ;;
		3) repositoryPackages+=" ${flashplugin[0]}"
			optionalPrograms+=" ${flashplugin[1]}";;
		4) repositoryPackages+=" ${gcstar[0]}"
			optionalPrograms+=" ${gcstar[1]}";;
		5) repositoryPackages+=" ${gimp[0]}"
			optionalPrograms+=" ${gimp[1]}";;
		6) repositoryPackages+=" ${gmplayer[0]}"
			optionalPrograms+=" ${gmplayer[1]}" ;;
		7) repositoryPackages+=" ${gpicview[0]}"
			optionalPrograms+=" ${gpicview[1]}" ;;
		8) repositoryPackages+=" ${videoAudioCodecs[0]}"
			optionalPrograms+=" ${videoAudioCodecs[1]}";;
		9) repositoryPackages+=" ${mplayer[0]}"
			optionalPrograms+=" ${mplayer[1]}" ;;
		10) repositoryPackages+=" ${linuxTV[0]}"
			optionalPrograms+=" ${linuxTV[1]}"
			linuxTVInstalled=1 ;;
		11) repositoryPackages+=" ${videolan[0]}"
			optionalPrograms+=" ${videolan[1]}" ;;
		12) repositoryPackages+=" ${xbmc[0]}"
			optionalPrograms+=" ${xbmc[1]}";;
		esac
	done
fi

office=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 8/10: $office:" 22 $dialogWidth 13 \
1 "$abiwordDescription" ${officeOptions[0]} \
2 "$calibreDescription" ${officeOptions[1]} \
3 "$printerPdfDescription" ${officeOptions[2]} \
4 "$evinceDescription" ${officeOptions[3]} \
5 "$galculatorDescription" ${officeOptions[4]} \
6 "$geditDescription" ${officeOptions[5]} \
7 "$gnumericDescription" ${officeOptions[6]} \
8 "$klavaroDescription" ${officeOptions[7]} \
9 "$libreofficeDescription" ${officeOptions[8]} \
10 "$luckybackupDescription" ${officeOptions[9]} \
11 "$mcomixDescription" ${officeOptions[10]} \
12 "$mousepadDescription" ${officeOptions[11]} \
13 "$tomboyDescription" ${officeOptions[12]}`

if [ $? -eq 0 ]
then
	for o in $office
	do
		case $o in
		1) repositoryPackages+=" ${abiword[0]}"
			optionalPrograms+=" ${abiword[1]}";;
		2) repositoryPackages+=" ${calibre[0]}"
			optionalPrograms+=" ${calibre[1]}";;
		3) repositoryPackages+=" ${printerPdf[0]}"
			optionalPrograms+=" ${printerPdf[1]}";;		
		4) repositoryPackages+=" ${evince[0]}"
			optionalPrograms+=" ${evince[1]}";;
		5) repositoryPackages+=" ${galculator[0]}"
			optionalPrograms+=" ${galculator[1]}" ;;
		6) repositoryPackages+=" ${gedit[0]}"
			optionalPrograms+=" ${gedit[1]}";;
		7) repositoryPackages+=" ${gnumeric[0]}"
			optionalPrograms+=" ${gnumeric[1]}";;
		8) repositoryPackages+=" ${klavaro[0]}"
			optionalPrograms+=" ${klavaro[1]}";;
		9) repositoryPackages+=" ${libreoffice[0]}"
			optionalPrograms+=" ${libreoffice[1]}";;
		10) repositoryPackages+=" ${luckybackup[0]}"
			optionalPrograms+=" ${luckybackup[1]}";;
		11) if [ $ubuntuVersion == "12.04" ]; then
				repositorioMcomix=("add-apt-repository -y ppa:blca/ppa 2>&1" $mcomixRepositoryDescription)
				repositorioMcomix[0]+=";sed -i 's/ main/ main #$mcomixRepositoryDescription/g' /etc/apt/sources.list.d/blca-ppa*.list"
				thirdPartyRepositories+="${repositorioMcomix[0]} 2>>$logFile; "
				thirdPartyRepositoriesSummary+="   $mcomixRepositoryDescription\n"
			fi
			repositoryPackages+=" ${mcomix[0]}"
			optionalPrograms+=" ${mcomix[1]}";;			
		12) repositoryPackages+=" ${mousepad[0]}"
			optionalPrograms+=" ${mousepad[1]}";;
		13) repositoryPackages+=" ${tomboy[0]}"
			optionalPrograms+=" ${tomboy[1]}";;
		esac
	done
fi

system=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 9/10: $systemTools:" 28 $dialogWidth 19 \
1 "$logViewerDescription" ${systemOptions[0]} \
2 "$lxdeSoftwareCenterDescription" ${systemOptions[1]} \
3 "$lxtaskDescription" ${systemOptions[2]} \
4 "$gpartedDescription" ${systemOptions[3]} \
5 "$grubcustomizerDescription" ${systemOptions[4]} \
6 "$hardinfoDescription" ${systemOptions[5]} \
7 "$jockeyDescription" ${systemOptions[6]} \
8 "$nemoDescription" ${systemOptions[7]} \
9 "$networkManagerDescription" ${systemOptions[8]} \
10 "$powerManagerDescription" ${systemOptions[9]} \
11 "$scheduleDescription" ${systemOptions[10]} \
12 "$synapticDescription" ${systemOptions[11]} \
13 "$systemMonitorDescription" ${systemOptions[12]} \
14 "$gnomeSoftwareCenterDescription" ${systemOptions[13]} \
15 "$updateManagerDescription" ${systemOptions[14]} \
16 "$userSettingsDescription" ${systemOptions[15]} \
17 "$virtualboxDescription" ${systemOptions[16]} \
18 "$wineDescription" ${systemOptions[17]} \
19 "$xscreensaverDescription" ${systemOptions[18]}`

if [ $? -eq 0 ]
then
	for s in $system
	do
		case $s in
		1) repositoryPackages+=" ${logViewer[0]}"
			optionalPrograms+=" ${logViewer[1]}";;
		2) repositoryPackages+=" ${lxdeSoftwareCenter[0]}"
			optionalPrograms+=" ${lxdeSoftwareCenter[1]}";;	 
		3) repositoryPackages+=" ${lxtask[0]}"
			optionalPrograms+=" ${lxtask[1]}";;
		4) repositoryPackages+=" ${gparted[0]}"
			optionalPrograms+=" ${gparted[1]}";;
		5) thirdPartyRepositories+="${grubcustomizerRepository[0]} 2>>$logFile; "
			thirdPartyRepositoriesSummary+="   ${grubcustomizerRepository[1]}\n"
			optionalPrograms+=" ${grubcustomizer[1]}" 
			grubcustomizerRepository[2]=1 ;;
		6) repositoryPackages+=" ${hardinfo[0]}"
			optionalPrograms+=" ${hardinfo[1]}";;
		7) if [ $ubuntuVersion == "12.04" ]; then
				repositoryPackages+=" ${jockey[0]}"
				optionalPrograms+=" ${jockey[1]}"
			fi ;;
		8) repositoryPackages+=" ${gnomeTerminal[0]} ${gnomeThumbnail[0]}"
			basePrograms+=" ${gnomeTerminal[1]}"
			thirdPartyRepositories+="${nemoRepository[0]} 2>>$logFile; "
			thirdPartyRepositoriesSummary+="   ${nemoRepository[1]}\n"
			optionalPrograms+=" ${nemo[1]} ${gnomeThumbnail[1]}"
			nemoInstalled=1
			nemoRepository[2]=1 ;;
		9) repositoryPackages+=" ${networkManager[0]}"
			optionalPrograms+=" ${networkManager[1]}"
			networkManagerInstalled=1 ;;
		10) repositoryPackages+=" ${powerManager[0]}"
			optionalPrograms+=" ${powerManager[1]}";;
		11) repositoryPackages+=" ${schedule[0]}"
			optionalPrograms+=" ${schedule[1]}";;
		12) repositoryPackages+=" ${synaptic[0]}"
			optionalPrograms+=" ${synaptic[1]}";;
		13) repositoryPackages+=" ${systemMonitor[0]}"
			optionalPrograms+=" ${systemMonitor[1]}"
			systemMonitorInstalled=1;;
		14) repositoryPackages+=" ${gnomeSoftwareCenter[0]}"
			optionalPrograms+=" ${gnomeSoftwareCenter[1]}";;
		15) repositoryPackages+=" ${updatemanager[0]}"
			optionalPrograms+=" ${updateManager[1]}";;	 
		16) repositoryPackages+=" ${userSettings[0]}"
			optionalPrograms+=" ${userSettings[1]}";;
		17) repositoryPackages+=" ${virtualbox[0]}"
			optionalPrograms+=" ${virtualbox[1]}";;
		18) repositoryPackages+=" ${wine[0]}"
			optionalPrograms+=" ${wine[1]}";;
		19) repositoryPackages+=" ${xscreensaver[0]}"
			optionalPrograms+=" ${xscreensaver[1]}";;
		esac
	done
fi

internet=`dialog --title "$title" --backtitle "$description" --stdout --separate-output --checklist "\n$category 10/10: $internet:" 24 $dialogWidth 15 \
1 "$chromeDescription" ${internetOptions[0]} \
2 "$chromiumDescription" ${internetOptions[1]} \
3 "$dropboxDescription" ${internetOptions[2]} \
4 "$evolutionDescription" ${internetOptions[3]} \
5 "$filezillaDescription" ${internetOptions[4]} \
6 "$firefoxDescription" ${internetOptions[5]} \
7 "$debGoogleEarthDescription" ${internetOptions[6]} \
8 "$midoriDescription" ${internetOptions[7]} \
9 "$operaDescription" ${internetOptions[8]} \
10 "$pidginDescription" ${internetOptions[9]} \
11 "$remminaDescription" ${internetOptions[10]} \
12 "$debSkypeDescription" ${internetOptions[11]} \
13 "$debTeamviewerDescription" ${internetOptions[12]} \
14 "$thunderbirdDescription" ${internetOptions[13]} \
15 "$ubuntuoneDescription" ${internetOptions[14]}`

if [ $? -eq 0 ]
then
	for i in $internet
	do
		case $i in
		1) thirdPartyRepositories+="${chromeRepository[0]} 2>>$logFile; "
			thirdPartyRepositoriesSummary+="   ${chromeRepository[1]}\n"
			chromeRepository[2]=1
			optionalPrograms+=" ${chrome[1]}" ;;
		2) repositoryPackages+=" ${chromium[0]}"
			optionalPrograms+=" ${chromium[1]}" ;;
		3) if [ $nemoInstalled -eq 1 ]; then
				dropbox[0]="nemo-dropbox"
			fi
			repositoryPackages+=" ${dropbox[0]}"
			optionalPrograms+=" ${dropbox[1]}" ;;			
		4) repositoryPackages+=" ${evolution[0]}"
			optionalPrograms+=" ${evolution[1]}" ;;
		5) repositoryPackages+=" ${filezilla[0]}"
			optionalPrograms+=" ${filezilla[1]}";;
		6) repositoryPackages+=" ${firefox[0]}"
			optionalPrograms+=" ${firefox[1]}" ;;
		7) if [ `uname -i` == "x86_64" ]
			then
				debUrls+=" ${debGoogleEarth64[0]}"
				debPackages+=" ${debGoogleEarth64[1]}"
				optionalPrograms+=" ${debGoogleEarth64[2]}"
			else
				debUrls+=" ${debGoogleEarth32[0]}"
				debPackages+=" ${debGoogleEarth32[1]}"
				optionalPrograms+=" ${debGoogleEarth32[2]}"
			fi ;;
		8) repositoryPackages+=" ${midori[0]}"
			optionalPrograms+=" ${midori[1]}" ;;
		9) thirdPartyRepositories+="${operaRepository[0]} 2>>$logFile; "
			thirdPartyRepositoriesSummary+="   ${operaRepository[1]}\n"
			operaRepository[2]=1
			optionalPrograms+=" ${opera[1]}" ;;
		10) repositoryPackages+=" ${pidgin[0]}"
			optionalPrograms+=" ${pidgin[1]}";;
		11) repositoryPackages+=" ${remmina[0]}"
			optionalPrograms+=" ${remmina[1]}";;
		12) if [ `uname -i` == "x86_64" ]
			then
				debUrls+=" ${debSkype64[0]}"
				debPackages+=" ${debSkype64[1]}"
				optionalPrograms+=" ${debSkype64[2]}"
			else
				debUrls+=" ${debSkype32[0]}"
				debPackages+=" ${debSkype32[1]}"
				optionalPrograms+=" ${debSkype32[2]}"
			fi ;;
		13) if [ `uname -i` == "x86_64" ]
			then
				debUrls+=" ${debTeamviewer64[0]}"
				debPackages+=" ${debTeamviewer64[1]}"
				optionalPrograms+=" ${debTeamviewer64[2]}"
			else
				debUrls+=" ${debTeamviewer32[0]}"
				debPackages+=" ${debTeamviewer32[1]}"
				optionalPrograms+=" ${debTeamviewer32[2]}"
			fi ;;
		14) repositoryPackages+=" ${thunderbird[0]}"
			optionalPrograms+=" ${thunderbird[1]}" ;;
		15) repositoryPackages+=" ${ubuntuone[0]}"
			optionalPrograms+=" ${ubuntuone[1]}" ;;
		esac
	done
fi

if [ $nemoInstalled -eq 0 ]
then
	repositoryPackages+=" ${xfceTerminal[0]}"
	basePrograms+=" ${xfceTerminal[1]}"
fi

########################################################################################################################
# STEP 5: FINAL ACTIONS AFTER THE INSTALLATION PROCESS
########################################################################################################################
title="$step 5/$totalSteps: $titleMessage4:"
echo "$title">>$logFile		

action=1
selected=()
# Loop until "Acept" button is pressed
until [ $action -eq 0 ] && [ ${#selected[*]} -gt 0 ]
do
	menu=`dialog --title "$title" --backtitle "$description" --stdout --menu "$dialogMessage12:" 13 $dialogWidth 5 \
	1 "$menuMessage41" \
	2 "$menuMessage42" \
	3 "$menuMessage43" \
	4 "$menuMessage44" \
	5 "$menuMessage45"`
	action=$?
	selected=($menu)
done
for m in $menu
do
	case $m in
	1) postInstallationAction=1;;
	2) postInstallationAction=2;;
	3) postInstallationAction=3;;
	4) postInstallationAction=4;;
	5) postInstallationAction=5;;
	esac
done

########################################################################################################################
# STEP 6: SUMMARY OF APPLICATIONS TO INSTALL
########################################################################################################################
title="$step 6/$totalSteps: $titleMessage5:"
echo "$title">>$logFile
if [ $lightdmInstalled -eq 0 ]; then
	dialog --title "$title" --backtitle "$description" --msgbox "\n$xfceDesktop\n\n\n$thirdPartyRepositoriesSummary\n\n$basePrograms\n\n$optionalPrograms" $dialogHeight $dialogWidth
else
	dialog --title "$title" --backtitle "$description" --msgbox "\n$xfceDesktop\n\n\n$desktopManagerSummary\n\n\n$thirdPartyRepositoriesSummary\n\n$basePrograms\n\n$optionalPrograms" $dialogHeight $dialogWidth
fi


########################################################################################################################
# STEP 7: MICROSOFT FONTS INSTALLATION
########################################################################################################################
title="$step 7/$totalSteps: $titleMessage6:"
echo "$title">>$logFile
clear
apt-get -y install ttf-mscorefonts-installer --fix-missing 2>>$logFile

########################################################################################################################
# STEP 8: UPDATE REPOSITORIES
########################################################################################################################
title="$step 8/$totalSteps: $titleMessage7"
echo "$title">>$logFile
commands=""
if [ -n "$thirdPartyRepositories" ]
then
	echo "$logInfo1: $thirdPartyRepositories">>$logFile
	commands+="echo $infoMessage3; "
	commands+="$thirdPartyRepositories"
	commands+="echo \n$titleMessage7; "
fi
commands+="apt-get update --fix-missing 2>>$logFile"
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth

########################################################################################################################
# STEP 9: UPDATE OPERATING SYSTEM
########################################################################################################################
title="$step 9/$totalSteps: $titleMessage8"
echo "$title">>$logFile
apt-get -y dist-upgrade --fix-missing 2>>$logFile | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth

########################################################################################################################
# STEP 10: INSTALL XFCE DESKTOP
########################################################################################################################
title="$step 10/$totalSteps: $titleMessage9"
echo "$title">>$logFile
apt-get -y install xfce4 2>&1 | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth
if [ $? -ne 0 ]
then
	# Error detected. Canceling installation process.
	echo "$infoMessage5" >>$logFile
	echo "$infoMessage5"
	exit 1
fi

########################################################################################################################
# STEP 11: INSTALL APPLICATIONS
########################################################################################################################
title="$step 11/$totalSteps: $titleMessage10"
commands="echo '$title'>>$logFile;"
# Install standard repository packages
if [ $nemoInstalled -eq 1 ]
then
	# Install Nemo file browser
	commands+="apt-get -y install ${nemo[0]} --no-install-recommends --fix-missing 2>>$logFile;"
	# Set Nemo file browser to system default
	commands+="mkdir -p /home/$user/.config/xfce4 2>>$logFile;"
	commands+="cp ./conf/helpers.rc /home/$user/.config/xfce4/ 2>>$logFile;"
	commands+="mkdir -p /etc/skel/.config/xfce4 2>>$logFile;"
	commands+="cp ./conf/helpers.rc /etc/skel/.config/xfce4/ 2>>$logFile;"
	commands+="mkdir -p /home/$user/.local/share/xfce4/helpers 2>>$logFile;"
	commands+="cp ./conf/nemo.desktop /home/$user/.local/share/xfce4/helpers/ 2>>$logFile;"
	commands+="mkdir -p /etc/skel/.local/share/xfce4/helpers 2>>$logFile;"
	commands+="cp ./conf/nemo.desktop /etc/skel/.local/share/xfce4/helpers/ 2>>$logFile;"
	# Set Nemo file browser to show previews of photos and videos throught ffmpegthumbnailer package
	commands+="mkdir /usr/share/thumbnailers 2>>$logFile;"
	commands+="cp ./conf/video.thumbnailer /usr/share/thumbnailers/ 2>>$logFile;"
	commands+="chown $user:$user -R /home/$user/.local 2>>$logFile;"
fi
commands+="apt-get -y install $repositoryPackages --fix-missing 2>>$logFile;"

# Install icon theme Faenza
commands+="apt-get -y install ${faenza[0]} --fix-missing 2>>$logFile;"

# Install Grub2 application
if [ ${grubcustomizerRepository[2]} -eq 1 ]
then
	commands+="apt-get -y install ${grubcustomizer[0]} --fix-missing 2>>$logFile;"
fi

# Install third-party packages
if [ ${chromeRepository[2]} -eq 1 ]
then
	commands+="apt-get -y install ${chrome[0]} --fix-missing 2>>$logFile;"
fi
if [ ${operaRepository[2]} -eq 1 ]
then
	commands+="apt-get -y install ${opera[0]} --fix-missing 2>>$logFile;"
fi
if [ ${jDownloaderRepository[2]} -eq 1 ]
then
	commands+="apt-get -y install ${jdownloader[0]} --fix-missing 2>>$logFile;"
fi
if [ ${nemoRepository[2]} -eq 1 ]
then
	commands+="apt-get -y install ${nemo[0]} --fix-missing 2>>$logFile;"
fi

# Install deb packages without repositories
if [ -n "$debUrls" ]
then
	# Download and install deb packages of selected programs by user during installation proccess.
	debUrlArray=($debUrls)
	debPackageArray=($debPackages)
	for index in ${!debUrlArray[*]}
	do
		commands+="wget -O /var/cache/apt/archives/${debPackageArray[$index]} ${debUrlArray[$index]} 2>&1;"      
		commands+="gdebi --n /var/cache/apt/archives/${debPackageArray[$index]} 2>>$logFile;"
	done
fi
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth

if [ $delugedInstalled -eq 1 ]; then
	bash $scriptDeluged "$title" "$description" "$terminalMessage1" "$terminalMessage2" "$terminalMessage3" "$terminalMessage4" "$user" "$delugedDaemonStartName" "$delugedDaemonStartDescription" "$delugedDaemonStopName" "$delugedDaemonStopDescription" "$delugedWebDescription" 2>>$logFile
fi

if [ $pyloadInstalled -eq 1 ]; then
	bash $scriptPyload "$title" "$description" "$terminalMessage1" "$terminalMessage2" "$terminalMessage3" "$terminalMessage4" "$user" "$pyloadWebDescription" "$pyloadStartName" "$pyloadStartDescription" "$pyloadStopName" "$pyloadStopDescription" 2>>$logFile
fi

if [ $qbittorrentDaemonInstalled -eq 1 ]; then
	bash $scriptQbittorrentDaemon "$title" "$description" "$terminalMessage1" "$terminalMessage2" "$terminalMessage3" "$terminalMessage4" "$user" "$qbittorrentWebDescription" "$qbittorrentStartName" "$qbittorrentStartDescription" "$qbittorrentStopName" "$qbittorrentStopDescription" 2>>$logFile
fi

if [ $linuxTVInstalled -eq 1 ]; then
	bash $scriptLinuxTV "$title" "$description" "$terminalMessage1" "$terminalMessage2" "$terminalMessage3" "$terminalMessage4" "$tvLinuxName" "$tvLinuxDescription" 2>>$logFile
fi

if [ $utorrentInstalled -eq 1 ]; then
	bash $scriptUtorrent "$title" "$description" "$terminalMessage1" "$terminalMessage2" "$terminalMessage3" "$terminalMessage4" "$user" "$utorrentScriptMessage1" "$utorrentScriptMessage2" "$utorrentWebDescription" "$utorrentStartName" "$utorrentStartDescription" "$utorrentStopName" "$utorrentStopDescription" 2>>$logFile
fi
	
########################################################################################################################
# STEP 12: CLEAN UNNECESSARY PACKAGES
########################################################################################################################
title="$step 12/$totalSteps: $titleMessage11"
echo "$title">>$logFile
commands="apt-get -y remove $packagesToDelete 2>>$logFile;" 
# Clean unnecessary dependencies
commands+="apt-get -y autoremove 2>>$logFile;"
# Clean cache of downloaded programs
commands+="apt-get -y clean 2>>$logFile"
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth

########################################################################################################################
# STEP 13: CONFIGURATIONS
########################################################################################################################
title="$step 13/$totalSteps: $titleMessage12"
echo "$title">>$logFile

commands="echo $infoMessage6 2>>$logFile;"
# Copy new icons to system icons folder
commands+="cp -R ./icons/hicolor/* /usr/share/icons/hicolor/ 2>>$logFile;"
# Create symbolic links for Clementine monochrome icons
commands+="ln -s /usr/share/icons/ubuntu-mono-dark/apps/24/clementine-panel.png /usr/share/icons/hicolor/24x24/status/clementine-panel.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/ubuntu-mono-dark/apps/24/clementine-panel-grey.png /usr/share/icons/hicolor/24x24/status/clementine-panel-grey.png 2>>$logFile;"
# Update icon cache to refresh system icons
commands+="gtk-update-icon-cache /usr/share/icons/hicolor/ 2>>$logFile;"
# Copy additional Xfce icons to Faenza theme
commands+="mkdir -p /usr/share/icons/Faenza ;"
commands+="cp -R ./icons/Faenza/* /usr/share/icons/Faenza/ 2>>$logFile;"
# Copy icons from Faenza-Custom folder (it includes Linux Mint's computer icon, nice for Nemo file browser).
commands+="mkdir -p /usr/share/icons/Faenza-Custom ;"
commands+="cp -R ./icons/Faenza-Custom/* /usr/share/icons/Faenza-Custom/ 2>>$logFile;"
# Copy Faenza icons to aMule application
commands+="mkdir -p /usr/share/amule/skins ;"
commands+="cp -R ./icons/amule-faenza/* /usr/share/amule/skins 2>>$logFile;"
# Create symbolic links for amuleGUI icons in Faenza Custom theme
commands+="mkdir -p /usr/share/icons/Faenza-Custom/apps/16 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/16/amule.png /usr/share/icons/Faenza-Custom/apps/16/amulegui.png 2>>$logFile;"
commands+="mkdir /usr/share/icons/Faenza-Custom/apps/22 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/22/amule.png /usr/share/icons/Faenza-Custom/apps/22/amulegui.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/24/amule.png /usr/share/icons/Faenza-Custom/apps/24/amulegui.png 2>>$logFile;"
commands+="mkdir /usr/share/icons/Faenza-Custom/apps/32 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/32/amule.png /usr/share/icons/Faenza-Custom/apps/32/amulegui.png 2>>$logFile;"
commands+="mkdir /usr/share/icons/Faenza-Custom/apps/48 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/48/amule.png /usr/share/icons/Faenza-Custom/apps/48/amulegui.png 2>>$logFile;"
commands+="mkdir /usr/share/icons/Faenza-Custom/apps/64 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/64/amule.png /usr/share/icons/Faenza-Custom/apps/64/amulegui.png 2>>$logFile;"
commands+="mkdir /usr/share/icons/Faenza-Custom/apps/96 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/96/amule.png /usr/share/icons/Faenza-Custom/apps/96/amulegui.png 2>>$logFile;"
commands+="mkdir /usr/share/icons/Faenza-Custom/apps/scalable 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/scalable/amule.svg /usr/share/icons/Faenza-Custom/apps/scalable/amulegui.svg 2>>$logFile;"
# Create symbolic links for audio volume icons in Faenza Custom theme
commands+="ln -s /usr/share/icons/Faenza-Dark/status/16/audio-volume-muted-blocked-panel.png /usr/share/icons/Faenza-Custom/status/16/audio-output-none-panel.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza-Dark/status/22/audio-volume-muted-blocked-panel.png /usr/share/icons/Faenza-Custom/status/22/audio-output-none-panel.png 2>>$logFile;"
commands+="mkdir /usr/share/icons/Faenza-Custom/status/24 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza-Dark/status/24/audio-volume-muted-blocked-panel.png /usr/share/icons/Faenza-Custom/status/24/audio-output-none-panel.png 2>>$logFile;"
# Create symbolic links for transmission-remote-gtk icons in Faenza Custom theme
commands+="mkdir -p /usr/share/icons/Faenza-Custom/status/24 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza-Dark/status/24/transmission-tray-icon.png /usr/share/icons/Faenza-Custom/status/24/transmission-remote-gtk.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/16/transmission.png /usr/share/icons/Faenza-Custom/apps/16/transmission-remote-gtk.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/22/transmission.png /usr/share/icons/Faenza-Custom/apps/22/transmission-remote-gtk.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/32/transmission.png /usr/share/icons/Faenza-Custom/apps/32/transmission-remote-gtk.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/48/transmission.png /usr/share/icons/Faenza-Custom/apps/48/transmission-remote-gtk.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/64/transmission.png /usr/share/icons/Faenza-Custom/apps/64/transmission-remote-gtk.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/96/transmission.png /usr/share/icons/Faenza-Custom/apps/96/transmission-remote-gtk.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/scalable/transmission.svg /usr/share/icons/Faenza-Custom/apps/scalable/transmission-remote-gtk.svg 2>>$logFile;"
# Create symbolic links for remmina monochrome in Faenza Custom theme
commands+="ln -s /usr/share/icons/Faenza/apps/16/preferences-desktop-remote-desktop.png /usr/share/icons/Faenza-Custom/apps/16/remmina.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/22/preferences-desktop-remote-desktop.png /usr/share/icons/Faenza-Custom/apps/22/remmina.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/32/preferences-desktop-remote-desktop.png /usr/share/icons/Faenza-Custom/apps/32/remmina.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/48/preferences-desktop-remote-desktop.png /usr/share/icons/Faenza-Custom/apps/48/remmina.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/64/preferences-desktop-remote-desktop.png /usr/share/icons/Faenza-Custom/apps/64/remmina.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/96/preferences-desktop-remote-desktop.png /usr/share/icons/Faenza-Custom/apps/96/remmina.png 2>>$logFile;"
commands+="ln -s /usr/share/icons/Faenza/apps/scalable/preferences-desktop-remote-desktop.svg /usr/share/icons/Faenza-Custom/apps/scalable/remmina.svg 2>>$logFile;"

if [[ "$ubuntuVersion" < "13.10" ]]; then
	# Delete Debian background from Grub
	commands+="echo $infoMessage7 2>>$logFile;"
	commands+="rm /usr/share/images/desktop-base/desktop-grub.png 2>>$logFile;"
	commands+="update-grub2 2>>$logFile;"
fi

# Create system startup script for configuring Xfce desktop
commands+="echo $infoMessage8 2>>$logFile;"
commands+="cp ./sh/xfce4-config.sh /usr/share/xfce4/ 2>>$logFile;"
commands+="sed -i \"s/%PYLOADINSTALLED%/$pyloadInstalled/g\" /usr/share/xfce4/xfce4-config.sh 2>>$logFile;"	
commands+="sed -i \"s/%SYSTEMMONITORINSTALLED%/$systemMonitorInstalled/g\" /usr/share/xfce4/xfce4-config.sh 2>>$logFile;"	
commands+="sed -i \"s/%WHISKERMENUINSTALLED%/${whiskermenuRepository[2]}/g\" /usr/share/xfce4/xfce4-config.sh 2>>$logFile;"	
commands+="sed -i \"s/%MESSAGE1%/$xfce4ConfigScriptMessage1/g\" /usr/share/xfce4/xfce4-config.sh 2>>$logFile;"	
commands+="sed -i \"s/%MESSAGE2%/$xfce4ConfigScriptMessage2/g\" /usr/share/xfce4/xfce4-config.sh 2>>$logFile;"	
commands+="sed -i \"s/%MESSAGE3%/$xfce4ConfigScriptMessage3/g\" /usr/share/xfce4/xfce4-config.sh 2>>$logFile;"	
commands+="cp ./autostart/xfce4-config.desktop /etc/xdg/autostart/ 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$xfce4ConfigComment/g\" /etc/xdg/autostart/xfce4-config.desktop 2>>$logFile;"

# Setting Xfce desktop panel
commands+="echo $infoMessage9 2>>$logFile;"
commands+="mkdir -p /home/$user/.config/xfce4/xfconf/xfce-perchannel-xml 2>>$logFile;"
commands+="mkdir -p /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml 2>>$logFile;"
# Copy configuration file of Xfce's panel to folders: "home" and "skel".
if [ ${whiskermenuRepository[2]} -eq 1 ]
then
	commands+="cp ./conf/xfce4-panel-whiskermenu.xml /home/$user/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml 2>>$logFile;"
	commands+="cp ./conf/xfce4-panel-whiskermenu.xml /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml 2>>$logFile;"
	commands+="mkdir -p /home/$user/.config/xfce4/panel/ 2>>$logFile;"
	commands+="cp ./conf/whiskermenu-5.rc /home/$user/.config/xfce4/panel/ 2>>$logFile;"
else
	commands+="cp ./conf/xfce4-panel.xml /home/$user/.config/xfce4/xfconf/xfce-perchannel-xml 2>>$logFile;"
	commands+="cp ./conf/xfce4-panel.xml /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml 2>>$logFile;"
fi

# Setting samba's configuration file
commands+="echo $infoMessage10 2>>$logFile;"
# Backup from samba's configuration file
commands+="cp /etc/samba/smb.conf /etc/samba/smb.conf.backup 2>>$logFile;"
# Allow sharing resources from anywhere
commands+="sed -i 's/\[global\]/\[global\]\nusershare owner only = False/g' /etc/samba/smb.conf 2>>$logFile;"

# Setting Thunar's custom actions
commands+="echo $infoMessage11 2>>$logFile;"
# Copy files of Thunar's custom actions
commands+="cp ./conf/uca.xml /etc/xdg/Thunar/uca.xml 2>>$logFile;"
commands+="cp ./sh/share.sh /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE1%/$shareScriptMessage1/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE2%/$shareScriptMessage2/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE3%/$shareScriptMessage3/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE4%/$shareScriptMessage4/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE5%/$shareScriptMessage5/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE6%/$shareScriptMessage6/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE7%/$shareScriptMessage7/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE8%/$shareScriptMessage8/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE9%/$shareScriptMessage9/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE10%/$shareScriptMessage10/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE11%/$shareScriptMessage11/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE12%/$shareScriptMessage12/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
commands+="sed -i \"s/%MESSAGE13%/$shareScriptMessage13/g\" /etc/xdg/Thunar/share.sh 2>>$logFile;"
	
if [ $nemoInstalled -eq 1 ]; then
	commands+="echo $infoMessage12 2>>$logFile;"
	commands+="mv /usr/share/xsessions/cinnamon.desktop /usr/share/xsessions/cinnamon.desktop.old 2>>$logFile;"
	commands+="mv /usr/share/xsessions/cinnamon2d.desktop /usr/share/xsessions/cinnamon2d.desktop.old 2>>$logFile;"
fi

if [ $lightdmInstalled -eq 1 ]
then
	commands+="echo $infoMessage13 2>>$logFile;"
	commands+="cp /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.backup 2>>$logFile;"
	commands+="cp ./conf/lightdm-gtk-greeter.conf /etc/lightdm/ 2>>$logFile;"
	if [ $ubuntuVersion == "12.04" ]; then
		# The default lightdm theme is "greybird-git"
		commands+="sed -i 's/%THEME%/greybird-git/g' /etc/lightdm/lightdm-gtk-greeter.conf 2>>$logFile;"
	else
		# The default lightdm theme is "Greybird"
		commands+="sed -i 's/%THEME%/Greybird/g' /etc/lightdm/lightdm-gtk-greeter.conf 2>>$logFile;"
	fi
	if [ $ubuntuVersion == "12.04" || $ubuntuVersion == "12.10" ] ; then
		# Change default icon of lightdm to an icon of Faenza's theme
		commands+="cp /usr/share/lightdm-gtk-greeter/greeter.ui /usr/share/lightdm-gtk-greeter/greeter.ui.backup 2>>$logFile;"
		commands+="sed -i 's/<property name=\"icon_name\">computer/<property name=\"icon_name\">xfce/g' /usr/share/lightdm-gtk-greeter/greeter.ui 2>>$logFile;"
	fi

	commands+="echo $infoMessage14 2>>$logFile;"

	# Setting LightDM for launching Xfce desktop by default
	# Equivalent to edit /etc/lightdm/lightdm.conf and insert or change the line: user-session=xfce
	commands+="/usr/lib/lightdm/lightdm-set-defaults -s xfce 2>>$logFile;"

	if [ $automaticLogin -eq 1 ]
	then
		# Setting Lightdm for user automatic login
		commands+="echo $infoMessage15>>$logFile;"
		commands+="echo \"autologin-user=$user\" >>/etc/lightdm/lightdm.conf 2>>$logFile;"
		commands+="echo 'autologin-user-timeout=0' >>/etc/lightdm/lightdm.conf 2>>$logFile;"
	fi
fi

if [ $compizInstalled -eq 1 ]
then
	# Create Compiz's startup at system login
	commands+="echo $infoMessage16 2>>$logFile;"
	# Copy startup to common startup folder
	commands+="cp ./autostart/compiz.desktop /etc/xdg/autostart/ 2>>$logFile;"
	commands+="sed -i \"s/%COMMENT%/$compizComment/g\" /etc/xdg/autostart/compiz.desktop 2>>$logFile;"
	# Create Compiz's startup launcher disabled for user session
	commands+="mkdir -p /home/$user/.config/autostart 2>>$logFile;"
	commands+="echo '[Desktop Entry]' > /home/$user/.config/autostart/compiz.desktop 2>>$logFile;"
	commands+="echo 'Hidden=true' >> /home/$user/.config/autostart/compiz.desktop 2>>$logFile;"
	commands+="chmod 664 /home/$user/.config/autostart/compiz.desktop 2>>$logFile;"
	# Create Compiz's startup launcher disabled for other system users (in "skel" folder)
	commands+="mkdir -p /etc/skel/.config/autostart 2>>$logFile;"
	commands+="cp /home/$user/.config/autostart/compiz.desktop /etc/skel/.config/autostart 2>>$logFile;"
fi

commands+="chown $user:$user -R /home/$user/.config 2>>$logFile;"

# Check if Xfce desktop and Network Manager have been installed
dpkg -s xfce4 ${networkManager[0]} 1>/dev/null 2>$tempDir/errorPackageInstalled.log
# If error log file is zero then both applications have been installed successful
if [ $networkManagerInstalled -eq 1 ] && [ `stat --format="%s" $tempDir/errorPackageInstalled.log` == 0 ]
then
	# Unsetting network interfaces
	commands+="echo $infoMessage17 2>>$logFile;"
	# Backup from network interfaces file
	commands+="cp /etc/network/interfaces /etc/network/interfaces.old.`date +\"%d-%m-%y.%H:%M:%S\"` 2>>$logFile;"
	# Copy default network interfaces file (no configuration)
	commands+="cp ./conf/interfaces /etc/network/ 2>>$logFile;"
fi
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth

if [ $amuleDaemonInstalled -eq 1 ]
then
	# aMule's default configuration
	commands="echo $infoMessage18 2>>$logFile;"
	# This file enables aMule's remote control
	commands+="mkdir /home/$user/.aMule 2>>$logFile;"
	commands+="cp ./conf/amule.conf /home/$user/.aMule 2>>$logFile;"
	commands+="cp ./conf/remote.conf /home/$user/.aMule 2>>$logFile;"
	commands+="chown -R $user:$user /home/$user/.aMule 2>>$logFile;"
	commands+="mkdir /etc/skel/.aMule 2>>$logFile;"
	commands+="cp ./conf/amule.conf /etc/skel/.aMule 2>>$logFile;"
	commands+="cp ./conf/remote.conf /etc/skel/.aMule 2>>$logFile;"
	eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth
	
	# Run configuration script
	bash $scriptAmuleDaemon "$title" "$description" "$terminalMessage1" "$terminalMessage2" "$terminalMessage3" "$terminalMessage4" "$user" "$amuleScriptMessage1" "$amuledDaemonStartName" "$amuledDaemonStartDescription" "$amuledDaemonStopName" "$amuledDaemonStopDescription" 2>>$logFile
fi

########################################################################################################################
# STEP 14: INSTALLATION LOG
########################################################################################################################
mkdir /home/$user/logs >/dev/null
cp $logFile "/home/$user/logs/xfce-installer.log" >/dev/null
chown -R $user:$user /home/$user/logs/ >/dev/null 2>&1

case $postInstallationAction in
	1) PItext=$infoMessage19 	# Show log and reboot system
		PIaction="reboot"
		echo $infoMessage20 >> $logFile;;
	2) PItext=$infoMessage21  	# Show log and shutdown system
		PIaction="poweroff"
		echo $infoMessage22 >> $logFile;;
	3) PItext=$infoMessage23 	# Show log and exit to console
		PIaction="cd /home/$user"
		echo $infoMessage24 >> $logFile;;
	4) PIaction="reboot"		# Reboot system
		echo $infoMessage19 >> $logFile;;
	5) PIaction="poweroff"		# Shutdown system
		echo $infoMessage21 >> $logFile;;
esac
	
if [ $postInstallationAction -le 3 ]
then
	# Installation log
	dialog --title "$infoMessage25" --backtitle "$description" --textbox "$logFile" $dialogHeight $dialogWidth

	height=15
	text=""
	if [ $amuleDaemonInstalled -eq 1 ]
	then
		height=$(($height+3))
		# aMule information
		text+="\n$infoMessage26\n$infoMessage27\n$infoMessage28\n"
	fi
	if [ $delugedInstalled -eq 1 ]
	then
		height=$(($height+5))
		# Deluge information
		text+="\n$infoMessage29\n$infoMessage30\n$infoMessage31\n$infoMessage32\n$infoMessage33\n"
	fi
	if [ $pyloadInstalled -eq 1 ]
	then
		height=$(($height+3))
		# Pyload information
		text+="\n$infoMessage34\n$infoMessage35\n$infoMessage36\n"
	fi
	if [ $qbittorrentDaemonInstalled -eq 1 ]
	then
		height=$(($height+2))
		# Qbittorrent information
		text+="\n$infoMessage37\n$infoMessage38\n"
	fi
	
	if [ $utorrentInstalled -eq 1 ]
	then
		height=$(($height+2))
		# uTorrent information
		text+="\n$infoMessage39\n$infoMessage40\n"
	fi

	# Log information
	text+="\n$infoMessage41\nnano /home/$user/logs/xfce-installer.log\n\n$PItext\n"
	dialog --title "$infoMessage42" --backtitle "$description" --msgbox "$text" $height $dialogWidth
fi
eval "$PIaction" 2>>$logFile

