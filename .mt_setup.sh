# Pre-requisites
# Install:
#		Nvim
#		NerdFont (FiraCode)
#		Apps
	#		CopyQ
	#		Discord
	#		Spotify
	#		Brave
	#			Surfing Keys
	#			Video Speed Controller (https://github.com/igrigorik/videospeed)
	#		GitHub desktop?
#	
#		Git
#		Node
#		python
#		fzf
#		ripgrep
#		fonts
#		Tmux
#		TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
tmux source ~/.config/tmux/tmux.conf

# Bash and Tmux Configuration
git clone https://github.com/MasterTemple/dotfiles ~/dotfiles
cp -r ~/dotfiles/* ~/
rm -rf ~/dotfiles

# Nvim Configuration
git clone https://github.com/MasterTemple/NvChad ~/.config/nvim --depth 1 && nvim

# Color scheme
bash -c "$(wget -qO- https://git.io/vQgMr)"
