#!/bin/bash

set -e
set -o xtrace

intern="eDP-1"
extern="DP-2"

connected_monitors() {
    connected_monitors=$(xrandr | grep " connected" | awk '{print $1}')
}

connected_monitors
connected_monitors="${connected_monitors//$'\n'/ | }"
chosen=$(echo -e "extra\ndisconnect" | rofi -p "Monitor Settings" -mesg "$connected_monitors" -dmenu -dpi 144 -theme $HOME/.config/rofi/display-settings/display-settings-style.rasi)

$HOME/.config/rofi/display-settings/place_monitors.sh $chosen
