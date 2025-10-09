#!/usr/bin/env bash
set -euo pipefail
# Prints current state
function output {
  current=$(xset -q|grep LED| awk '{ print $10 }')
  if [ "$current" = "00001000" ]
  then
    echo "%{F#FACCDC}  DE"
  elif [ "$current" = "00000000" ]
  then
    echo "  US"
  fi
}

case ${1-default} in
    *)
        output
        ;;
esac
