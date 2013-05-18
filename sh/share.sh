#!/bin/bash
# Primer cuadro de diálogo. Permite seleccionar compartir / descompartir
opcion=`zenity --list --radiolist --title "Compartir en red" --text "" --column "" --column "Opción" True Compartir False Descompartir`

if [ $? -eq 0 ]; then
if [[ "$opcion" == "Compartir" ]]; then
	# Segundo cuadro de diálogo. Permite seleccionar característica de compartición.
	opcion2=`zenity --list --checklist --title "Compartir en red" --text "Seleccione atributos" --column "" --column "Atributo" False "Acceso Público" False "Lectura / Escritura"`
   if [ $? -eq 0 ]; then
   if [ "$opcion2" == "" ]; then
	net usershare add $1 $2 "" Everyone:R guest_ok=n
	zenity --info --text "Se comparte con acceso privado, solo lectura."
   else
	if [[ "$opcion2" == "Acceso Público" ]]; then
	   net usershare add $1 $2 "" Everyone:R guest_ok=y
	   zenity --info --text "Se comparte con acceso público, solo lectura."
	else
		if [[ "$opcion2" == "Lectura / Escritura" ]]; then
			net usershare add $1 $2 "" Everyone:F guest_ok=n && chmod 777 $2
			zenity --info --text "Se comparte con acceso privado. Lectura / Escritura."
		else
			if [[ "$opcion2" == "Acceso Público|Lectura / Escritura" ]]; then
				net usershare add $1 $2 "" Everyone:F guest_ok=y && chmod 777 $2
				zenity --info --text "Se comparte con acceso público. Lectura / Escritura"
			fi
		fi
	fi
   fi
   fi
else
	net usershare delete $1 && chmod 755 $2
	zenity --info --text "Se ha descompartido la carpeta."
fi
fi
