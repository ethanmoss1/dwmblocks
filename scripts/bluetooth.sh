#! /bin/bash

name=$(bluetoothctl info | awk -F ': ' '/Name/ {print $2}') 

# specific button sent when individual module is clicked
# 1:LClk 2:RClk 3:MdlClk 4:ScrlUp 5:ScrlDwn
case $BUTTON in
    1) notify-send Bluetooth "Connected to: $name" ;;
#    2) echo NaN ;;
    3) notify-send Bluetooth "$(bluetoothctl connect 40:ED:98:18:E1:71)" ;;
#    4) echo NaN ;;
#    5) echo NaN ;;
esac

if [[ $name = '' ]]; then
    echo ''
else
    echo ''
fi
