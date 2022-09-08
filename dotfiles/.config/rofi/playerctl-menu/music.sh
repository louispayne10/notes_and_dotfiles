#!/bin/bash

set -e
set -o xtrace

set_correct_image() {
    # here we download the artwork for what is currently playing
    # to improve performance we cache the images in a folder and use these before requesting them
    local cache_dir="$HOME/.cache/rofi-playerctl"
    mkdir -p $cache_dir
    local current_image_path="$HOME/.cache/rofi-playerctl-current-image"
    local art_url=$(playerctl -p spotify metadata --format '{{mpris:artUrl}}')
    local art_base=$(basename $art_url)
    if [[ -e "$cache_dir/$art_base" ]]; then
        cp "$cache_dir/$art_base" "$current_image_path"
    else
        exit_code=0
        timeout 0.4s wget -o /dev/null -O "$cache_dir/$art_base" "$art_url" || exit_code="$?"
        if [[ "$exit_code" != 0 ]]; then
            # wget timed out, it may have never made the request or it got halway through writing the file
            rm -f "$cache_dir/$art_base"
            cp "$HOME/.config/rofi/playerctl-menu/music-logo.png" "$current_image_path"
        else
            cp "$cache_dir/$art_base" "$current_image_path"
        fi
    fi
}

rofi_cmd() {
    # the & character must be escaped to &amp; in rofi else it complains
    message=${message//&/&amp;}
    # use play/pause as the default selection unless we are rerunning the script
    default_selection="${ROFI_BUTTON_SELECTION:=1}"
    rofi -dmenu \
         -mesg "$message" \
         -markup-rows \
         -theme "$theme" \
         -dpi 144 \
         -selected-row "$default_selection" \
         -window-title "rofi-playerctl"
}

run_rofi() {
    echo -e "$prev_option\n$play_option\n$next_option\n$shuffle_option\n$loop_option" | rofi_cmd
}

theme="$HOME/.config/rofi/playerctl-menu/music-style"

if ! playerctl -p spotify status; then
    notify-send "rofi spotify menu" "playerctl could not find spotify - is it running?"
    exit 1
fi

shuffle_status=$(playerctl -p spotify shuffle)
loop_status=$(playerctl -p spotify loop)

play_option="懶"
next_option="怜"
prev_option="玲"
if [ "$shuffle_status" == "On" ]; then
    shuffle_option="劣"
else
    shuffle_option="咽"
fi
if [ "$loop_status" == "Track" ]; then
    loop_option=""
else
    loop_option="ﯩ"
fi

message=$(playerctl -p spotify metadata --format '{{title}} - {{artist}}')
set_correct_image

chosen="$(run_rofi)"
case ${chosen} in
    $play_option)
        playerctl -p spotify play-pause
        ;;
    $prev_option)
        playerctl -p spotify previous
        sleep 0.2s # wait until song changes
        export ROFI_BUTTON_SELECTION=0
        source ~/.config/rofi/playerctl-menu/music.sh
        ;;
    $next_option)
        playerctl -p spotify next
        sleep 0.2s # wait until song changes
        export ROFI_BUTTON_SELECTION=2
        source ~/.config/rofi/playerctl-menu/music.sh
        ;;
    $shuffle_option)
        playerctl -p spotify shuffle toggle
        ;;
    $loop_option)
        if [ "$loop_status" == "Track" ]; then
            playerctl -p spotify loop None
        else
            playerctl -p spotify loop Track
        fi
        ;;
esac
