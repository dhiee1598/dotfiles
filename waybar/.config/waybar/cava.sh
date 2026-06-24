#!/bin/bash

BARS=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
IDLE_BARS="<span color='#23293a'>▁▁▁▁▁▁▁▁▁▁▁▁</span>"

cava -p ~/.config/cava/waybar | while IFS= read -r line; do
    output=""
    silent=true
    for val in $line; do
        (( val > 0 )) && silent=false
        bar="${BARS[$val]:-▁}"
        if (( val >= 6 )); then
            color="#f0abfc"
        elif (( val >= 4 )); then
            color="#7dd3fc"
        elif (( val >= 1 )); then
            color="#5eead4"
        else
            color="#23293a"
        fi
        output+="<span color='${color}'>${bar}</span>"
    done
    $silent && echo "$IDLE_BARS" || echo "$output"
done
