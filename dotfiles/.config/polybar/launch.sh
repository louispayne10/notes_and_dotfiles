#!/bin/bash

# Terminate already running bar instances
# killall -q polybar
# If all your bars have ipc enabled, you can also use
polybar-msg cmd quit

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR="$m" polybar 2>&1 | tee -a /tmp/polybar.log & disown
done

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# polybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
