#!/bin/bash

BARS=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

cava -p ~/.config/cava/waybar | while IFS= read -r line; do
    output=""
    silent=true
    for val in $line; do
        (( val > 0 )) && silent=false
        bar="${BARS[$val]:-▁}"
        if (( val >= 6 )); then
            color="#ff4455"
        elif (( val >= 4 )); then
            color="#fbbf24"
        elif (( val >= 1 )); then
            color="#34d399"
        else
            color="#1e2a40"
        fi
        output+="<span color='${color}'>${bar}</span>"
    done
    $silent && echo "" || echo "$output"
done
