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

# bootstrap
bootstrap() {
	install_yay
	install_packages
	tmux_setup
	fish_omf
}

# Install yay
install_yay() {
	if ! command -v yay &>/dev/null; then
		echo "============================"
		echo "Installing yay"
		echo "============================"
		mkdir ~/tmp
		git clone https://aur.archlinux.org/yay.git ~/tmp/yay
		cd ~/tmp/yay && makepkg -si --noconfirm
		rm -rf ~/tmp/yay
	else
		echo "============================"
		echo "yay is already installed"
		echo "============================"
	fi
}

# Install packages from AUR
install_packages() {
	echo "============================"
	echo "Installing AUR packages"
	echo "============================"
	yay -S --needed \
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
	echo "====================="
	echo "TMUX Setup"
	echo "====================="
	TMUX_CONF=~/.tmux.conf
	TPM=~/.tmux/plugins/tmp
	if [ -d "$TMP" ]; then
		echo ":: Begin install Tmux TPM"
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi

	if [ -f "$TMUX_CONF" ]; then
		echo ":: $TMUX_CONF does exist."
		mv $TMUX_CONF $TMUX_CONF.bak
		echo ":: Backup to $TMUX_CONF.bak"
		stow tmux
		echo ":: Tmux config setup successfully"
	else
		echo ":: $TMUX_CONF does not exist."
		stow tmux
		echo ":: Tmux config setup successfully"
	fi

}

# fish and oh my fish config
fish_omf() {
	echo "====================="
	echo "Fish and OMF Setup"
	echo "====================="
	FISH_DIR=~/.config/fish
	OMF_DIR=~/.config/omf
	if [ -d "$FISH_DIR" ]; then
		echo ":: $FISH_DIR does exist."
		mv $FISH_DIR $FISH_DIR.bak
		echo ":: Backup to $FISH_DIR.bak"
		if ! command -v yay &>/dev/null; then
			echo ":: Oh My Fish does not exist"
			mkdir ~/tmp/omf_install
			curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install >~/tmp/omf_install/install
			fish ~/tmp/omf_install/install --path=~/.local/share/omf --config=~/.config/omf
		else
			echo ":: Oh My Fish does exist"
		fi
		if [ -d "$OMF_DIR" ]; then
			echo ":: $OMF_DIR does exist."
			rm -rf $OMF_DIR
		fi
		stow fish
		echo ":: Created symlink for fish and omf"
	else
		echo ":: $FISH_DIR does not exist."
		if [ ! -d "$OMF_DIR" ]; then
			echo ":: Oh My Fish does not exist"
			mkdir ~/tmp/omf_install
			curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install >~/tmp/omf_install/install
			fish ~/tmp/omf_install/install --path=~/.local/share/omf --config=~/.config/omf
		else
			echo ":: Oh My Fish does exist"
		fi
		mv $OMF_DIR $OMF_DIR.bak
		echo ":: Backup to $OMF_DIR.bak"
		stow fish
		echo ":: Created symlink for fish and omf"
	fi
}

bootstrap
