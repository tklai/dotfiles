#!/bin/bash

AUR_HELPER="$(echo ${AUR_HELPER:-'paru'} | tr '[:upper:]' '[:lower:]')"

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

echo ""
echo "$info Adjust pacman configurations before installing packages..."
echo ""
sudo sed -ie 's/#Color/Color/' /etc/pacman.conf
sudo sed -ie 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

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
    wl-clipboard
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
sudo pacman -S --needed ${essentials[@]}

# Install fonts
echo ""
echo "$info Installing fonts..."
echo ""
sudo pacman -S --needed ${fonts[@]}

# Install GUI packages
echo ""
echo "$info Installing GUI packages..."
echo ""
sudo pacman -S --needed ${guis[@]}

# Check r8168 is required for the network card
if [[ -n "$(lspci | grep -i ethernet | grep -i realtek | grep -i 8168)" ]]; then
    echo ""
    echo "$info Installing r8168 for the network card..."
    echo ""
    sudo pacman -S --needed r8168
    sudo echo "blacklist r8169" > /etc/modprobe.d/blacklist_r8169.conf
    sudo mkinitcpio -p linux
fi

# AUR Helper
if [[ "$AUR_HELPER" == "yay" ]]; then
    # Install yay
    echo ""
    echo "$info Installing yay (yay-bin)..."
    echo ""
    sudo pacman -S --needed base-devel git
    cd /tmp
    git clone --depth=1 https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
else
    # Install paru
    echo ""
    echo "$info Installing paru (paru-bin)..."
    echo ""
    sudo pacman -S --needed base-devel git
    cd /tmp
    git clone --depth=1 https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
fi

# Fix systemd-boot menu resolution
# Seems fixed in recent systemd-boot, previously need to add "console-mode keep" to /boot/loader/loader.conf
# echo ""
# echo "$info Fix systemd-boot boot menu screen resolution..."
# echo ""
# sudo echo "console-mode keep" >> /boot/loader/loader.conf

# Install plymouth
echo ""
echo "$info Installing plymouth..."
echo ""
sudo pacman -S plymouth
grep -qE ' ?plymouth ?' /etc/mkinitcpio.conf
if [ $? -ne 0 ]; then
    echo ""
    echo "$info Adding plymouth to mkinitcpio hooks..."
    echo ""
    sudo sed -ie 's/HOOKS=\([^)]*\)/& plymouth/' /etc/mkinitcpio.conf
fi
# Only add `splash` to non-fallback entries
sudo find /boot/loader/entries/ -type f -name "*linux.conf" -exec sed -i '/^options /s/$/ quiet splash/' {} \;
echo ""
echo "$info Rebuilding initrd..."
echo ""
sudo mkinitcpio -P

echo ""
echo "$info Checking if KDE installed..."
sudo pacman -Qi plasma-desktop > /dev/null
if [ $? -eq 0 ]; then
    echo ""
    echo "$info KDE installed. Installing konsave via AUR..."
    echo ""
    yay -S konsave
else
    echo ""
    echo "$info KDE not installed."
    echo ""
fi

echo ""
echo "$success All done!"
echo ""
