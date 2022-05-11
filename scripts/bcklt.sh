#! /bin/bash

case $BUTTON in 
#    1)  ;;
#    2)  ;;
#    3)  ;;
    4) xbacklight -inc 10 ;;
    5) xbacklight -dec 10 ;;
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

if [ $level -ge 100 ]
then
    space=" "
elif [ $level -ge 10 ]
then
    space="  "
else
    space="   "
fi

echo "$icon$space$level%"
