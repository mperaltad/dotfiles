#!/bin/bash

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
echo "{\"text\": \"$graphics  $perf\", \"tooltip\": \"Graphics: $graphics\nProfile: $perf\"}"
