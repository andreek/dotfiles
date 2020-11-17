#!/usr/bin/env bash

DOCK_FILE=~/.docked
HOSTNAME=$(hostname -s)

if [[ "$HOSTNAME" == "desktop" ]]; then
  MONITOR=DVI-I-1 polybar --reload main &
  MONITOR=DVI-D-0 polybar --reload mainLeft &
elif [[ "$HOSTNAME" == "pico" ]]; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    bar="plug"
    if [[ "$m" == "eDP1" ]]; then
      bar="x1c6"
      if [[ -f "$DOCK_FILE" ]]; then
        bar="dockedx1c6"
      fi
    elif [[ "$m" == "HDMI1" ]]; then
      bar="plug"
    elif [[ "$m" == "HDMI2" ]]; then
      bar="plug"
    elif [[ "$m" == "DP1-1" ]]; then
      bar="mainLeft"
    elif [[ "$m" == "DP1-2" ]]; then
      bar="main"
    fi
    MONITOR=$m polybar --reload $bar &
  done
fi
