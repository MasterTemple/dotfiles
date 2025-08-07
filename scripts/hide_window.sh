#!/bin/bash
pid=$(hyprctl activewindow -j | jq '.pid')
current_workspace=$(hyprctl activeworkspace -j | jq '.id')
if [ -z "$pid" ]; then
exit
fi
hyprctl dispatch movetoworkspacesilent 11,pid:$pid
