#!/bin/bash

# Check it is ArchLinux and exit the script if it is not
if [ ! -f /etc/arch-release ]; then
    echo "This script is only for ArchLinux."
    exit 1
fi

# Prompt the user to enter the password for further sudo use
echo "Please enter your password for sudo use."
sudo -v

essentials=(
    zsh
    htop
    neofetch
    wget
    curl
    git
    vi
    vim
    neovim
    python
    ripgrep
    fzf
    unzip
    p7zip
    ufw
    stow
    exa
    starship
    man-db
)

fonts=(
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd
)

guis=(
    flatpak
    kitty
    firefox
    fcitx5-im
    fcitx5-rime
    librime
    rime-cangjie
    rime-quick
)

# Update package list
echo "Updating package list..."
sudo pacman -Sy

# Install essential packages
echo "Installing essential packages..."
sudo pacman -S ${essentials[@]}

# Install fonts
echo "Installing fonts..."
sudo pacman -S ${fonts[@]}

# Install GUI packages
echo "Installing GUI packages..."
sudo pacman -S ${guis[@]}

# Check r8168 is required for the network card
if [[ -n "$(lspci | grep -i ethernet | grep -i realtek | grep -i 8168)" ]]; then
    echo "Installing r8168 for the network card..."
    sudo pacman -S r8168
    sudo echo "blacklist r8169" > /etc/modprobe.d/blacklist_r8169.conf
    sudo mkinitcpio -p linux
fi

# Install yay
echo "Installing yay..."
sudo pacman -S --needed base-devel
mkdir -p ~/Tools
cd ~/Tools
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "All done!"
