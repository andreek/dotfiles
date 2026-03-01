#!/bin/bash
# If external monitors are connected, disable laptop screen.
# Otherwise suspend normally.
external=$(swaymsg -t get_outputs | jq '[.[] | select(.name != "eDP-1" and .active == true)] | length')
if [ "$external" -gt 0 ]; then
    swaymsg output eDP-1 disable
else
    systemctl suspend
fi
