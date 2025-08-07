#!/bin/bash

active=$(hyprctl activeworkspace -j | jq .id)
hidden=$(hyprctl clients -j | jq '.[] | select(.workspace.id == 11) | "[\(.pid)] \(.class) | \(.title)"')
pid=$(echo "$hidden" | wofi --dmenu | grep -oP "\d+")
if [ -z "$pid" ]; then
  exit
fi
hyprctl dispatch movetoworkspacesilent $active,pid:$pid
