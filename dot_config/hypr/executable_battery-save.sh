#!/usr/bin/env bash

#if [[ "$(hyprctl -j getoption animations:enabled | jq -r '.int')" != "0" ]]; then
    hyprctl keyword animations:enabled false 
    hyprctl keyword decoration:blur:enabled false 
    hyprctl keyword decoration:shadow:enabled false 
    hyprctl keyword decoration:rounding 0 
    hyprctl keyword decoration:drop_shadow false 
#fi
