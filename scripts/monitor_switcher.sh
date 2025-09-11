
#!/usr/bin/env bash
#=====================================================================
# hypr‑monitor‑switcher
#
# Description:
#   - Presents a list of Hyprland monitor‑setup files with `walker`.
#   - After you pick one, it (re)creates the symlink
#       ~/.local/share/mastertemple/hypr/monitor_setups/active.conf
#     pointing at the chosen file.
#   - Optionally tells Hyprland to reload the config.
#
# Requirements:
#   - walker (or fzf as a drop‑in replacement)
#   - bash ≥ 4.0
#
# Author:  <your‑name>
# License: MIT
#=====================================================================

# --------------------------------------------------
# Configuration – change only if you know what you’re doing
# --------------------------------------------------
MONITOR_CFG_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/mastertemple/hypr/monitor_setups"
ACTIVE_LINK="${MONITOR_CFG_ROOT}/active.conf"

# Set to true if you want Hyprland to reload the config after the symlink changes.
# You can also leave it false and reload manually with `hyprctl reload`.
RELOAD_AFTER_SWITCH=true

# --------------------------------------------------
# Helper functions
# --------------------------------------------------
die() {
    printf '✖ %s\n' "$1" >&2
    exit 1
}

info() {
    printf 'ℹ %s\n' "$1"
}

success() {
    printf '✔ %s\n' "$1"
}

# --------------------------------------------------
# Ensure the directory exists
# --------------------------------------------------
[[ -d "$MONITOR_CFG_ROOT" ]] || die "Directory not found: $MONITOR_CFG_ROOT"

# --------------------------------------------------
# Build the list of candidate config files
# --------------------------------------------------
#   - `-type f`          : only regular files
#   - `-not -name active.conf` : do NOT show the symlink itself
#   - `-printf '%f\n'`   : print only the basename (no leading path)
candidate_files=()
while IFS= read -r -d $'\0' f; do
    candidate_files+=("$f")
done < <(find "$MONITOR_CFG_ROOT" -maxdepth 1 -type f ! -name active.conf -print0)

[[ ${#candidate_files[@]} -gt 0 ]] || die "No monitor‑setup files found in $MONITOR_CFG_ROOT"

# --------------------------------------------------
# Let the user pick a file with walker
# --------------------------------------------------
# walker by default expects a list on stdin and prints the selected line
# You can press <Esc> to cancel.
selected_file="$(printf '%s\n' "${candidate_files[@]}" | walker -p 'Select monitor setup → ' -d)"
[[ -n "$selected_file" ]] || die "Selection cancelled."

selected_path="${MONITOR_CFG_ROOT}/${selected_file}"

# --------------------------------------------------
# Create/replace the symlink
# --------------------------------------------------
if [[ -L "$ACTIVE_LINK" || -e "$ACTIVE_LINK" ]]; then
    # If it already exists we remove it first (whether it is a symlink or a regular file).
    rm -f "$ACTIVE_LINK" || die "Could not remove old $ACTIVE_LINK"
fi

ln -s "$selected_path" "$ACTIVE_LINK" || die "Failed to create symlink"

success "Created symlink:"
printf '   %s → %s\n' "$ACTIVE_LINK" "$selected_path"

# --------------------------------------------------
# (Optional) Tell Hyprland to reload the config
# --------------------------------------------------
if $RELOAD_AFTER_SWITCH; then
    if command -v hyprctl > /dev/null; then
        # `hyprctl reload` is safe – it will re‑source the `source=` line that
        # points at `active.conf`.
        hyprctl reload > /dev/null 2>&1 && success "Hyprland reloaded."
    else
        info "hyprctl not found – you’ll need to reload Hyprland manually."
    fi
fi

exit 0
