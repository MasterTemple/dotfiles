--[[
# Close window
bind = SUPER, Q, killactive,

# Control tiling
bind = SUPER, O, togglesplit, # dwindle
# bind = SUPER, P, pseudo, # dwindle
# bind = SUPER, V, togglefloating
# bind = SUPER, C, centerwindow

# bind = SUPER, Z, exec, bash -c "if hyprctl getwindowinfo | grep -q 'floating: true'; then hyprctl dispatch settiled; hyprctl dispatch hidewindow; else hyprctl dispatch togglefloating; hyprctl dispatch centerwindow; hyprctl dispatch fullscreen 1; fi"
bind = SUPER, Z, exec, bash -c "if hyprctl getwindowinfo | grep -q 'floating: true'; then hyprctl dispatch hidewindow; else hyprctl dispatch togglefloating; hyprctl dispatch resizeactive exact 80% 80%; hyprctl dispatch centerwindow; fi"
bind = SUPER, C, centerwindow
bind = SUPER, F, fullscreen
bind = SUPER, F11, fullscreen

# bind = SUPER, W, exec, bash -c "pid=$(hyprctl activewindow -j | jq '.pid'); current_workspace=$(hyprctl activeworkspace -j | jq '.id'); if [ -z \\"$pid\\" ]; then exit; fi hyprctl dispatch movetoworkspacesilent 11,pid:$pid"
# bind = SUPER, w, exec, bash -c "pid=$(hyprctl activewindow -j | jq '.pid'); hyprctl dispatch movetoworkspacesilent 11,pid:$pid"

# bind = SUPER, w, exec, bash -c "source /home/dgmastertemple/Development/bash/hide_window.sh"
# bind = SUPER, e, exec, bash -c "source /home/dgmastertemple/Development/bash/wofi_select_hidden_window.sh"

bind = SUPER SHIFT, q, exec, bash -c "source .local/share/omarchy/scripts/hide_window.sh"
bind = SUPER SHIFT, o, exec, bash -c "source .local/share/omarchy/scripts/select_hidden_window.sh"
bind = SUPER SHIFT, f, exec, bash -c "source .local/share/omarchy/scripts/jump_to_any_window.sh"

bind = SUPER, N, changegroupactive, f
bind = SUPER, P, changegroupactive, b
bind = SUPER, T, togglegroup

# pid=$(hyprctl activewindow -j | jq '.pid'); current_workspace=$(hyprctl activeworkspace -j | jq '.id'); if [ -z "$pid" ]; then exit; fi hyprctl dispatch movetoworkspacesilent 10,pid:$pid # Move to workspace 10

# Move focus with mainMod + arrow keys
bind = SUPER, left, movefocus, l
bind = SUPER, right, movefocus, r
bind = SUPER, up, movefocus, u
bind = SUPER, down, movefocus, d

# Move focus with mainMod + hjkl
bind = SUPER, H, movefocus, l
bind = SUPER, L, movefocus, r
bind = SUPER, K, movefocus, u
bind = SUPER, J, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = SUPER, code:10, workspace, 1
bind = SUPER, code:11, workspace, 2
bind = SUPER, code:12, workspace, 3
bind = SUPER, code:13, workspace, 4
bind = SUPER, code:14, workspace, 5
bind = SUPER, code:15, workspace, 6
bind = SUPER, code:16, workspace, 7
bind = SUPER, code:17, workspace, 8
bind = SUPER, code:18, workspace, 9
bind = SUPER, code:19, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = SUPER SHIFT, code:10, movetoworkspace, 1
bind = SUPER SHIFT, code:11, movetoworkspace, 2
bind = SUPER SHIFT, code:12, movetoworkspace, 3
bind = SUPER SHIFT, code:13, movetoworkspace, 4
bind = SUPER SHIFT, code:14, movetoworkspace, 5
bind = SUPER SHIFT, code:15, movetoworkspace, 6
bind = SUPER SHIFT, code:16, movetoworkspace, 7
bind = SUPER SHIFT, code:17, movetoworkspace, 8
bind = SUPER SHIFT, code:18, movetoworkspace, 9
bind = SUPER SHIFT, code:19, movetoworkspace, 10

# Swap active window with the one next to it with mainMod + SHIFT + arrow keys
bind = SUPER SHIFT, left, swapwindow, l
bind = SUPER SHIFT, right, swapwindow, r
bind = SUPER SHIFT, up, swapwindow, u
bind = SUPER SHIFT, down, swapwindow, d

# Swap active window with the one next to it with mainMod + SHIFT + hjkl
bind = SUPER SHIFT, H, swapwindow, l
bind = SUPER SHIFT, L, swapwindow, r
bind = SUPER SHIFT, K, swapwindow, u
bind = SUPER SHIFT, J, swapwindow, d

# Resize active window
bind = SUPER, minus, resizeactive, -100 0
bind = SUPER, equal, resizeactive, 100 0
bind = SUPER SHIFT, minus, resizeactive, 0 -100
bind = SUPER SHIFT, equal, resizeactive, 0 100

# Scroll through existing workspaces with mainMod + scroll
bind = SUPER, mouse_down, workspace, e+1
bind = SUPER, mouse_up, workspace, e-1

# Scroll through existing workspaces with mainMod + scroll
# bind = SUPER CONTROL, l, workspace, e+1
# bind = SUPER CONTROL, h, workspace, e-1
bind = SUPER CONTROL, n, workspace, e+1
bind = SUPER CONTROL, p, workspace, e-1

bind = SUPER CONTROL, H, focusmonitor, l
bind = SUPER CONTROL, L, focusmonitor, r
bind = SUPER CONTROL, K, focusmonitor, u
bind = SUPER CONTROL, J, focusmonitor, d

bind = SUPER CONTROL SHIFT, H, movewindow, mon:l
bind = SUPER CONTROL SHIFT, L, movewindow, mon:r
bind = SUPER CONTROL SHIFT, K, movewindow, mon:u
bind = SUPER CONTROL SHIFT, J, movewindow, mon:d

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = SUPER, mouse:272, movewindow
bindm = SUPER, mouse:273, resizewindow

]]
--

