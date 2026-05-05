#! /usr/bin/env bash

TARGET_WORKSPACE=4
GROUP_NAME="messengers"
APP_CLASSES=("telegram" "signal" "discord")

get_address() { hyprctl clients -j | jq -r --arg c "$1" '.[] | select(.class==$c) | .address' | head -n1; }
group_master_address() { hyprctl groups -j | jq -r --arg n "$GROUP_NAME" '.[] | select(.name==$n) | .addresses[0]'; }

while true; do
    master=$(group_master_address)
    for cls in "${APP_CLASSES[@]}"; do
        addr=$(get_address "$cls")
        [[ -z "$addr" ]] && continue
        hyprctl dispatch movetoworkspace "$TARGET_WORKSPACE" "$addr"
        if [[ -z "$master" ]]; then
            hyprctl dispatch groupcreate "$addr"
            hyprctl dispatch groupsetname "$addr" "$GROUP_NAME"
            master="$addr"
            continue
        fi
        already=$(hyprctl groups -j | jq -r --arg n "$GROUP_NAME" --arg a "$addr" '.[] | select(.name==$n) | .addresses[] | select(.==$a)')
        [[ -z "$already" ]] && hyprctl dispatch groupadd "$addr"
    done
    sleep 3
done
