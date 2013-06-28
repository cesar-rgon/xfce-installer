#!/bin/bash

# Arguments
title="${1}"
description="${2}"
terminalMessage1="${3}"
terminalMessage2="${4}"
terminalMessage3="${5}"
terminalMessage4="${6}"
user="${7}"
qbittorrentWebDescription="${8}"
qbittorrentStartName="${9}"
qbittorrentStartDescription="${10}"
qbittorrentStopName="${11}"
qbittorrentStopDescription="${12}"

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
	echo "$terminalMessage2 sudo bash ./qbittorrent.sh"
	echo "$terminalMessage3 sudo ./qbittorrent.sh"
	echo "$terminalMessage4 chmod +x qbittorrent.sh"
	echo ""
	exit 1
fi

# Copy qbittorrent's startup script to the system
commands="cp ./sh/qbittorrent-nox-daemon /etc/init.d 2>>$logFile;"

# Set application's user name in this file
commands+="sed -i \"s/%USER%/$user/g\" /etc/init.d/qbittorrent-nox-daemon 2>>$logFile;"	

# Copy qbittorrent's config file to home folder
commands+="mkdir -p /home/$user/.config/qBittorrent;"
commands+="cp ./conf/qBittorrent.conf /home/$user/.config/qBittorrent/ 2>>$logFile;"

# Copy menu launchers to start and finish qbittorrent-nox and application's web client.
commands+="cp ./menu/qbittorrent-nox-cli.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$qbittorrentWebDescription/g\" /usr/share/applications/qbittorrent-nox-cli.desktop 2>>$logFile;"
commands+="cp ./menu/qbittorrent-nox-start.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$qbittorrentStartName/g\" /usr/share/applications/qbittorrent-nox-start.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$qbittorrentStartDescription/g\" /usr/share/applications/qbittorrent-nox-start.desktop 2>>$logFile;"
commands+="cp ./menu/qbittorrent-nox-stop.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$qbittorrentStopName/g\" /usr/share/applications/qbittorrent-nox-stop.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$qbittorrentStopDescription/g\" /usr/share/applications/qbittorrent-nox-stop.desktop 2>>$logFile;"

# Create qbittorrent-nox startup links
commands+="update-rc.d -f qbittorrent-nox-daemon defaults 2>>$logFile;"
# To remove them: # update-rc.d -f qbittorrent-nox-daemon-daemon remove

# Execute all commands
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth
