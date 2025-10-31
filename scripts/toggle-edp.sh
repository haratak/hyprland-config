#!/bin/bash
# Toggle eDP-1 (internal display) on/off

status=$(hyprctl monitors -j | jq -r '.[] | select(.name == "eDP-1") | .disabled')

if [ "$status" = "false" ]; then
    # Currently enabled, disable it
    hyprctl keyword monitor "eDP-1,disable"
else
    # Currently disabled, enable it
    hyprctl keyword monitor "eDP-1,1600x2560@144,1280x0,2,transform,3"
fi
