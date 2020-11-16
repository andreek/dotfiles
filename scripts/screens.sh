#!/bin/bash

HOSTNAME=$(hostname -s)

if [[ "$HOSTNAME" == "pico" ]]; then
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
        xrandr --output DP1-2 --off
        xrandr --output DP1-1 --off
        continue;
      fi
    done
  fi
  #exec --no-startup-id DISPLAY=":0" /usr/bin/picom -CGb
  exec --no-startup-id /usr/bin/feh --bg-scale $HOME/docs/misc/wallpaper.png
  exec --no-startup-id /usr/bin/twmnd
  exec --no-startup-id /usr/bin/xbindkeys
  exec --no-startup-id /usr/bin/nm-applet
  exec --no-startup-id /usr/bin/clipit
  exec --no-startup-id /usr/bin/pa-applet
  exec --no-startup-id /usr/bin/blueman-applet
  #exec --no-startup-id /usr/local/bin/stretchly
elif [[ "$HOSTNAME" == "desktop" ]]; then
  exec --no-startup-id /usr/bin/feh --bg-scale $HOME/dev/linux/Andreelec.tv/distributions/custom/splash/splash-1080.png
  exec --no-startup-id /usr/bin/twmnd
  exec --no-startup-id /usr/bin/xbindkeys
  exec --no-startup-id /usr/bin/clipit
  exec --no-startup-id /usr/bin/pa-applet
#  exec --no-startup-id /usr/bin/xss-lock i3lock -c 000
#  exec --no-startup-id /usr/bin/xset -display ":0.0" dpms 300 600 1200
fi

sleep 0.3

~/.config/polybar/init.sh

