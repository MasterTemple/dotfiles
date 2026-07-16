# ----------------------------
# Setup + Aliases
# ----------------------------

set -euo pipefail

MT=~/.local/share/mastertemple

# bashrc
echo "source ~/.local/share/mastertemple/bash/rc" >> ~/.bashrc

# I don't want to retype the flags
alias yayi="yay -S --needed --noconfirm"

RUNIT_SV=/etc/runit/sv
RUNIT_SERVICE=/run/runit/service/

enable_service() {
	if [ ! -e "/run/runit/service/$1" ]; then
		sudo ln -s "/etc/runit/sv/$1" /run/runit/service/
	else
		echo "$1 already enabled, skipping symlink."
	fi
}

# ----------------------------
# Installers
# ----------------------------

# yay
mkdir -p ~/.github
(
	cd ~/.github
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
)

# rust / cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install rust apps via pre-compiled binaries
cargo install cargo-binstall

# ----------------------------
# System
# ----------------------------

# WiFi
yayi impala iwd iwd-runit
ln -s /etc/runit/sv/iwd/ /run/runit/service/

# Bluetooth
cargo binstall bluetui
yayi bluez-runit bluez-utils
sudo ln -s /etc/runit/sv/bluetoothd /run/runit/service/

# Audio
#yayi pavucontrol
yayi wiremix-git

# Brightness
yayi brightnessctl

# TODO: Sound (likely from that video I watched)

# Cron
yayi cronie-runit

# Monitors
# yayi evdi-dkms displaylink linux-headers dkms wlr-randr

# ----------------------------
# Terminal
# ----------------------------

yayi \
	alacritty \
	bash-completion \
	man-db man-pages \

# Starship
curl -sS https://starship.rs/install.sh | sh
cp "$MT/starship/starship.toml" ~/.config/starship.toml

# ----------------------------
# Terminal Applications
# ----------------------------

# Various CLI tools
cargo binstall fd-find ripgrep eza dua-cli htmd-cli
yayi jq zoxide

yayi bat btop fzf

# Various

# Television
cargo binstall television 
tv update-channels
ln -s "$MT/television" ~/.config/television


# Neovim plugin dependencies
cargo binstall tree-sitter-cli
yayi nodejs npm
# Neovim
yayi neovim-git
# if [ -d ~/.config/nvim ]; then
#   mv ~/.config/nvim ~/.config/nvim.bak
# fi
# git clone https://github.com/MasterTemple/kickstart.nvim ~/.config/nvim
# neovim
# ln -s "$MT/nvim" ~/.config/nvim

# Dropbox
yayi dropbox-cli
# TODO: Autostart this service via crontab
cargo binstall dropbox-ignore

# Do not sync certain directories
dropbox-cli exclude add "$HOME/Dropbox/Peter"
dropbox-cli exclude add "$HOME/Dropbox/Development/javascript/sermon_archives/immanuelky/audio"
dropbox-cli exclude add "$HOME/Dropbox/Development/javascript/sermon_archives/sermon_audio/audio"
dropbox-cli exclude add "$HOME/Dropbox/Development/python/transcribe_voice_memos/model"
dropbox-cli exclude add "$HOME/Dropbox/Development/python/transcribe_voice_memos/data"
dropbox-cli exclude add "$HOME/Dropbox/Backups"
dropbox-cli exclude add "$HOME/Dropbox/Camera Uploads"


# TMUX
yayi tmux
mkdir ~/.config/tmux
cp "$MT/tmux/tmux.conf" ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.config/tmux/tmux.conf

# ----------------------------
# Desktop Environment
# ----------------------------

# Wayland
yayi wl-clipboard xorg-xwayland

# Hyprland
yayi hyprland hyprpicker hyprshot hyprlock
# TODO: Sync full directory?
ln -s "$MT/hyprlua" ~/.config/hypr/hyprlua
echo "require(\"hyprlua.load\")" >> ~/.config/hypr/hyprland.lua

# Ask for permissions
yayi polkit-gnome
sudo ln -s /etc/runit/sv/polkit /run/runit/service

# Waybar
yayi waybar
ln -s "$MT/waybar" ~/.config/waybar

# Power Profiles
yayi power-profiles-daemon

# Create the runit service directory
sudo mkdir -p /etc/runit/sv/power-profiles-daemon

# Write the run script as root, with a real newline and correct permissions
sudo tee /etc/runit/sv/power-profiles-daemon/run > /dev/null <<'EOF'
#!/bin/sh
exec /usr/lib/power-profiles-daemon
EOF

sudo chmod +x /etc/runit/sv/power-profiles-daemon/run

# # Enable the service (skip if already linked)
# if [ ! -e /run/runit/service/power-profiles-daemon ]; then
#     sudo ln -s /etc/runit/sv/power-profiles-daemon /run/runit/service/
# else
#     echo "Service already enabled, skipping symlink."
# fi

[[ ! -e /run/runit/service/power-profiles-daemon ]] \
	&& sudo ln -s /etc/runit/sv/power-profiles-daemon /run/runit/service/

# # TODO: Is this right?
# enable_service("power-profiles-daemon")

# SwayOSD
yayi swayosd-git
ln -s "$MT/swayosd" ~/.config/swayosd

# Walker (Application Picker)
yayi walker \
	elephant \
	elephant-bluetooth \
	elephant-calc \
	elephant-clipboard \
	elephant-desktopapplications \
	elephant-files \
	elephant-menus \
	elephant-providerlist \
	elephant-runner \
	elephant-symbols \
	elephant-todo \
	elephant-unicode \
	elephant-websearch

# Fonts
yayi getnf \
	noto-fonts \
	noto-fonts-cjk \
	noto-fonts-emoji

# Download fonts
getnf -i CascadiaMono
getnf -i JetBrainsMono

# TODO: Apply it to alacritty

# wlr-which-key
ln -s "$MT/wlr-which-key" ~/.config/wlr-which-key

# ----------------------------
# Desktop Applications
# ----------------------------

# Various applications
yayi
	# Browser
	brave-bin \
	# Image viewer
	imv \
	# File manager
	nautilus \
	# Share files
	localsend-bin \
	# Notifications
	mako \
	# PDF
	zathura zathura-pdf-mupdf

# TODO:
# zathura mimetype

# Larger applications
yayi \
	# obs-studio \
	obsidian \
	signal-desktop \
	# spotify \
	telegram-desktop \
	# visual-studio-code-bin \
	zoom

# If I have NVIDIA graphics card: hyprwhspr, dkms thing, tesseract

# TODO:
# libnss_nis bitwarden

# TODO: start iwd, dropbox-ignore
#

# TODO:
# zathura mimetype
# neovim mimetype?

# ----------------------------
# Various Tweaks
# ----------------------------

# Symlinks
ln -s "$HOME/Dropbox/Apps/remotely-save/MasterTemple/" ~/Obsidian
ln -s "$HOME/Obsidian/Library/" ~/Library
ln -s "$HOME/Library/Books/PDF/" ~/pdf
ln -s "$HOME/Library/Books/EPUB/" ~/epub
ln -s "$HOME/Dropbox/Development/" ~/Development
ln -s "$HOME/Dropbox/.secret" ~/.secret

