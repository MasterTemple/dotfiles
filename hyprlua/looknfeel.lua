--[[
# Refer to https://wiki.hyprland.org/Configuring/Variables/

# https://wiki.hyprland.org/Configuring/Variables/#general
general {
    gaps_in = 2
    gaps_out = 2

    border_size = 1

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false

    layout = dwindle
}

# https://wiki.hyprland.org/Configuring/Variables/#decoration
decoration {
    rounding = 4

    shadow {
        enabled = true
        range = 2
        render_power = 3
        color = rgba(1a1a1aee)
    }

    # https://wiki.hyprland.org/Configuring/Variables/#blur
    blur {
        enabled = true
        size = 3
        passes = 1

        vibrancy = 0.1696
    }
}

# https://wiki.hyprland.org/Configuring/Variables/#animations
animations {
    enabled = yes, please :)

    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = easeOutQuint,0.23,1,0.32,1
    bezier = easeInOutCubic,0.65,0.05,0.36,1
    bezier = linear,0,0,1,1
    bezier = almostLinear,0.5,0.5,0.75,1.0
    bezier = quick,0.15,0,0.1,1

    animation = global, 1, 10, default
    animation = border, 1, 5.39, easeOutQuint
    animation = windows, 1, 4.79, easeOutQuint
    animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
    animation = windowsOut, 1, 1.49, linear, popin 87%
    animation = fadeIn, 1, 1.73, almostLinear
    animation = fadeOut, 1, 1.46, almostLinear
    animation = fade, 1, 3.03, quick
    animation = layers, 1, 3.81, easeOutQuint
    animation = layersIn, 1, 4, easeOutQuint, fade
    animation = layersOut, 1, 1.5, linear, fade
    animation = fadeLayersIn, 1, 1.79, almostLinear
    animation = fadeLayersOut, 1, 1.39, almostLinear
    animation = workspaces, 0, 0, ease
}

# Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
# "Smart gaps" / "No gaps when only"
# uncomment all if you wish to use that.
# workspace = w[tv1], gapsout:0, gapsin:0
# workspace = f[1], gapsout:0, gapsin:0
# windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
# windowrule = rounding 0, floating:0, onworkspace:w[tv1]
# windowrule = bordersize 0, floating:0, onworkspace:f[1]
# windowrule = rounding 0, floating:0, onworkspace:f[1]

# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
dwindle {
    pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # You probably want this
    force_split = 2 # Always split on the right
}

# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
master {
    new_status = master
}

# https://wiki.hyprland.org/Configuring/Variables/#misc
misc {
    disable_hyprland_logo = true
	middle_click_paste = false
    disable_splash_rendering  = true
	# If this is enabled, I automatically focus applications like Telegram when I receive a notification
    # focus_on_activate = true
}

group {
    col.border_active = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.border_inactive = rgba(595959aa)
}

group:groupbar {
    font_family = JetBrainsMono Nerd Font
	height = 16
	indicator_gap = -16
	indicator_height = 16
	font_size = 12
	col.active = 0x66ffff00
	col.inactive = 0x66777700
	text_color = 0xffffffff
	blur = true
	keep_upper_gap = false
}
]]
--

-- Refer to https://wiki.hyprland.org/Configuring/Variables/
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,

		border_size = 1,

		-- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		-- col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
		-- col.inactive_border = rgba(595959aa)
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	-- https://wiki.hyprland.org/Configuring/Variables/#decoration
	decoration = {
		rounding = 4,

		shadow = {
			enabled = true,
			range = 2,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		-- https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 3,
			passes = 1,

			vibrancy = 0.1696,
		},
	},

	-- https://wiki.hyprland.org/Configuring/Variables/#animations
	animations = {
		enabled = true,
	},

	-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
	dwindle = {
		pseudotile = true, -- Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		preserve_split = true, -- You probably want this
		force_split = 2, -- Always split on the right
	},

	-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
	master = {
		new_status = "master",
	},

	-- https://wiki.hyprland.org/Configuring/Variables/#misc
	misc = {
		disable_hyprland_logo = true,
		middle_click_paste = false,
		disable_splash_rendering = true,
		-- If this is enabled, I automatically focus applications like Telegram when I receive a notification
		-- focus_on_activate = true
	},

	group = {
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		groupbar = {
			font_family = "JetBrainsMono Nerd Font",
			height = 16,
			indicator_gap = -16,
			indicator_height = 16,
			font_size = 12,
			col = {
				active = 0x66ffff00,
				inactive = 0x66777700,
			},
			text_color = 0xffffffff,
			blur = true,
			keep_upper_gap = false,
		},
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
