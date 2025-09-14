#!/bin/bash

set -euo pipefail

msg_hr()      { echo "=========================================="; }
msg_error()   { echo -e "$(tput setaf 1)[ERROR]$(tput sgr0) $*"; }
msg_success() { echo -e "$(tput setaf 2)[SUCCESS]$(tput sgr0) $*"; }
msg_warning() { echo -e "$(tput setaf 3)[WARNING]$(tput sgr0) $*"; }
msg_info()    { echo -e "$(tput setaf 4)[INFO]$(tput sgr0) $*"; }

AUR_HELPER="$(echo ${AUR_HELPER:-'paru'} | tr '[:upper:]' '[:lower:]')"

# Check it is ArchLinux and exit if not
if [[ ! -f /etc/arch-release ]]; then
    msg_error "This script is only for ArchLinux."
    echo
    exit 1
fi

msg_info "You may get a sudo prompt here. Please enter your password if prompted."
sudo -v

echo
msg_info "Adjust pacman configurations before installing packages..."
sudo sed -ie 's/#Color/Color/' /etc/pacman.conf
sudo sed -ie '/Color/a ILoveCandy' /etc/pacman.conf
sudo sed -ie 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf

# This should be enabled in recent archinstall settings
# sudo sed -ie 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

essentials=(
    # System
    zsh
    man-db
    man-pages
    ufw
    wl-clipboard

    # Fuzzy Finders
    ripgrep
    fzf

    # Essentials
    fastfetch
    htop
    curl
    wget
    exa
    git
    git-delta
    gitui
    lazygit
    python
    p7zip
    # zip
    unzip
    stow
    bat
    yq
    zoxide
    tmux

    # Editors
    vi
    vim
    neovim
    nano

    # Useful
    aria2
)

fonts=(
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    ttf-jetbrains-mono-nerd
    ttf-cascadia-mono-nerd
)

guis=(
    # Essentials
    flatpak

    # Terminal
    # ghostty
    # kitty
    wezterm

    # Browser
    firefox
    firefox-i18n-en-us

    # IME
    fcitx5-im
    fcitx5-breeze
    fcitx5-chinese-addons
    fcitx5-mozc
    fcitx5-table-extra
    fcitx5-table-other

    # Players
    vlc
)

aurs=(
    visual-studio-code-bin
)

# Update package list
echo
msg_info "Updating package list..."
sudo pacman -Sy

# Insatll base development tools
echo 
msg_info "Insatlling base development tools..."
sudo pacman -S --needed base-devel git

# Install essential packages
echo
msg_info "Installing essential packages..."
sudo pacman -S --needed ${essentials[@]}

# Install fonts
echo
msg_info "Installing fonts..."
sudo pacman -S --needed ${fonts[@]}

# Install GUI packages
echo
msg_info "Installing GUI packages..."
sudo pacman -S --needed ${guis[@]}

# AUR Helper
if [[ "$AUR_HELPER" == "yay" ]]; then
    if [ -x "$(command -v yay)" ]; then
        echo
        msg_info "yay is installed."
    else
        # Install yay
        echo
        msg_info "Installing yay (yay-bin)..."
        cd /tmp
        git clone --depth=1 https://aur.archlinux.org/yay-bin.git
        cd yay-bin
        makepkg -si
    fi
else
    if [ -x "$(command -v paru)" ]; then
        echo 
        msg_info "paru is installed."
    else 
        # Install paru
        echo
        msg_info "Installing paru (paru-bin)..."
        cd /tmp
        git clone --depth=1 https://aur.archlinux.org/paru-bin.git
        cd paru-bin
        makepkg -si
    fi
fi

# Install GUI packages
echo
msg_info "Installing AUR packages..."
$AUR_HELPER -S --needed ${aurs[@]}

# Check r8168 is required for the network card
if [[ -n "$(lspci | grep -i ethernet | grep -i realtek | grep -i 8168)" ]]; then
    echo
    msg_info "Installing r8168 for the network card..."
    echo
    sudo pacman -S --needed r8168
    sudo echo "blacklist r8169" > /etc/modprobe.d/blacklist_r8169.conf
    sudo mkinitcpio -p linux
fi

# Fix systemd-boot menu resolution
# Seems fixed in recent systemd-boot, previously need to add "console-mode keep" to /boot/loader/loader.conf
# echo
# msg_info "Fix systemd-boot boot menu screen resolution..."
# sudo echo "console-mode keep" >> /boot/loader/loader.conf

# Install plymouth
# echo
# msg_info "Installing plymouth..."
# sudo pacman -S plymouth
# 
# grep -qE ' ?plymouth ?' /etc/mkinitcpio.conf
# if [ $? -ne 0 ]; then
#     echo
#     msg_info "Adding plymouth to mkinitcpio hooks..."
#     sudo sed -ie 's/HOOKS=\([^)]*\)/& plymouth/' /etc/mkinitcpio.conf
# fi
# # Only add `splash` to non-fallback entries
# sudo find /boot/loader/entries/ -type f -name "*linux.conf" -exec sed -i '/^options /s/$/ quiet splash/' {} \;
#
# echo
# msg_info "Rebuilding initrd..."
# sudo mkinitcpio -P

# Install ly
# echo
# msg_info "Installing ly..."
# echo
# sudo pacman -S --needed ly
# sudo find /boot/loader/entries/ -type f -name "*linux*.conf" -exec sed -i '/^options /s/$/ quiet/' {} \;

echo
msg_info "Checking if KDE installed..."
sudo pacman -Qi plasma-desktop > /dev/null
if [ $? -eq 0 ]; then
    echo
    msg_info "KDE installed."

    kde=(
        # Pacman
        discover
        partitionmanager
        ksshaskpass

        # AUR
        # konsave
    )

    echo
    msg_info "Installing remaining KDE applications..."
    $AUR_HELPER -S --needed ${kde[@]}

    mkdir -p $HOME/.config/environment.d
    printf "SSH_ASKPASS=%s\nSSH_ASKPASS_REQUIRE=prefer\n" "$(which ksshaskpass)" | tee $HOME/.config/environment.d/ssh_askpass.conf

    $(dirname "$0")/desktop/kde/config.sh
else
    echo
    msg_info "KDE not installed."
fi

echo
msg_info "Enabling ssh-agent with systemd..."
systemctl --user enable --now ssh-agent

echo
msg_success "All done!"
