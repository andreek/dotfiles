#!/usr/bin/env bash
set -euo pipefail
INTERNAL_AUDIO="alsa_output.pci-0000_00_1f.3.pro-output-0"
USB_AUDIO="alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G1_00057707-00.iec958-stereo"

# Toggles sink between INTERNAL_AUDIO (headphones) and USB_AUDIO (speaker)
function toggle {
  current=$(pactl get-default-sink)
  if [ "$current" = "$USB_AUDIO" ]
  then
    pactl set-default-sink $INTERNAL_AUDIO
  else
    pactl set-default-sink $USB_AUDIO
  fi
}

# Prints current state
function output {
  current=$(pactl get-default-sink)
  if [ "$current" = "$USB_AUDIO" ]
  then
    echo "      "
  elif [ "$current" = "$INTERNAL_AUDIO" ]
  then
    echo "  %{F#6e8f58}  " 
  else
    echo "UNKNOWN_AUDIO"
  fi
}

case ${1-default} in
    --toggle)
        toggle
        ;;
    *)
        output
        ;;
esac
