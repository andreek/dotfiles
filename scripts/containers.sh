#!/usr/bin/env bash
containerCount=$(podman ps --format "{{.Names}}" | wc -l)
if [ "$containerCount" -gt 0 ]; then
  names=$(podman ps --sort names --format "{{.Names}}" | awk -vORS=' • ' '{ print $1 }' | sed 's/ • $/\n/')
  echo "$names"
else
  echo ""
  exit 0
fi
