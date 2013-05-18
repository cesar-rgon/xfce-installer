#!/bin/bash
usuario=`whoami`
versionUbuntu=`lsb_release -rs`

# Se muestra diálogo de notificación
zenity --notification --window-icon="info" --text "Configurando escritorio Xfce ..." --timeout=1

# Se asocia el modo de autenticación "sudo" a "gksu".
# Necesario para que funcione bien aquellas aplicaciones gráficas precedidas por "gksu".
# Esto equivale a ejecutar en consola "gksu-properties" y escoger modo de autenticación "sudo".
gconftool-2 --set /apps/gksu/sudo-mode --type bool true

# Consola blanco sobre negro. Afecta solo a la consola de gnome (si se instala).
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/use_theme_colors false
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/background_color "#000000000000"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/foreground_color "#FFFFFFFFFFFF"

# Se establece el tema del escritorio por defecto
if [ $versionUbuntu == "12.04" ]; then
	xfconf-query -c xsettings -p "/Net/ThemeName" -t string -s "greybird-git" --create
else
	xfconf-query -c xsettings -p "/Net/ThemeName" -t string -s "Greybird" --create
fi
# Se establece el tema de iconos por defecto
xfconf-query -c xsettings -p "/Net/IconThemeName" -t string -s "Faenza-Custom" --create

# Tema del cursor
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-White"

# Se establece el tiempo en milisegundos del doble clic de ratón
xfconf-query -c xsettings -p "/Net/DoubleClickTime" -t int -s "500" --create

# Se establece el tema de la barra de títulos de las ventanas
xfconf-query -c xfwm4 -p "/general/theme" -t string -s "Blackbird" --create

# Se establece el fondo de pantalla del escritorio
xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor0/image-path" -t string -s "/usr/share/xfce4/backdrops/greybird-wall-1920x1200.png" --create
# Se establece el tamaño de iconos del escritorio
xfconf-query -c xfce4-desktop -p "/desktop-icons/icon-size" -t uint -s "51" --create
# Se establece el tamaño de las fuentes del escritorio
xfconf-query -c xfce4-desktop -p "/desktop-icons/use-custom-font-size" -t bool -s "true" --create
xfconf-query -c xfce4-desktop -p "/desktop-icons/font-size" -t double -s "8.000000" --create

# Se agregan más teclas rápidas a las ya existentes.
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>Delete" -t string -s "lxtask" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>l" -t string -s "xflock4" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -t string -s "exo-open --launch TerminalEmulator" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>f" -t string -s "exo-open --launch FileManager" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/Print" -t string -s "xfce4-screenshooter" --create
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>F3" -t string -s "xfce4-appfinder" --create

# Si se ha instalado pyLoad
if [ $1 == "pyLoadInstalado" ]; then
	# Se muestra diálogo de notificación
	zenity --notification --window-icon="info" --text "Se procede a configurar PyLoad desde un terminal." --timeout=1
	# Se detiene el demonio de pyLoad
	/etc/init.d/pyload-daemon stop
	# Se inicia pyLoadCore para que el usuario pueda configurarlo desde la consola que se abre.
	exo-open --launch TerminalEmulator /usr/bin/pyLoadCore
	# Se muestra diálogo de notificación
	zenity --notification --window-icon="info" --text "Al finalizar la configuracion, PyLoad requiere reinicio del sistema para funcionar correctamente." --timeout=1
fi

# Se deshabilita el lanzador de este script. Ya que sólo debe ejecutarse este script con el primer inicio de sesión.
mkdir -p /home/$usuario/.config/autostart/
echo '[Desktop Entry]' > /home/$usuario/.config/autostart/xfce4-config.desktop
echo 'Hidden=true' >> /home/$usuario/.config/autostart/xfce4-config.desktop


