#!/bin/bash

# Arguments
title="${1}"
description="${2}"
terminalMessage1="${3}"
terminalMessage2="${4}"
terminalMessage3="${5}"
terminalMessage4="${6}"
user="${7}"
pyloadWebDescription="${8}"
pyloadStartName="${9}"
pyloadStartDescription="${10}"
pyloadStopName="${11}"
pyloadStopDescription="${12}"

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

# Copy pyLoad's startup script to the system
commands="cp ./sh/pyload-daemon /etc/init.d 2>>$logFile;"

# Set application's user name in this file
commands+="sed -i \"s/%USER%/$user/g\" /etc/init.d/pyload-daemon 2>>$logFile;"	

# Copy menu launchers to start and finish pyLoad and application's web client.
commands+="cp ./menu/pyload-cli.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$pyloadWebDescription/g\" /usr/share/applications/pyload-cli.desktop 2>>$logFile;"
commands+="cp ./menu/pyload-start.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$pyloadStartName/g\" /usr/share/applications/pyload-start.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/pyloadStartDescription/g\" /usr/share/applications/pyload-start.desktop 2>>$logFile;"
commands+="cp ./menu/pyload-stop.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$pyloadStopName/g\" /usr/share/applications/pyload-stop.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$pyloadStopDescription/g\" /usr/share/applications/pyload-stop.desktop 2>>$logFile;"

# Create pyLoad startup links
commands+="update-rc.d -f pyload-daemon defaults 2>>$logFile;"
# To remove them: # update-rc.d -f pyload-daemon remove

# Execute all commands
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth
