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
amuledStartName="${9}"
amuledStartDescription="${10}"
amuledStopName="${11}"
amuledStopDescription="${12}"

# Other variables
tempDir="/tmp/xfce-installer.tmp"
logFile="$tempDir/log.txt"
dialogWidth=$((`tput cols` - 4))
dialogHeight=$((`tput lines` - 6))
	
# Check if the script is being running like root user (root user has id equal to 0)
if [ $(id -u) != 0 ]
then
	echo "$terminalMessage1"
	echo "$terminalMessage2 sudo bash ./amule-daemon.sh"
	echo "$terminalMessage3 sudo ./amule-daemon.sh"
	echo "$terminalMessage4 chmod +x amule-daemon.sh"
	exit 1
fi

commands="echo $message1 2>>$logFile;"
# Create backup of amule-daemon's config file
commands+="cp /etc/default/amule-daemon /etc/default/amule-daemon.backup 2>>$logFile;"

# Create backup of aMule's config file wich it accepts, by default, remote users with password "admin".
# (This step is made it in main script.)
# commands+="mkdir /home/$user/.aMule 2>>$logFile;"
# commands+="cp ./conf/amule.conf /home/$user/.aMule 2>>$logFile;"

# Add next lines at the end of the file: 
commands+="echo TempDir=/home/$user/.aMule/Temp >> /home/$user/.aMule/amule.conf 2>>$logFile;"
commands+="echo IncomingDir=/home/$user/.aMule/Incoming >> /home/$user/.aMule/amule.conf 2>>$logFile;"
commands+="echo OSDirectory=/home/$user/.aMule/ >> /home/$user/.aMule/amule.conf 2>>$logFile;"
commands+="echo TempDir=/home/$user/.aMule/Temp >> /home/$user/.aMule/remote.conf 2>>$logFile;"
commands+="echo IncomingDir=/home/$user/.aMule/Incoming >> /home/$user/.aMule/remote.conf 2>>$logFile;"
commands+="echo OSDirectory=/home/$user/.aMule/ >> /home/$user/.aMule/remote.conf 2>>$logFile;"
commands+="chown $user:$user -R /home/$user/.aMule 2>>$logFile;"

# Create amule-daemon's config file with defined user.
commands+="echo '# Configuration for /etc/init.d/amule-daemon' >/etc/default/amule-daemon 2>>$logFile;"
commands+="echo '# The init.d script will only run if this variable non-empty.'>>/etc/default/amule-daemon 2>>$logFile;"
commands+="echo AMULED_USER=\"$user\" >>/etc/default/amule-daemon 2>>$logFile;"
commands+="echo '# You can set this variable to make the daemon use an alternative HOME.'>>/etc/default/amule-daemon 2>>$logFile;"
commands+="echo '# The daemon will use $AMULED_HOME/.aMule as the directory, so if you'>>/etc/default/amule-daemon 2>>$logFile;"
commands+="echo '# want to have $AMULED_HOME the real root (with an Incoming and Temp'>>/etc/default/amule-daemon 2>>$logFile;"
commands+="echo '# directories), you can do `ln -s . $AMULED_HOME/.aMule`.'>>/etc/default/amule-daemon 2>>$logFile;"
commands+="echo AMULED_HOME=\"\">>/etc/default/amule-daemon 2>>$logFile;"

# Copy menu launchers to start and finish amule-daemon.
commands+="cp ./menu/amuled-start.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$amuledStartName/g\" /usr/share/applications/amuled-start.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$amuledStartDescription/g\" /usr/share/applications/amuled-start.desktop 2>>$logFile;"
commands+="cp ./menu/amuled-stop.desktop /usr/share/applications 2>>$logFile;"
commands+="sed -i \"s/%NAME%/$amuledStopName/g\" /usr/share/applications/amuled-stop.desktop 2>>$logFile;"
commands+="sed -i \"s/%COMMENT%/$amuledStopDescription/g\" /usr/share/applications/amuled-stop.desktop 2>>$logFile;"

# Execute all commands
eval "$commands" | dialog --title "$title" --backtitle "$description" --progressbox $dialogHeight $dialogWidth
