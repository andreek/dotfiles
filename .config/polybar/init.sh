#!/usr/bin/env bash
killall polybar
kill -9 $(ps aux | grep 'pavolume.sh' | awk '{print $2}')
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  bar="plug"
  if [[ "$m" == "eDP1" ]]; then
    bar="x1c6"
  elif [[ "$m" == "DP1-2" ]]; then
    bar="main"
  elif [[ "$m" == "DP1-1" ]]; then
    bar="mainLeft"
  fi
  MONITOR=$m polybar --reload $bar &
done
