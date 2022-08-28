#!/bin/bash

menu="$1"

if [ "$menu" = "appmenu" ]; then
    rofi -theme launcher-style -show drun 
elif [ "$menu" = "powermenu" ]; then
    uptime="`uptime -p | sed -e 's/up //g'`"
    host=`hostname`
    rofi -modi 'Powermenu:~/.config/rofi/powermenu.sh' -show Powermenu -theme powermenu-style
elif [ "$menu" == "emoji" ]; then
    rofimoji --selector-args "-theme emoji"
elif [ "$menu" == "clipboard" ]; then
    rofi -modi "clipboard:greenclip print" -show clipboard -theme emoji
else
    echo 'unrecognised command'
fi
