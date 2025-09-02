These configs go hand-in-hand with Omarchy, I'm just keeping it separate so I can receive updates


### Setup

```bash
git clone https://github.com/MasterTemple/dotfiles --depth 1 ~/.local/share/mastertemple/
cd ~/.local/share/mastertemple/
chmod +x setup.sh
./setup.sh
```

### Download

Make this directory accessible as `~/.local/share/mastertemple/`

```bash
git clone https://github.com/MasterTemple/dotfiles --depth 1 ~/.local/share/mastertemple/
```

### `bash`

Add this to `~/.bashrc`

```bash
source ~/.local/share/mastertemple/bash/rc
```

### `hypr`

Add this to `~/.config/hypr/hyprland.conf`

```bash
source = ~/.local/share/mastertemple/hypr/load.conf
```

### `tmux`

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.config/tmux/tmux.conf
```

If you have issues, try running

```bash
~/.tmux/plugins/tpm/bin/install_plugins
```


### `nvim`

See [`MasterTemple/kickstart.nvim`](https://github.com/MasterTemple/kickstart.nvim) as this warrants a separate repository

### `plymouth`

My login screen: [arch-mac-style](https://www.pling.com/p/2106821)

Download, extract, and copy into `/usr/share/plymouth/themes/`

Set as default theme with `sudo plymouth-set-default-theme -R arch-mac-style` (this didn't change on screen, only off screen)

```bash
sudo plymouth-set-default-theme arch-mac-style -R
```
