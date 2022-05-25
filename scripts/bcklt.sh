#! /bin/bash

case $BUTTON in 
#    1)  ;;
#    2)  ;;
#    3)  ;;
    4) xbacklight -inc 10   ;;
    5) xbacklight -dec 10   ;;
esac

level=$(xbacklight -get | awk -F '.' '{ print $1 }')

if [ $level -ge 80 ]; then
    icon=""
elif [ $level -le 40 ]; then
    icon=""
else
    icon=""
fi

if [ $level -ge 100 ]; then
    space=""
else
    if [ $level -ge 10 ]; then
        space=" "
    else
        space="  "
    fi
fi

space+="              "
iconnotify="/usr/share/icons/Faba/48x48/notifications/notification-display-brightness.svg"
notify-send "Brightness$space$level" \
        -h int:value:$level \
        -t 2000 \
        -r 102 \
        -i $iconnotify
echo $icon
