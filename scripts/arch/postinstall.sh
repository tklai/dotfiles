#!/bin/bash

error="$(tput setaf 1)[ERROR]$(tput sgr0)"
success="$(tput setaf 2)[SUCCESS]$(tput sgr0)"
warning="$(tput setaf 3)[WARNING]$(tput sgr0)"
info="$(tput setaf 4)[INFO]$(tput sgr0)"

# Check it is ArchLinux and exit the script if it is not
if [ ! -f /etc/arch-release ]; then
    echo ""
    echo "$error This script is only for ArchLinux."
    echo ""
    exit 1
fi

# Prompt the user to enter the password for further sudo use
echo ""
echo "Please enter your password for sudo use."
echo ""
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
echo ""
echo "$info Updating package list..."
echo ""
sudo pacman -Sy

# Install essential packages
echo ""
echo "$info Installing essential packages..."
echo ""
sudo pacman -S ${essentials[@]}

# Install fonts
echo ""
echo "$info Installing fonts..."
echo ""
sudo pacman -S ${fonts[@]}

# Install GUI packages
echo ""
echo "$info Installing GUI packages..."
echo ""
sudo pacman -S ${guis[@]}

# Check r8168 is required for the network card
if [[ -n "$(lspci | grep -i ethernet | grep -i realtek | grep -i 8168)" ]]; then
    echo ""
    echo "$info Installing r8168 for the network card..."
    echo ""
    sudo pacman -S r8168
    sudo echo "blacklist r8169" > /etc/modprobe.d/blacklist_r8169.conf
    sudo mkinitcpio -p linux
fi

# Install yay
echo ""
echo "$info Installing yay..."
echo ""
sudo pacman -S --needed base-devel
mkdir -p ~/Tools
cd ~/Tools
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo ""
echo "$success All done!"
echo ""
