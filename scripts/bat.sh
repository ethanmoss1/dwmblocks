#! /bin/bash
bat=$(cat /sys/class/power_supply/BAT1/capacity)
stats=$(cat /sys/class/power_supply/BAT1/status)

# Notification:


# Changing Status Icon
if [ $stats == "Charging" ]
then
    colour="^d^"
    icon=""
else
    if [ $bat -le 15 ]
    then
        colour="^c#cc241d^"
        icon=""
    else
        colour="^d^"
        icon=""
    fi
fi

if [ $bat -ge 100 ]
then
    space=" "
elif [ $bat -ge 10 ]
then
    space="  "
else
    space="   "
fi

echo "$colour$icon$space$bat%^d^"
