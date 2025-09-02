MT=~/.local/share/mastertemple

# bashrc
echo "source ~/.local/share/mastertemple/bash/rc" >> ~/.bashrc

# Television
cargo install cargo-binstall
cargo binstall television
tv update-channels

# hyprland
echo "source = ~/.local/share/mastertemple/hypr/load.conf" >> ~/.config/hypr/hyprland.conf

# Waybar
cp "$MT/waybar/config.jsonc" ~/.config/waybar
cp "$MT/waybar/style.css" ~/.config/waybar

# starship
cp "$MT/starship/starship.toml" ~/.config/starship.toml

# Swayosd
cp "$MT/swayosd/config.toml" ~/.config/swayosd
cp "$MT/swayosd/style.css" ~/.config/swayosd

# Neovim
if [ -d ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.bak
fi
git clone https://github.com/MasterTemple/kickstart.nvim ~/.config/nvim

# TMUX
yay -S tmux
mkdir ~/.config/tmux
cp "$MT/tmux/tmux.conf" ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.config/tmux/tmux.conf
