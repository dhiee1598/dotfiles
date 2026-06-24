#!/bin/bash

BARS=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
IDLE_BARS="<span color='#0d3440'>▁▁▁▁▁▁▁▁▁▁▁▁</span>"

cava -p ~/.config/cava/waybar | while IFS= read -r line; do
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
