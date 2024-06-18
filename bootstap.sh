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
echo "============================"
echo "Installing yay"
echo "============================"
mkdir ~/tmp
git clone https://aur.archlinux.org/yay.git ~/tmp/yay
cd ~/tmp/yay && makepkg -si --noconfirm

# Install packages from AUR
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

# Setup tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux
