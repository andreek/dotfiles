#!/usr/bin/env bash

# This script displays running Podman containers in a format suitable for Polybar in i3wm.
# It checks if Podman is installed, retrieves running container names, and formats them for display.

# Check if Podman is installed
if ! command -v podman &> /dev/null; then
  echo "Podman command not found. Please install Podman." >&2
  exit 1
fi

# Count the number of running containers
containerCount=$(podman ps --format "{{.Names}}" | wc -l) || {
  echo "Error: Failed to count running containers." >&2
  exit 2
}

if [ "$containerCount" -gt 0 ]; then
  # Retrieve container names, sort them, and join them with a separator suitable for Polybar
  names=$(podman ps --sort names --format "{{.Names}}" | paste -sd ' • ' -) || {
    echo "Error: Failed to retrieve container names." >&2
    exit 3
  }
  echo "$names"
else
  echo ""
  exit 0
fi
