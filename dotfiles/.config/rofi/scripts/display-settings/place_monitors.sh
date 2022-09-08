#!/bin/bash

set -e
set -o xtrace

intern="eDP-1"
extern="DP-2"

check_monitors_connected() {
    connected_monitors=$(xrandr | grep " connected" | awk '{print $1}')
    echo $connected_monitors | grep -q -w $intern || ( notify-send "$intern not found" && exit 1 )
    echo $connected_monitors | grep -q -w $extern || ( notify-send "$extern not found" && exit 1 )
}

# Note if I ever want a duplicate option then this video could be good - https://www.youtube.com/watch?v=wu2NWw2wPaA
case $1 in
    "extra")
        check_monitors_connected
        xrandr --output "$extern" --scale 1.5x1.5 --mode 1920x1080 --pos 2256x0 --right-of "$intern"
        notify-send "Using $extern as an extra monitor"
    ;;
     "disconnect")
        xrandr --output "$extern"  --off --output "$intern" --auto
    ;;
    *) notify-send "Multi Monitor" "Unknown Operation"
esac

# relaunch polybar
$HOME/.config/polybar/launch.sh
nitrogen --restore
#sleep 1 # TODO: Figure out why this is needed for polybar when that nitrogen call isnt there and how to get rid of it

