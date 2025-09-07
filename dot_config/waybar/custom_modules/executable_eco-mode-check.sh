#!/bin/bash

if [[ "$(hyprctl -j getoption animations:enabled | jq -r '.int')" != "0" ]]; then
    echo '{"text": "󱐋", "class": "on"}'
else
    echo '{"text": "", "class": "off"}'
fi
