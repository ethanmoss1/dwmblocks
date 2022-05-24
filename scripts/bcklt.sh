#! /bin/bash

case $BUTTON in 
#    1)  ;;
#    2)  ;;
#    3)  ;;
    4) xbacklight -inc 10   ;;
    5) xbacklight -dec 10   ;;
esac

level=$(xbacklight -get | awk -F '.' '{ print $1 }')

if [ $level -ge 66 ]
then
    icon=""
elif [ $level -le 33 ]
then
    icon=""
else
    icon=""
fi

iconpath="/usr/share/icons/Faba/48x48/notifications/notification-display-brightness.svg"
iconnotify=""
notify-send "Brightness$space$level" \
        -h int:value:$level \
        -t 2000 \
        -r 102 \
        -i $iconpath$iconnotify
echo "$icon"
