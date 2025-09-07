#!/usr/bin/env sh

if [ $(hyprctl monitors | grep -c "Monitor") -gt 1 ];
then
    if hyprctl monitors | grep -q "eDP-1"; 
    then 
        hyprctl keyword monitor eDP-1,disable; hyprctl dispatch workspace 1; 
    else
        hyprctl keyword monitor eDP-1,enable;
    fi;
fi;

