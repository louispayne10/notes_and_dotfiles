#!/bin/bash

menu="$1"

if [ "$menu" = "appmenu" ]; then
    rofi -show drun -dpi 144 -theme "$HOME/.config/rofi/launchers/type-2/style-3"
elif [ "$menu" = "powermenu" ]; then
    source $HOME/.config/rofi/powermenu/type-4/powermenu.sh 1
elif [ "$menu" == "emoji" ]; then
    rofimoji --skin-tone ask --selector-args \
    "-theme $HOME/.config/rofi/launchers/type-1/style-4.rasi -dpi 144"
elif [ "$menu" == "clipboard" ]; then
    rofi -modi "clipboard:greenclip print" -show clipboard \
    -theme $HOME/.config/rofi/launchers/type-1/style-4.rasi -dpi 144
elif [ "$menu" == "brightness" ]; then
    export BRIGHTNESS_THEME="$HOME/.config/rofi/applets/type-1/style-2.rasi"
    source $HOME/.config/rofi/applets/bin/brightness.sh
elif [ "$menu" == "music" ]; then
    source $HOME/.config/rofi/playerctl-menu/music.sh
else
    echo 'unrecognised command'
fi
