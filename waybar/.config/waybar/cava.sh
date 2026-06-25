#!/bin/bash

BARS=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
IDLE_BARS="<span color='#7aa4ad'>▁▁▁▁▁▁▁▁▁▁▁▁</span>"

export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export PULSE_SERVER="${PULSE_SERVER:-unix:${XDG_RUNTIME_DIR}/pulse/native}"

while true; do
    cava -p "${HOME}/.config/cava/waybar" 2>/tmp/waybar-cava.log | while IFS= read -r line; do
        output=""
        silent=true
        for val in $line; do
            (( val > 0 )) && silent=false
            bar="${BARS[$val]:-▁}"
            if (( val >= 6 )); then
                color="#67e8f9"
            elif (( val >= 4 )); then
                color="#22d3ee"
            elif (( val >= 1 )); then
                color="#0891b2"
            else
                color="#0d3440"
            fi
            output+="<span color='${color}'>${bar}</span>"
        done
        $silent && echo "$IDLE_BARS" || echo "$output"
    done

    echo "$IDLE_BARS"
    sleep 1
done
