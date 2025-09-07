#!/bin/bash

eco_manu_mode=""
if [[ "$(hyprctl -j getoption animations:enabled | jq -r '.int')" != "0" ]]; then
    eco_manu_mode="󱐋"
fi

# Get graphics mode
graphics_mode=$(supergfxctl -g 2>/dev/null)
case "$graphics_mode" in
    "Hybrid")
        graphics="󰢹 Hybrid"
        ;;
    "Integrated")
        graphics="󰢮 iGPU"
        ;;
    *)
        graphics="󰋑 Unknown"
        ;;
esac

# Get performance profile
profile=$(asusctl profile -p 2>/dev/null | grep "Active profile" | cut -d " " -f4)
case "$profile" in
    "Performance")
        perf="󰓅 Performance"
        ;;
    "Balanced")
        perf="󰾅 Balanced"
        ;;
    "Quiet")
        perf="󰾆 Quiet"
        ;;
    *)
        perf="󰋑 Unknown"
        ;;
esac

# Output in JSON format for waybar
echo "{\"text\": \"$eco_manu_mode $graphics $perf\", \"tooltip\": \"EcoManu: $eco_manu_mode Graphics: $graphics\nProfile: $perf\"}"

