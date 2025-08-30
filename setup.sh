MT=~/.local/share/mastertemple

# bashrc
echo "source ~/.local/share/mastertemple/bash/rc" >> ~/.bashrc
# hyprland
echo "source = ~/.local/share/mastertemple/hypr/load.conf" >> ~/.config/hypr/hyprland.conf

# TMUX
cp "$MT/tmux/tmux.conf" ~/.config/tmux/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.config/tmux/tmux.conf

# Waybar
cp "$MT/waybar/config.jsonc" ~/.config/waybar/
cp "$MT/waybar/style.css" ~/.config/waybar/


# Swayosd
cp "$MT/swayosd/config.toml" ~/.config/swayosd/
cp "$MT/swayosd/style.css" ~/.config/swayosd/

# Neovim
if [ -d ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.bak
fi
git clone https://github.com/MasterTemple/kickstart.nvim ~/.config/nvim
