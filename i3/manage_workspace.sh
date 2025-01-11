#!/bin/bash

# Check if eDP-1 is connected
if xrandr | grep -q "^eDP-1 connected"; then
    # Assign workspaces 1-10 to HDMI-1
    i3-msg "workspace 1 output HDMI-1"
    i3-msg "workspace 2 output HDMI-1"
    i3-msg "workspace 3 output HDMI-1"
    i3-msg "workspace 4 output HDMI-1"
    i3-msg "workspace 5 output HDMI-1"
    i3-msg "workspace 6 output HDMI-1"
    i3-msg "workspace 7 output HDMI-1"
    i3-msg "workspace 8 output HDMI-1"
    i3-msg "workspace 9 output HDMI-1"
    i3-msg "workspace 10 output HDMI-1"

    # Assign workspaces 11-20 to eDP-1
    i3-msg "workspace 11 output eDP-1"
    i3-msg "workspace 12 output eDP-1"
    i3-msg "workspace 13 output eDP-1"
    i3-msg "workspace 14 output eDP-1"
    i3-msg "workspace 15 output eDP-1"
    i3-msg "workspace 16 output eDP-1"
    i3-msg "workspace 17 output eDP-1"
    i3-msg "workspace 18 output eDP-1"
    i3-msg "workspace 19 output eDP-1"
    i3-msg "workspace 20 output eDP-1"
else
    # If eDP-1 is not connected, assign all workspaces to HDMI-1
    for i in {1..20}; do
        i3-msg "workspace $i output HDMI-1"
    done
fi