-- Close window
-- TODO:
-- bind = SUPER, Q, killactive,
hl.bind("SUPER + Q", hl.dsp.window.kill("activewindow"))

-- Control tiling
-- TODO:
-- hl.bind("SUPER + O", "togglesplit --dwindle")

-- TODO:
-- bind = SUPER, Z, exec, bash -c "if hyprctl getwindowinfo | grep -q 'floating: true'; then hyprctl dispatch hidewindow; else hyprctl dispatch togglefloating; hyprctl dispatch resizeactive exact 80% 80%; hyprctl dispatch centerwindow; fi"
-- bind = SUPER, C, centerwindow
-- bind = SUPER, F, fullscreen
-- bind = SUPER, F11, fullscreen

-- TODO:
-- hl.bind("SUPER + N", "changegroupactive, f")
-- hl.bind("SUPER + P", "changegroupactive, b")
-- hl.bind("SUPER + T", "togglegroup")

--
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

local directions = {
	-- TODO: Example Config uses "left" instead of "l" as direction..
	{ key = "H", arrow = "left", direction = "l" },
	{ key = "L", arrow = "right", direction = "r" },
	{ key = "K", arrow = "up", direction = "u" },
	{ key = "J", arrow = "down", direction = "d" },
}

for i, entry in ipairs(directions) do
	local direction = entry.direction
	local key = entry.key
	local arrow = entry.arrow
	-- Move focus
	-- TODO: bind = SUPER, H, movefocus, l
	hl.bind("SUPER + " .. arrow, hl.dsp.focus({ direction }))
	hl.bind("SUPER + " .. key, hl.dsp.focus({ direction }))

	-- Swap active window with the one next to it
	-- TODO: bind = SUPER SHIFT, H, swapwindow, l
	hl.bind("SUPER + SHIFT + " .. arrow, hl.dsp.window.swap({ direction }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.swap({ direction }))

	-- Focus monitor in direction
	-- TODO: bind = SUPER CONTROL, H, focusmonitor, l
	hl.bind("SUPER + CONTROL + " .. direction, hl.dsp.focus({ monitor = direction }))
	hl.bind("SUPER + CONTROL + " .. key, hl.dsp.focus({ monitor = direction }))

	-- Move window to monitor
	-- TODO: bind = SUPER CONTROL SHIFT, H, movewindow, mon:l
	hl.bind("SUPER + CONTROL + SHIFT + " .. direction, hl.dsp.window.move({ direction }))
	hl.bind("SUPER + CONTROL + SHIFT + " .. key, hl.dsp.window.move({ direction }))
end

-- Resize active window
hl.bind("SUPER + minus", hl.dsp.window.resize({ x = -100, y = 0 }))
hl.bind("SUPER + eqal", hl.dsp.window.resize({ x = 100, y = 0 }))
hl.bind("SUPER + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = -100 }))
hl.bind("SUPER + SHIFT + eqal", hl.dsp.window.resize({ x = 0, y = 100 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Cycle through existing workspaces
hl.bind("SUPER + CONTROL + N", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + CONTROL + P", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
