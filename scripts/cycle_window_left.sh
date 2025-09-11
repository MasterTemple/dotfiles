#!/bin/bash
focused_mon=$(hyprctl activewindow -j | jq -r '.monitor')

# notify-send "$focused_mon"

case "$focused_mon" in
  eDP-2)
    hyprctl dispatch movewindow mon:DVI-I-1
    ;;
  DVI-I-1)
    hyprctl dispatch movewindow mon:DVI-I-2
    ;;
  DVI-I-2)
    hyprctl dispatch movewindow mon:eDP-2
    ;;
esac
