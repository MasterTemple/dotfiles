These configs go hand-in-hand with Omarchy, I'm just keeping it separate so I can receive updates


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


### `nvim`

See [`MasterTemple/kickstart.nvim`](https://github.com/MasterTemple/kickstart.nvim) as this warrants a separate repository
