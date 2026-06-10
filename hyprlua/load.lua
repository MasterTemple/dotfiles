local terminal = "alacritty"

-- require("/home/dgmastertemple/.local/share/mastertemple/hyprlua/autostart.lua")
-- require("/home/dgmastertemple/.local/share/mastertemple/hyprlua/bindings.lua")
-- require("/home/dgmastertemple/.local/share/mastertemple/hyprlua/envs.lua")
-- require("/home/dgmastertemple/.local/share/mastertemple/hyprlua/input.lua")
-- require("/home/dgmastertemple/.local/share/mastertemple/hyprlua/looknfeel.lua")
-- require("/home/dgmastertemple/.local/share/mastertemple/hyprlua/monitors.lua")
-- require("/home/dgmastertemple/.local/share/mastertemple/hyprlua/windows.lua")

-- Put hyprlua/ inside ~/.config/hypr/
-- and say `require("hyprlua.load")`

require("hyprlua.autostart")
require("hyprlua.bindings")
-- require("hyprlua.bindings.media")
-- require("hyprlua.bindings.tiling")
-- require("hyprlua.bindings.utilities")
require("hyprlua.envs")
require("hyprlua.input")
require("hyprlua.looknfeel")
require("hyprlua.monitors")
require("hyprlua.windows")
