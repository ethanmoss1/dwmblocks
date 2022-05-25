#! /bin/bash

name=$(bluetoothctl info | awk -F ': ' '/Name/ {print $2}')
icon="/usr/share/icons/Faba/48x48/devices/bluetooth.svg"
# specific button sent when individual module is clicked
# 1:LClk 2:RClk 3:MdlClk 4:ScrlUp 5:ScrlDwn

function send_notification {
    notify-send Bluetooth "$1" -i $icon -r 106
}

case $BUTTON in
    1)  if [[ -z $name ]]; then
            send_notification "Disconnected" 
        else
            send_notification "Connected to: $name" 
        fi ;;
    3)  send_notification "Connecting to Fiio..."
        connected=$(bluetoothctl connect 40:ED:98:18:E1:71 )
        send_notification "$connected"
        ;;
esac

if [[ -z $name ]]; then
    echo ''
else
    echo ''
fi
