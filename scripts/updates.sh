#! /bin/bash

CHKPAC=$(checkupdates | wc -l)
CHKAUR=$(yay -qu | wc -l)
UPS=$(($CHKPAC + $CHKAUR))

icon="/usr/share/icons/Faba/48x48/apps/softwarecenter.svg"

if [ $UPS -ge 100 ]
then
    space="           "
elif [ $UPS -ge 10 ]
then
    space="            "
else
    space="             "
fi

case $BUTTON in
    1) alacritty -e yay ;;    
esac

if [[ $UPS -ge 1 ]]; then
    ICON=""
    notify-send "Arch Packages$space$UPS" \
        "Click >  < icon to update" \
        -i $icon \
        -r 105 
else
    ICON=""
fi

echo $ICON
