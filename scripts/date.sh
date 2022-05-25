#! /bin/bash

dte=$(date +"%a %d %b")
case $BUTTON in
    1) notify-send "Date" "$dte" \
        -i "/usr/share/icons/Faba/48x48/apps/calendar.svg" \
        -r 104 ;;
#    2) echo NaN ;;
#    3) echo NaN ;;
#    4) echo NaN ;;
#    5) echo NaN ;;
esac

date +"%T"
