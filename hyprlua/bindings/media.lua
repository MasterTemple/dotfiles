--[[
# Only display the OSD on the currently focused monitor
$osdclient = swayosd-client --monitor "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')"

# Laptop multimedia keys for volume and LCD brightness (with OSD)
bindeld = ,XF86AudioRaiseVolume, Volume up, exec, $osdclient --output-volume raise
bindeld = ,XF86AudioLowerVolume, Volume down, exec, $osdclient --output-volume lower
bindeld = ,XF86AudioMute, Mute, exec, $osdclient --output-volume mute-toggle
bindeld = ,XF86AudioMicMute, Mute microphone, exec, $osdclient --input-volume mute-toggle
bindeld = ,XF86MonBrightnessUp, Brightness up, exec, $osdclient --brightness raise
bindeld = ,XF86MonBrightnessDown, Brightness down, exec, $osdclient --brightness lower

# Requires playerctl
bindld = , XF86AudioNext, Next track, exec, $osdclient --playerctl next
bindld = , XF86AudioPause, Pause, exec, $osdclient --playerctl play-pause
bindld = , XF86AudioPlay, Play, exec, $osdclient --playerctl play-pause
bindld = , XF86AudioPrev, Previous track, exec, $osdclient --playerctl previous

bindl = SUPER SHIFT, P, exec, playerctl play-pause
]]
--

-- Only display the OSD on the currently focused monitor
local osdclient = "swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\""

-- Laptop multimedia keys for volume and LCD brightness (with OSD)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(osdclient .. " --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(osdclient .. " --output-volume lower"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(osdclient .. " --output-volume mute-toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd(osdclient .. " --input-volume mute-toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(osdclient .. " --brightness raise"), { locked = true, repeating = true })
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(osdclient .. " --brightness lower"),
	{ locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(osdclient .. " --playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(osdclient .. " --playerctl previous"), { locked = true })

hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), { locked = true })
