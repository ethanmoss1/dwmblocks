#! /bin/bash

case $BUTTON in
    1) dte=$(date +"%a %d %b")  ;;
#    2) echo NaN ;;
#    3) echo NaN ;;
#    4) echo NaN ;;
#    5) echo NaN ;;
    *) dte=$(date +"%T")
esac

echo "$dte"
