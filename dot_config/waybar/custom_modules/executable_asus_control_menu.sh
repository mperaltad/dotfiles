#!/bin/bash

# Define the menu options with icons
ECO=" Eco ManuMode"
PERFORMANCE="󰓅 Performance Mode"
BALANCED="󰾅 Balanced Mode"
QUIET="󰾆 Quiet Mode"
SEPARATOR="─────────────────────"
INTEGRATED="󰢮 Integrated GPU Mode"
HYBRID="󰢹 Hybrid GPU Mode"
HYBRID="󰢹 Hybrid GPU Mode"

# Show menu with rofi
chosen=$(printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s" "$ECO" "$PERFORMANCE" "$BALANCED" "$QUIET" "$INTEGRATED" "$HYBRID" "$DEDICATED" \
    | rofi -dmenu -i -p "ASUS Control Center" \
    -theme-str '
    * {
        font: "FiraCode Nerd Font 11";
        background-color: transparent;
        text-color: #e0def4;
    }
    window {
        width: 400px;
        border: 2px;
        border-color: #ebbcba;
        border-radius: 8px;
        background-color: #191724;
    }
    mainbox {
        background-color: transparent;
    }
    listview {
        lines: 6;
        background-color: transparent;
    }
    element {
        background-color: transparent;
    }
    element selected {
        background-color: #26233a;
    }
    element-text {
        background-color: transparent;
        text-color: inherit;
    }
    inputbar {
        background-color: #1f1d2e;
    }
    prompt {
        background-color: transparent;
        text-color: #f6c177;
    }
    entry {
        background-color: transparent;
    }' \
    -markup-rows)

# Handle selection and refresh waybar
case $chosen in
    "$ECO")
        hyprctl reload;
        ~/.config/hypr/battery-save.sh; # remove hyprland energy draining features
        asusctl profile -P Quiet;
        supergfxctl -m Integrated;
        pkill -SIGRTMIN+8 waybar ;;
    "$PERFORMANCE")
        hyprctl reload; # back to default values
        asusctl profile -P Performance
        pkill -SIGRTMIN+8 waybar ;;
    "$BALANCED")
        hyprctl reload;
        asusctl profile -P Balanced
        pkill -SIGRTMIN+8 waybar ;;
    "$QUIET")
        hyprctl reload;
        asusctl profile -P Quiet
        pkill -SIGRTMIN+8 waybar ;;
    "$INTEGRATED")
        hyprctl reload;
        supergfxctl -m Integrated
        pkill -SIGRTMIN+8 waybar ;;
    "$HYBRID")
        hyprctl reload;
        supergfxctl -m Hybrid
        pkill -SIGRTMIN+8 waybar ;;
esac
