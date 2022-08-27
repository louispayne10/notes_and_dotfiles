#!/bin/bash

menu="$1"

if [ "$menu" = "appmenu" ]; then
    rofi -modi 'drun,window,filebrowser' -theme appmenu -show 
elif [ "$menu" = "powermenu" ]; then
    rofi -modi 'Powermenu:~/.config/rofi/powermenu.sh' -show Powermenu -theme powermenu
elif [ "$menu" == "emoji" ]; then
    rofimoji --selector-args "-theme emoji"
elif [ "$menu" == "clipboard" ]; then
    rofi -modi "clipboard:greenclip print" -show clipboard -theme emoji
else
    echo 'unrecognised command'
fi
