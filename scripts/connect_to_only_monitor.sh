#!/usr/bin/env bash
# ---------------------------------------------------------
# Hyprland monitor auto‑enable script
#
# If there is exactly one monitor connected and it is
# currently disabled, enable it automatically.
#
# Dependencies:
#   - hyprctl (comes with Hyprland)
#   - jq   (JSON parser)
#
# This script can be called from a udev rule, a systemd
# service, or even be run manually for testing.
# ---------------------------------------------------------

# Exit on any error, but we want to keep the script running
set -euo pipefail

# ---------------------------------------------------------
# Helper: log messages (goes to syslog + stdout for debugging)
# ---------------------------------------------------------
log() {
    local level="$1"; shift
    local msg="$*"
    logger -t hypr-monitor-auto-enable "[${level}] ${msg}"
    echo "[$(date +'%H:%M:%S')] ${msg}"
}

# ---------------------------------------------------------
# Main logic
# ---------------------------------------------------------
run_once() {
    # Get monitor information in JSON format
    local monitors_json
    if ! monitors_json=$(hyprctl monitors -j 2>/dev/null); then
        log "ERR" "hyprctl failed – are you running inside a Hyprland session?"
        return 1
    fi

    # How many monitors are currently *connected* (enabled + disabled)
    local total_cnt
    total_cnt=$(echo "$monitors_json" | jq 'length')

    # If there is exactly one monitor, we may have to enable it
    if (( total_cnt == 1 )); then
        # Check whether the only monitor is disabled
        local disabled_name
        disabled_name=$(echo "$monitors_json" | jq -r '.[0] | select(.disabled == true) | .name // empty')

        if [[ -n $disabled_name ]]; then
            log "INFO" "Only monitor '$disabled_name' is present and disabled → enabling."
            hyprctl keyword monitor "${disabled_name}, enable"
        else
            log "INFO" "Only one monitor is present and already enabled – nothing to do."
        fi
    else
        # For completeness we can also log when >1 monitor is present
        log "DEBUG" "${total_cnt} monitors detected – script does nothing."
    fi
}

# ---------------------------------------------------------
# Entry point
# ---------------------------------------------------------
# When run from udev we want to *just* execute the logic once.
# When run as a systemd service we keep a tiny loop so we
# survive missed udev events (e.g. after a suspend).
if [[ "${1-}" == "--loop" ]]; then
    log "INFO" "Starting persistent monitor‑watch loop."
    while true; do
		notify-send "Running"
        run_once
        # Sleep a modest amount; change if you want it more/less aggressive
        sleep 5
    done
else
    run_once
fi
