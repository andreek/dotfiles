#!/bin/bash

DOCK_FILE=~/.docked

if [[ $ACTION == "add" ]]; then
  touch $DOCK_FILE
elif [[ $ACTION == "remove" ]]; then
  rm $DOCK_FILE
fi

i3-msg restart
