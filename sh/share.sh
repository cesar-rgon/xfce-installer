#!/bin/bash
# First dialog box: It allows to share or unshare folder.
option=`zenity --list --radiolist --title "%MESSAGE1%" --text "" --column "" --column "%MESSAGE2%" True "%MESSAGE3%" False "%MESSAGE4%"`

if [ $? -eq 0 ]; then
	if [[ "$option" == "%MESSAGE3%" ]]; then  # To share folder
		# Second dialog box: It allows to select sharing features
		option2=`zenity --list --checklist --title "%MESSAGE1%" --text "%MESSAGE5%" --column "" --column "%MESSAGE6%" False "%MESSAGE7%" False "%MESSAGE8%"`
		if [ $? -eq 0 ]; then
			if [ "$option2" == "" ]; then
				net usershare add $1 $2 "" Everyone:R guest_ok=n
				# Private access, only read rights.
				zenity --info --text "%MESSAGE9%"
			else
				if [[ "$option2" == "%MESSAGE7%" ]]; then
					net usershare add $1 $2 "" Everyone:R guest_ok=y
					# Public access, only read rights.
					zenity --info --text "%MESSAGE10%"
				else
					if [[ "$option2" == "%MESSAGE8%" ]]; then
						net usershare add $1 $2 "" Everyone:F guest_ok=n && chmod 777 $2
						# Private access, read and write rights.
						zenity --info --text "%MESSAGE11%"
					else
						if [[ "$option2" == "%MESSAGE7%|%MESSAGE8%" ]]; then
							net usershare add $1 $2 "" Everyone:F guest_ok=y && chmod 777 $2
							# Public access, read and write rights.
							zenity --info --text "%MESSAGE12%"
						fi
					fi
				fi
			fi
		fi
	else	# To unshare folder
		net usershare delete $1 && chmod 755 $2
		zenity --info --text "%MESSAGE13%"
	fi
fi
