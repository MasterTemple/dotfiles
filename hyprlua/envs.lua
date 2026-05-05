--[[
# Extra env variables
# Note: You must relaunch Hyprland after changing envs (use Super+Esc, then Relaunch)
# env = MY_GLOBAL_ENV,setting

# Cursor size
env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24

# Force all apps to use Wayland
env = GDK_BACKEND,wayland,x11,*
env = QT_QPA_PLATFORM,wayland;xcb
env = QT_STYLE_OVERRIDE,kvantum
env = SDL_VIDEODRIVER,wayland
env = MOZ_ENABLE_WAYLAND,1
env = ELECTRON_OZONE_PLATFORM_HINT,wayland
env = OZONE_PLATFORM,wayland

xwayland {
  force_zero_scaling = true
}

# Use XCompose file
env = XCOMPOSEFILE,~/.XCompose

# Don't show update on first launch
ecosystem {
  no_update_news = true
}
]]
--

-- Extra env variables
-- Note: You must relaunch Hyprland after changing envs (use Super+Esc, then Relaunch)
-- env = MY_GLOBAL_ENV,setting
hl.env("MY_GLOBAL_ENV", "setting")

-- Cursor size
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Force all apps to use Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")

-- unscale XWayland
hl.config({
	xwayland({
		force_zero_scaling = true,
	}),
})

-- Use XCompose file
hl.env("XCOMPOSEFILE", "~/.XCompose")

hl.config({
	-- Don't show update on first launch
	ecosystem({
		no_update_news = true,
	}),
})
