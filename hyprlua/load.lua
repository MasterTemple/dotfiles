-- https://chatgpt.com/c/6a46d479-b12c-83e8-a32c-83dc249c6679
local function get_hostname()
    -- Try environment variables first
    local hostname = os.getenv("HOSTNAME") or os.getenv("HOST")
    if hostname and hostname ~= "" then
        return hostname:gsub("%s+$", "")
    end

    -- Try /etc/hostname
    local f = io.open("/etc/hostname", "r")
    if f then
        hostname = f:read("*l")
        f:close()
        if hostname and hostname ~= "" then
            return hostname
        end
    end

    -- Fallback to the hostname command
    local p = io.popen("hostname 2>/dev/null")
    if p then
        hostname = p:read("*l")
        p:close()
        if hostname and hostname ~= "" then
            return hostname
        end
    end

    return nil
end

HOSTNAME = get_hostname()
MSI = HOSTNAME == "msitemple"
ARTIX = HOSTNAME == "artixtemple"

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

require("hyprlua.scripts.global_config")
