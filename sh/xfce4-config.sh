#!/bin/bash
user=`whoami`
ubuntuVersion=`lsb_release -rs`
pyloadInstalled=%PYLOADINSTALLED%
systemMonitorInstalled=%SYSTEMMONITORINSTALLED%

# Show notification dialog box.
zenity --notification --window-icon="info" --text "%MESSAGE1%" --timeout=1

# Set cursor theme
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-White"

# Set default desktop's background image
xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor0/image-path" -t string -s "/usr/share/xfce4/backdrops/greybird-wall-1920x1200.png" --create
# Set desktop's icon size.
xfconf-query -c xfce4-desktop -p "/desktop-icons/icon-size" -t uint -s "51" --create
# Set desktop's fonts size. 
xfconf-query -c xfce4-desktop -p "/desktop-icons/use-custom-font-size" -t bool -s "true" --create
xfconf-query -c xfce4-desktop -p "/desktop-icons/font-size" -t double -s "8.000000" --create

# Set default icons theme
xfconf-query -c xsettings -p "/Net/IconThemeName" -t string -s "Faenza-Custom" --create

# Set default desktop theme
if [ $ubuntuVersion == "12.04" ]; then
	xfconf-query -c xsettings -p "/Net/ThemeName" -t string -s "greybird-git" --create
else
	xfconf-query -c xsettings -p "/Net/ThemeName" -t string -s "Greybird" --create
fi

# Set default title bar theme
if [[ $ubuntuVersion == "13"* ]]; then
	xfconf-query -c xfwm4 -p "/general/theme" -t string -s "Blackbird" --create
else
	xfconf-query -c xfwm4 -p "/general/theme" -t string -s "Bluebird" --create
fi

# Set terminal's color config (text-color: white, background-color: black). It takes effect only on Gnome's terminal.
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/use_theme_colors false
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/background_color "#000000000000"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/foreground_color "#FFFFFFFFFFFF"


# Associate "sudo" authentication mode to "gksu".
# Next command is equivalent to run in console: "gksu-properties" command and select "sudo" authentication mode.
gconftool-2 --set /apps/gksu/sudo-mode --type bool true

# Set double-clic mouse delay time in miliseconds
xfconf-query -c xsettings -p "/Net/DoubleClickTime" -t int -s "500" --create

# Add keyboard hotkeys
if [ $systemMonitorInstalled -eq 1 ]; then
	xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>Delete" -t string -s "gnome-system-monitor" --create
else
	xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>Delete" -t string -s "lxtask" --create
fi
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>l" -t string -s "xflock4" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -t string -s "exo-open --launch TerminalEmulator" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>f" -t string -s "exo-open --launch FileManager" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/Print" -t string -s "xfce4-screenshooter" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>F3" -t string -s "xfce4-appfinder" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Shift><Alt>Down" -t string -s "move_window_down_workspace_key" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Shift><Alt>Left" -t string -s "move_window_left_workspace_key" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Shift><Alt>Right" -t string -s "move_window_right_workspace_key" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Shift><Alt>Up" -t string -s "move_window_up_workspace_key" --create

# Start language selector for completing installation of default language or install new ones.
gnome-language-selector &

# If pyLoad have been installed ...
if [ $pyloadInstalled -eq 1 ]; then
	# Show notification dialog box
	zenity --notification --window-icon="info" --text "%MESSAGE2%" --timeout=1
	# Stop pyLoad daemon
	/etc/init.d/pyload-daemon stop
	# Start pyLoadCore in a terminal. User can set application's configuration.
	exo-open --launch TerminalEmulator /usr/bin/pyLoadCore
	# Show notification dialog box
	zenity --notification --window-icon="info" --text "%MESSAGE3%" --timeout=1
fi

# Disable script's startup because only is necessary to be executed at first system boot.
mkdir -p /home/$user/.config/autostart/
echo '[Desktop Entry]' > /home/$user/.config/autostart/xfce4-config.desktop
echo 'Hidden=true' >> /home/$user/.config/autostart/xfce4-config.desktop
