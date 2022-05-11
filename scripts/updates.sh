#! /bin/bash

case $BUTTON in
    1) alacritty -e yay ;;    
esac

CHKPAC=$(checkupdates | wc -l)
CHKAUR=$(yay -Qu | wc -l)
UPS=$(($CHKPAC + $CHKAUR))


ICON=" "

echo $ICON$UPS
