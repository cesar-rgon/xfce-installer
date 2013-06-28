#!/bin/bash

# Arguments
title="${1}"
description="${2}"
terminalMessage1="${3}"
terminalMessage2="${4}"
terminalMessage3="${5}"
terminalMessage4="${6}"
tvLinuxName="${7}"
tvLinuxDescription="${8}"

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
	echo "$terminalMessage2 sudo bash ./tv-en-linux.sh"
	echo "$terminalMessage3 sudo ./tv-en-linux.sh"
	echo "$terminalMessage4 chmod +x tv-en-linux.sh"
	echo ""
	exit 1
fi

# Download the script
commands="mkdir /usr/share/TVenLinux 2>>$logFile;"
commands+="wget -O /usr/share/TVenLinux/TVenLinux.sh http://www.tvenlinux.com/TVenLinux.sh 2>&1;"
commands+="chmod +x /usr/share/TVenLinux/TVenLinux.sh 2>>$logFile;"

# Copy menu launcher to start the application.
commands+="cp ./menu/tv-en-linux.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$tvLinuxName/g\" /usr/share/applications/tv-en-linux.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$tvLinuxDescription/g\" /usr/share/applications/tv-en-linux.desktop 2>>$logFile;"

# Execute all commands
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth
