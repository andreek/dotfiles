#!/usr/bin/env bash
killall polybar
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  bar="plug"
  if [[ "$m" == "DVI-I-1" ]]; then
    bar="main"
  elif [[ "$m" == "DVI-D-0" ]]; then
    bar="mainLeft"
  fi
  MONITOR=$m polybar --reload $bar &
done
