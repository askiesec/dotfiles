#!/bin/bash
# ~/.dots/bin/input-setup.sh

# --- Mouse (USB Gaming Mouse, id=13) ---
# Flat accel profile (adaptive=1,0,0 → flat=0,1,0)
xinput set-prop 13 "libinput Accel Profile Enabled" 0, 1, 0
xinput set-prop 13 "libinput Accel Speed" -0.10

# --- Touchpad (ELAN06FA, id=17) ---
xinput set-prop 17 "libinput Tapping Enabled" 1
xinput set-prop 17 "libinput Natural Scrolling Enabled" 1
xinput set-prop 17 "libinput Disable While Typing Enabled" 1
xinput set-prop 17 "libinput Middle Emulation Enabled" 1
xinput set-prop 17 "libinput Accel Speed" 0.0

