#!/usr/bin/env bash

DOCK_FILE=~/.docked
HOSTNAME=$(hostname -s)

# Terminate already running bar instances
killall -q -9 polybar || echo 'Process not running'

while pgrep -x polybar > /dev/null; do sleep 0.02; done

if [[ "$HOSTNAME" == "desktop" ]]; then
  MONITOR=DVI-I-1 polybar --reload main &
  MONITOR=DVI-D-0 polybar --reload mainLeft &
else
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    bar="plug"
    if [[ "$m" == "eDP1" ]]; then
      bar="x1c6"
      if [[ -f "$DOCK_FILE" ]]; then
        bar="dockedx1c6"
      fi
      polybar --reload $bar &
    elif [[ "$m" == "HDMI1" ]]; then
      bar="plug"
      MONITOR=$m polybar --reload $bar &
    elif [[ "$m" == "HDMI2" ]]; then
      bar="plug"
      MONITOR=$m polybar --reload $bar &
    elif [[ "$m" == "DP1-1" ]]; then
      MONITOR=$m polybar --reload mainLeft &
    elif [[ "$m" == "DP1-2" ]]; then
      MONITOR=$m polybar --reload main &
    fi
  done
fi
