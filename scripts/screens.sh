#!/bin/bash

DOCK_FILE=~/.docked

if [[ -f "$DOCK_FILE" ]]; then
  xrandr --output eDP1 --auto
  xrandr --output DP1-2 --rate 59.94 --mode 1920x1080 --left-of eDP1 --primary
  xrandr --output DP1-1 --mode 1920x1080 --left-of DP1-2
else
  for m in $(/usr/bin/xrandr --query | grep " connected" | /usr/bin/cut -d" " -f1); do
    if [[ "$m" != "eDP1" ]]; then
      xrandr --output $m --auto --right-of eDP1
      continue;
    elif [[ "$m" = "eDP1" ]]; then
      xrandr --output eDP1 --auto --primary
      continue;
    fi
  done
fi

sleep 0.3

~/.config/polybar/init.sh

