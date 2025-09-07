#!/usr/bin/env bash

# Check if we have an active GPU and if hybrid mode is enabled
if ! supergfxctl -g | grep -q "Hybrid"; then
    exit 0
fi

# Get the GPU utilization and temperature from nvtop (for both AMD and NVIDIA)
GPU_UTIL=$(nvtop -b --show-util | awk 'NR==2 {print $3}' | sed 's/%//')
GPU_TEMP=$(nvtop -b --show-temp | awk 'NR==2 {print $3}' | sed 's/°C//')

# If no utilization data is found, exit
if [ -z "$GPU_UTIL" ] || [ -z "$GPU_TEMP" ]; then
    exit 0
fi

# Determine which GPU is being used (NVIDIA or AMD)
GPU_NAME=$(nvtop -b --show-name | awk 'NR==2 {print $2}')

# Set the icon based on the active GPU
if [[ "$GPU_NAME" == *"NVIDIA"* ]]; then
    GPU_ICON="󰻠"  # NVIDIA Icon
    GPU_VENDOR="NVIDIA"
elif [[ "$GPU_NAME" == *"AMD"* ]]; then
    GPU_ICON="󰇸"  # AMD Icon
    GPU_VENDOR="AMD"
else
    GPU_ICON="󰧶"  # Default Icon for Unknown GPUs
    GPU_VENDOR="Unknown"
fi

# Set the utilization icon based on GPU utilization
case $GPU_UTIL in
    [0-9]) ICON="󰝦" ;;  # 0-9%
    [1-2][0-9]) ICON="󰪞" ;;  # 10-29%
    [3-4][0-9]) ICON="󰪟" ;;  # 30-49%
    [5-6][0-9]) ICON="󰪣" ;;  # 50-69%
    [7-8][0-9]) ICON="󰪤" ;;  # 70-89%
    9[0-4]) ICON="󰪥" ;;  # 90-94%
    9[5-9]|100) ICON="󰪢" ;;  # 95-100%
    *) ICON="󰪠" ;;  # Default
esac

# Output JSON for Waybar
echo "{\"text\": \"$GPU_ICON $ICON\", \"tooltip\": \"$GPU_VENDOR GPU: $GPU_UTIL% Utilization, $GPU_TEMP°C\"}"

