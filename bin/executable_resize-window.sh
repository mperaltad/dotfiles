#!/usr/bin/env bash


window=`xdotool getwindowfocus`

xdotool windowsize "$window" 1920 1080
