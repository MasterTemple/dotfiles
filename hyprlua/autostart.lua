hl.on("hyprland.start", function()
	hl.exec_cmd("dropbox-cli start")

	-- Stores only text data
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	-- Stores only image data
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("mako")
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaybg -i ~/.config/omarchy/current/background -m fill")
	hl.exec_cmd("swayosd-server")
	hl.exec_cmd("walker --gapplication-service")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("wl-clip-persist --clipboard regular --all-mime-type-regex '^(?!x-kde-passwordManagerHint).+'")

	hl.exec_cmd("[workspace 1] alacritty -e tmux")
end)

--[[
# Extra autostart processes
exec-once = dropbox-cli start

# https://wiki.hypr.land/0.41.0/Useful-Utilities/Clipboard-Managers/#cliphist
exec-once = wl-paste --type text --watch cliphist store #Stores only text data
exec-once = wl-paste --type image --watch cliphist store #Stores only image data

exec-once = uwsm app -- hypridle
exec-once = uwsm app -- mako
exec-once = uwsm app -- waybar
exec-once = uwsm app -- swaybg -i ~/.config/omarchy/current/background -m fill
exec-once = uwsm app -- swayosd-server
exec-once = uwsm app -- walker --gapplication-service
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec-once = wl-clip-persist --clipboard regular --all-mime-type-regex '^(?!x-kde-passwordManagerHint).+'

exec-once = [workspace 1] uwsm app -- alacritty -e tmux

# I want it to open in background so it will be syncing automatically
# exec-once = [silent] uwsm app -- obsidian
# obsidian vault="Dropbox Library"

]]
--
