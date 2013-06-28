#!/bin/bash

# Arguments
title="${1}"
description="${2}"
terminalMessage1="${3}"
terminalMessage2="${4}"
terminalMessage3="${5}"
terminalMessage4="${6}"
user="${7}"
message1="${8}"
message2="${9}"
utorrentWebDescription="${10}"
utorrentStartName="${11}"
utorrentStartDescription="${12}"
utorrentStopName="${13}"
utorrentStopDescription="${14}"

# Other variables
tempDir="/tmp/xfce-installer.tmp"
logFile="$tempDir/log.txt"
dialogWidth=$((`tput cols` - 4))
dialogHeight=$((`tput lines` - 6))

# Check if the script is being running like root user (root user has id equal to 0)
if [ $(id -u) != 0 ]
then
	echo ""
	echo "$terminalMessage1"
	echo "$terminalMessage2 sudo bash ./utorrent.sh"
	echo "$terminalMessage3 sudo ./utorrent.sh"
	echo "$terminalMessage4 chmod +x utorrent.sh"
	echo ""
	exit 1
fi

# Variables
if [ `uname -i` == "x86_64" ]; then
	utorrentFile="utorrent-server-3.0-ubuntu-10.10-27079.x64.tar.gz"
else
	utorrentFile="utorrent-server-3.0-ubuntu-10.10-27079.tar.gz"
fi

utorrentURL="http://download.utorrent.com/linux/$utorrentFile"
installationFolder="/usr/share"

# Delete previous uTorrent's file downloaded before.
commands="rm /var/cache/apt/archives/$utorrentFile 2>/dev/null;"

# Download uTorrent
commands+="echo $message1 >>$logFile;"
commands+="echo $message1;"
commands+="wget -P /var/cache/apt/archives $utorrentURL 2>&1;"

# Decompress to system folder
commands+="echo 'Descomprimiendo uTorrent ...' >>$logFile;"
commands+="echo 'Descomprimiendo uTorrent ...';"
commands+=" tar -xzf /var/cache/apt/archives/$utorrentFile -C $installationFolder 2>>$logFile;"

# Install neccesary library
commands+="echo $message2 >>$logFile;"
commands+="echo $message2;"
commands+=" apt-get -y install libssl0.9.8 --fix-missing 2>>$logFile;"

# Copy utorrent's startup script to the system
commands+="cp ./sh/utorrent-daemon /etc/init.d 2>>$logFile;"
commands+="sed -i \"s/%USER%/$user/g\" /etc/init.d/utorrent-daemon 2>>$logFile;"

# Copy menu launchers to start and finish utorrent and application's web client.
commands+="cp ./menu/utorrent-cli.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$utorrentWebDescription/g\" /usr/share/applications/utorrent-cli.desktop 2>>$logFile;"
commands+="cp ./menu/utorrent-start.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$utorrentStartName/g\" /usr/share/applications/utorrent-start.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$utorrentStartDescription/g\" /usr/share/applications/utorrent-start.desktop 2>>$logFile;"
commands+="cp ./menu/utorrent-stop.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$utorrentStopName/g\" /usr/share/applications/utorrent-stop.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$utorrentStopDescription/g\" /usr/share/applications/utorrent-stop.desktop 2>>$logFile;"

# Create utorrent startup links
commands+="update-rc.d -f utorrent-daemon defaults 2>>$logFile;"
# To remove them: # update-rc.d -f utorrent-daemon remove

# Create utorrent log folder
commands+="mkdir /var/log/utorrent 2>>$logFile;"
commands+="chown $user:$user /var/log/utorrent 2>>$logFile;"

# Execute all commands
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth



