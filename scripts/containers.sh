#!/usr/bin/env bash
containerCount=$(podman ps --format "{{.Names}}" | wc -l | awk '{print $1}')
if [ $containerCount -eq 0 ]; then
  exit 1;
else
  names=$(podman ps --format "{{.Names}}" | awk -vORS=', ' '{ print $1 }' | sed 's/, $/\n/')
  echo "[ $names ]"
fi
exit 0;
