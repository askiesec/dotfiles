#!/bin/bash

# Usage:
#   chmod +x ~/.dots/bin/monitor-setup.sh
#   exec_always --no-startup-id ~/.dots/bin/monitor-setup.sh

INTERNAL="eDP"
EXTERNAL="HDMI-A-0"

connected() {
    xrandr | grep "^$1 connected" > /dev/null 2>&1
}

# --- Profile: docked (external only, laptop screen off) ---
profile_docked() {
    echo "Applying profile: docked"
    xrandr \
        --output "$EXTERNAL" --mode 1920x1080 --rate 60 --pos 0x0 --scale 1x1 --primary \
        --output "$INTERNAL" --off
}

# --- Profile: laptop (internal only) ---
profile_laptop() {
    echo "Applying profile: laptop"
    xrandr \
        --output "$INTERNAL" --mode 1920x1080 --rate 60 --pos 0x0 --scale 1x1 --primary \
        --output "$EXTERNAL" --off
}

# --- Auto-detect and apply ---
if connected "$EXTERNAL"; then
    profile_docked
else
    profile_laptop
fi

# Reload wallpaper after xrandr changes
feh --bg-fill ~/Pictures/wallpapers/background.jpg &
