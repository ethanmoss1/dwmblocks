#! /bin/bash

# initalise variables
bat=$(cat /sys/class/power_supply/BAT1/capacity)
stats=$(cat /sys/class/power_supply/BAT1/status)
lowbattery=$(cat $XDG_CONFIG_HOME/bash/lowbattery)
plugged=$(cat $XDG_CONFIG_HOME/bash/plugged)
unplugged=$(cat $XDG_CONFIG_HOME/bash/unplugged)
path="/usr/share/icons/Faba/48x48/notifications/"

# Spacing
if [ $bat -ge 100 ]; then
    space="                "
elif [ $bat -ge 10 ]; then
    space="                 "
else
    space="                  "
fi

# functions
mkfile() {
    mkdir -p -- "$1" && \
    touch -- "$1"/"$2" && \
    echo "$3" > "$1"/"$2"
}

send_notification () {
    if [ $bat -le 15 ] && [ $stats != "Charging" ]; then
        path+="notification-battery-low.svg"
        notify-send "Battery$space$bat%" "$stats" \
                -h int:value:$bat \
                -i $path \
                -u critical \
                -r 103
    else
        path+="notification-power.svg"
        notify-send "Battery$space$bat%" "$stats" \
                -h int:value:$bat \
                -i $path \
                -r 103
    fi
}

# clickable block
case $BUTTON in
    1) send_notification ;;
esac

# setup configuration:
if [ -n $lowbattery ]; then
    mkfile $XDG_CONFIG_HOME/bash lowbattery 0
    mkfile $XDG_CONFIG_HOME/bash plugged 0
    mkfile $XDG_CONFIG_HOME/bash unplugged 0
fi

# Charge Status Icon and notifications
if [ $stats == "Charging" ]; then
    unplugged="0"
    lowbattery="0"
    if [ $plugged == "0" ]; then
        plugged="1"
        send_notification
    fi
    icon=""
else
    if [ $bat -le 15 ]; then
        icon="^c#ea6962^^d^"
        unplugged="0"
        plugged="0"
        if [[ $lowbattery -eq 0 ]]; then
            lowbattery="1"
            send_notification
        fi
    else
        lowbattery="0"
        plugged="0"
        if [[ $unplugged -eq 0 ]]; then
            unplugged="1"
            send_notification
        fi
        if [ $bat -le 20 ]; then
            icon=""
        elif [ $bat -le 30 ]; then
            icon=""
        elif [ $bat -le 40 ]; then
            icon=""
        elif [ $bat -le 50 ]; then
            icon=""
        elif [ $bat -le 60 ]; then
            icon=""
        elif [ $bat -le 70 ]; then
            icon=""
        elif [ $bat -le 80 ]; then
            icon=""
        elif [ $bat -le 90 ]; then
            icon=""
        else
            icon=""
        fi

    fi
fi

echo $icon
echo $lowbattery > $XDG_CONFIG_HOME/bash/lowbattery
echo $unplugged > $XDG_CONFIG_HOME/bash/unplugged
echo $plugged > $XDG_CONFIG_HOME/bash/plugged
