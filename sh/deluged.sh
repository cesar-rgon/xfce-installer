#!/bin/bash

# Arguments
title="${1}"
description="${2}"
terminalMessage1="${3}"
terminalMessage2="${4}"
terminalMessage3="${5}"
terminalMessage4="${6}"
user="${7}"
delugedStartName="${8}"
delugedStartDescription="${9}"
delugedStopName="${10}"
delugedStopDescription="${11}"
delugedWebDescription="${12}"

# Other variables
tempDir="/tmp/xfce-installer.tmp"
logFile="$tempDir/log.txt"
dialogWidth=$((`tput cols` - 4))
dialogHeight=$((`tput lines` - 6))

# Check if the script is being running like root user (root user has id equal to 0)
if [ $(id -u) != 0 ]
then
	echo "$terminalMessage1"
	echo "$terminalMessage2 sudo bash ./deluged.sh"
	echo "$terminalMessage3 sudo ./deluged.sh"
	echo "$terminalMessage4 chmod +x deluged.sh"
	exit 1
fi

# Copy deluge-daemon's config file to the system
commands="cp ./conf/deluge-daemon /etc/default 2>>$logFile;"

# Set application's user name in this file
commands+="sed -i \"s/%USER%/$user/g\" /etc/default/deluge-daemon 2>>$logFile;"	

# Copy deluge-daemon's startup script to the system
commands+="cp ./sh/deluge-daemon /etc/init.d 2>>$logFile;"

# Add user name and password to Deluge's authentication file
# commands+="mkdir -p /home/$user/.config/deluge 2>>$logFile;"
# commands+="echo \"$user:deluge:10\" >> /home/$user/.config/deluge/auth 2>>$logFile;"
# commands+="chown -R $user:$user /home/$user/.config 2>>$logFile;"

# Copy menu launchers to start and finish Deluged and application's web client.
commands+="cp ./menu/deluged-start.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$delugedStartName/g\" /usr/share/applications/deluged-start.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$delugedStartDescription/g\" /usr/share/applications/deluged-start.desktop 2>>$logFile;"
commands+="cp ./menu/deluged-stop.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$delugedStopName/g\" /usr/share/applications/deluged-stop.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$delugedStopDescription/g\" /usr/share/applications/deluged-stop.desktop 2>>$logFile;"
commands+="cp ./menu/deluge-web.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$delugedWebDescription/g\" /usr/share/applications/deluge-web.desktop 2>>$logFile;"

# Create deluged startup links
commands+="update-rc.d -f deluge-daemon defaults 2>>$logFile;"
# To remove them: # update-rc.d -f deluge-daemon remove

# Execute all commands
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth
