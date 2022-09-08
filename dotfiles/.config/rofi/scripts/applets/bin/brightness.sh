#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Brightness

# Import Current Theme
# source "$HOME"/.config/rofi/applets/shared/theme.bash
# theme="$type/$style"

theme=${BRIGHTNESS_THEME}

# Brightness Info
backlight="$(printf "%.0f\n" `light -G`)"
card="`light -L | grep 'backlight' | head -n1 | cut -d'/' -f3`"

if [[ $backlight -ge 0 ]] && [[ $backlight -le 29 ]]; then
    level="Low"
elif [[ $backlight -ge 30 ]] && [[ $backlight -le 49 ]]; then
    level="Optimal"
elif [[ $backlight -ge 50 ]] && [[ $backlight -le 69 ]]; then
    level="High"
elif [[ $backlight -ge 70 ]] && [[ $backlight -le 100 ]]; then
    level="Peak"
fi

# Theme Elements
prompt="${backlight}%"
mesg="Device: ${card}, Level: $level"

if [[ "$theme" == *'type-1'* ]]; then
	list_col='1'
	list_row='3' # WAS 4
	win_width='600px'
elif [[ "$theme" == *'type-3'* ]]; then
	list_col='1'
	list_row='3' # WAS 4
	win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
	list_col='1'
	list_row='3' # WAS 4
	win_width='425px'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='3' # WAS 4
	list_row='1'
	win_width='550px'
fi

# Options
layout=`cat ${theme} | grep 'USE' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Increase"
	option_2=" Optimal"
	option_3=" Decrease"
	option_4=" Settings"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
fi

# Rofi CMD
rofi_cmd() {
	default_selection="${ROFI_BRIGHTNESS_SELECTION:=0}"
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme} -dpi 144 -selected-row "$default_selection"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
	# echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		brightnessctl --quiet -d intel_backlight -c backlight set +10%
		export ROFI_BRIGHTNESS_SELECTION=0
		source ~/.config/rofi/applets/bin/brightness.sh
	elif [[ "$1" == '--opt2' ]]; then
		brightnessctl --quiet -d intel_backlight -c backlight set 30%
	elif [[ "$1" == '--opt3' ]]; then
		brightnessctl --min-value=1000 --quiet -d intel_backlight -c backlight set 10%-
		export ROFI_BRIGHTNESS_SELECTION=2
		source ~/.config/rofi/applets/bin/brightness.sh
	# elif [[ "$1" == '--opt4' ]]; then
	# 	xfce4-power-manager-settings
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    # $option_4)
	# 	run_cmd --opt4
    #     ;;
esac
