#! /usr/bin/bash

laptop="eDP-1"
disabled=$(hyprctl monitors all -j | jq ".[] | select(.name == \"$laptop\") | .disabled")

echo "$disabled"

if [ "$disabled" == "true" ]; then
	hyprctl keyword monitor "$laptop, preferred, auto, 1"
else
	hyprctl keyword monitor "$laptop, disable"
fi
