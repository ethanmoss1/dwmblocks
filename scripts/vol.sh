#! /bin/bash

# specific button sent when individual module is clicked
# 1:LClk 2:RClk 3:MdlClk 4:ScrlUp 5:ScrlDwn

case $BUTTON in 
    1) amixer --quiet set Master toggle-mute ;;
#    2) echo "NAN" ;;
    3) alacritty -e alsamixer ;;
    4) amixer --quiet set Master 5%+ ;;
    5) amixer --quiet set Master 5%- ;;
esac

# updated on signal either by clicking module or RTMIN
# which is defined in dwmblocks config 'blocks.h'

# Get output from a mixer, then find these chars '[,%,]' 
# and split the line up. we then print the end appearance on the nth index
sound=$(amixer get Master | awk -F '[]%[]' 'END{print $5}')
# Get current Volume
vol=$(amixer get Master | awk -F '[]%[]' 'END{print $2}')
iconpath="/usr/share/icons/Faba/48x48/notifications/"
bar=$(seq -s "─" $(($vol/6)) | sed 's/[0-9]//g')

# Set color and Icon based on if muted or not,
# if its not muted then Icon is based on Volume level
if [ $sound == "on" ]
then
    colour=^c\#ebdbb2^
    if [ $vol -ge 66 ]
    then
        icon="墳"
        iconnotify="notification-audio-volume-high.svg"
    elif [ $vol -ge 33 ] && [ $vol -lt 66 ]
    then
        icon="奔"
        iconnotify="notification-audio-volume-medium.svg"
    else
        icon="奄"
        iconnotify="notification-audio-volume-low.svg"
    fi
else
    colour=^c\#928374^
    icon="婢"
    iconnotify="notification-audio-volume-muted.svg"
fi

if [ $vol -ge 100 ]
then
    space=" "
elif [ $vol -ge 10 ]
then
    space="  "
else
    space="   "
fi

# Echo all it out onto status
#notify-send "Volume" "$vol$space     $bar" -t 2000 -i $iconpath$iconnotify -r 101
space="                 $space"
notify-send "Volume$space$vol" -h int:value:$vol -t 2000 -i $iconpath$iconnotify -r 101
echo "$colour$icon^f1^^d^"
