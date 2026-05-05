--[[
# Application bindings
$terminal = uwsm app -- alacritty
# $browser = uwsm app -- chromium --new-window --ozone-platform=wayland
$browser = uwsm app -- brave --new-window --ozone-platform=wayland
$webapp = $browser --app

unbind = SUPER,
unbind = SUPER, return
unbind = SUPER, B
unbind = SUPER SHIFT, B

bind = SUPER, return, exec, $terminal
# bind = SUPER, F, exec, uwsm app -- nautilus --new-window
bind = SUPER, B, exec, $browser
bind = SUPER SHIFT, B, exec, /home/dgmastertemple/Documents/webapps_wofi
# bind = SUPER, M, exec, uwsm app -- spotify
# https://wiki.hypr.land/Configuring/Window-Rules/ & https://wiki.hypr.land/Configuring/Dispatchers/#executing-with-rules
bind = SUPER CONTROL, R, exec, hyprctl reload
# bind = SUPER, N, exec, [float] $terminal -e nvim
bind=SUPER,TAB,workspace,previous
bind = SUPER, A, exec, $terminal -e btop
# bind = SUPER, T, exec, [float] $terminal

source = ~/.local/share/mastertemple/hypr/bindings/media.conf
source = ~/.local/share/mastertemple/hypr/bindings/tiling.conf
source = ~/.local/share/mastertemple/hypr/bindings/utilities.conf
]]
--

local terminal = "alacritty"
local browser = "brave --new-window --ozone-platform=wayland"
local webapp = browser .. " --app"

hl.unbind("SUPER")
hl.unbind("SUPER + return")
hl.unbind("SUPER + B")
hl.unbind("SUPER + SHIFT + B")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("/home/dgmastertemple/Documents/webapps_wofi"))
hl.bind(mainMod .. " + CONTROL + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(terminal .. " -e nvim"), { float = true })
-- https://wiki.hypr.land/Configuring/Window-Rules/ & https://wiki.hypr.land/Configuring/Dispatchers/

-- bind=SUPER,TAB,workspace,previous
-- hl.bind(mainMod .. " + TAB", hl.dsp.focus({ }))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(terminal .. " -e btop"))

require("~/.local/share/mastertemple/hyprlua/bindings/media.lua")
require("~/.local/share/mastertemple/hyprlua/bindings/tiling.lua")
require("~/.local/share/mastertemple/hyprlua/bindings/utilities.lua")
