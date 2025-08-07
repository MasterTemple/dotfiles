#!/bin/bash

hidden=$(hyprctl clients -j | jq '.[] | "[\(.workspace.id):\(.pid)] \(.class) | \(.title)"')
select=$(echo "$hidden" | wofi --dmenu | grep -oP "\d+:\d+")
ws=$(echo $select | cut -d ":" -f 1)
pid=$(echo $select | cut -d ":" -f 2)
# if [ -z "$pid" ]; then
#   exit
# fi
hyprctl dispatch workspace $ws
