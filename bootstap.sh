#!/usr/bin/env bash

echo "============================"
echo "Bootstraping Basu Arch Linux"
echo "============================"

# Full update system
sudo pacman -Syu --noconfirm

# Install packages from official repositories
sudo pacman -S --needed --noconfirm \
	base-devel \
	git

# Install yay
installYay() {
	echo "============================"
	echo "Installing yay"
	echo "============================"
	mkdir ~/tmp
	git clone https://aur.archlinux.org/yay.git ~/tmp/yay
	cd ~/tmp/yay && makepkg -si --noconfirm
	rm -rf ~/tmp/yay
}

# Install packages from AUR
pacDepend() {
	echo "============================"
	echo "Installing AUR packages"
	echo "============================"
	yay -S --needed --noconfirm \
		neovim-nightly \
		ttf-jetbrains-mono-nerd \
		alacritty-smooth-cursor-git \
		tmux \
		fish \
		eza \
		thefuck \
		bat \
		maven \
		stow \
		neofetch \
		fzf \
		nodejs \
		npm
}

# Setup tmux config
tmux_setup() {
	echo "=================================="
	TMUX_CONF=~/.tmux.conf
	if [ -f "$TMUX_CONF" ]; then
		echo "$TMUX_CONF does exist."
		mv $TMUX_CONF $TMUX_CONF.bak
		echo "Backup to $TMUX_CONF.bak"
		stow tmux
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		echo "Tmux setup successfully"
	else
		echo "$TMUX_CONF does not exist."
		stow tmux
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		echo "Tmux setup successfully"
	fi
}

# fish and oh my fish
fish_omf() {
	echo "=================================="
	FISH_DIR=~/.config/fish
	if [ -d "$FISH_DIR" ]; then
		echo "$FISH_DIR does exist."
		mv $FISH_DIR $FISH_DIR.bak
		echo "Backup to $FISH_DIR.bak"
	else
		echo "$FISH_DIR does not exist."
	fi
	echo "=================================="
	OMF_DIR=~/.config/omf
	if [ -d "$OMF_DIR" ]; then
		echo "$OMF_DIR does exist."
		mv $OMF_DIR $OMF_DIR.bak
		echo "Backup to $OMF_DIR.bak"
	else
		echo "$OMF_DIR does not exist."
		curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install >install
		fish install --path=~/.local/share/omf --config=~/.config/omf
		echo "Oh my fish Installed"
		sudo rm install
	fi
	stow fish
	echo "Created symlink for fish and omf"
}

installYay
pacDepend
tmux_setup
fish_omf
