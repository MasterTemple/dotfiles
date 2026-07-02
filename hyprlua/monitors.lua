--[[
# See https://wiki.hyprland.org/Configuring/Monitors/

# Change to 1 if on a 1x display (then change last "auto" to 1 in monitor=)
# Change to something like 1.75 for fractional scaling (can work well with 1.66667 monitor scaling)
# Note: You must relaunch Hyprland after changing any env like this (use Super+Esc, then Relaunch)
env = GDK_SCALE,1

# Use single default monitor (see all monitors with: hyprctl monitors)
# Format: monitor = [port], resolution, position, scale
monitor=,preferred,auto,1

# this lets me disable laptop monitor when plugged in
# hyprctl keyword monitor "eDP-1, disable"

bind = SUPER CONTROL, T, exec, bash -c "source .local/share/omarchy/scripts/toggle_laptop_monitor.sh"

source = ~/.local/share/mastertemple/hypr/monitor_setups/1.conf
# source = ~/.local/share/mastertemple/hypr/monitor_setups/2.conf
# source = ~/.local/share/mastertemple/hypr/monitor_setups/3.conf
# source = ~/.local/share/mastertemple/hypr/monitor_setups/active.conf

bind = SUPER CONTROL SHIFT, L, exec, ~/.local/share/mastertemple/scripts/cycle_window_right.sh
bind = SUPER CONTROL SHIFT, H, exec, ~/.local/share/mastertemple/scripts/cycle_window_left.sh


# bind = SUPER, M, exec, $HOME/.local/share/mastertemple/scripts/monitor_switcher.sh
]]
--

-- See https://wiki.hyprland.org/Configuring/Monitors/

-- Change to 1 if on a 1x display (then change last "auto" to 1 in monitor=)
-- Change to something like 1.75 for fractional scaling (can work well with 1.66667 monitor scaling)
-- Note: You must relaunch Hyprland after changing any env like this (use Super+Esc, then Relaunch)
hl.env("GDK_SCALE", "1")

-- Use single default monitor (see all monitors with: hyprctl monitors)
-- Format: monitor = [port], resolution, position, scale
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

-- this lets me disable laptop monitor when plugged in
-- hyprctl keyword monitor "eDP-1, disable"

-- bind = SUPER CONTROL, T, exec, bash -c "source .local/share/omarchy/scripts/toggle_laptop_monitor.sh"
hl.bind("SUPER + CONTROL + T", hl.dsp.exec_cmd(".local/share/omarchy/scripts/toggle_laptop_monitor.sh"))

-- TODO: convert these setups
-- source = ~/.local/share/mastertemple/hypr/monitor_setups/1.conf
hl.monitor({
	output = "eDP-2",
	mode = "preferred",
	position = "auto",
	scale = "1",
})
-- TODO: convert these setups
-- source = ~/.local/share/mastertemple/hypr/monitor_setups/2.conf
-- source = ~/.local/share/mastertemple/hypr/monitor_setups/3.conf
-- source = ~/.local/share/mastertemple/hypr/monitor_setups/active.conf

hl.bind("SUPER + CONTROL + SHIFT + L", hl.dsp.exec_cmd("~/.local/share/mastertemple/scripts/cycle_window_right.sh"))
hl.bind("SUPER + CONTROL + SHIFT + H", hl.dsp.exec_cmd("~/.local/share/mastertemple/scripts/cycle_window_left.sh"))

-- bind = SUPER, M, exec, $HOME/.local/share/mastertemple/scripts/monitor_switcher.sh

local workspaces_per_monitor = 10

-- TODO: Figure this out
--
-- require("hyprlua.monitors.msi_1_monitor")
-- require("hyprlua.monitors.msi_laptop_monitor")

------------
-- MIRROR --
------------

local laptop_monitor = "eDP-2"
-- local laptop_monitor = "eDP-1"

hl.monitor({
	output = laptop_monitor,
	mode = "1920x1080",
	position = 1920.0 .. "x" .. 0.0,
	scale = 1.0,
	transform = 0,
})

hl.monitor({ output = "", mirror = laptop_monitor })

hl.monitor({
	output = "DVI-I-1",
	disabled = true,
})

------------
-- ?????? --
------------

-- hl.monitor({
-- 	output = "DVI-I-2",
-- 	mode = "1920x1080",
-- 	position = 0.0 .. "x" .. 0.0,
-- 	scale = 1.0,
-- 	transform = 0,
-- })
--
-- hl.monitor({
-- 	output = "eDP-2",
-- 	mode = "1920x1080",
-- 	position = 1920.0 .. "x" .. 0.0,
-- 	scale = 1.0,
-- 	transform = 0,
-- })
--
-- hl.monitor({
-- 	output = "DVI-I-1",
-- 	disabled = true,
-- })

-- TODO: Figure this out
--
-- hyprctl eval '
-- local function table_to_string(tbl, indent)
--     indent = indent or ""
--     if type(tbl) ~= "table" then
--         return tostring(tbl)
--     end
--
--     local result = "{\n"
--     local next_indent = indent .. "  "
--
--     for k, v in pairs(tbl) do
--         -- Format the key
--         local key = type(k) == "string" and string.format("[%q]", k) or string.format("[%s]", k)
--
--         -- Format the value
--         local value
--         if type(v) == "table" then
--             value = table_to_string(v, next_indent)
--         elseif type(v) == "string" then
--             value = string.format("%q", v)
--         else
--             value = tostring(v)
--         end
--
--         result = result .. next_indent .. key .. " = " .. value .. ",\n"
--     end
--
--     return result .. indent .. "}"
-- end
-- hl.notification.create({
-- 	text = table_to_string(hl.get_monitors()),
-- 	timeout = 20000
-- })
-- '
