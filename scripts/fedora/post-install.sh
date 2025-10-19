#!/usr/bin/env bash

set -x

sudo -v

CHASSIS=$(hostnamectl chassis)

# Remove libreoffice
sudo dnf remove @libreoffice
sudo dnf remove libreoffice-core

# Remove unwanted games
sudo dnf remove kmahjongg kmines kpat

sudo dnf install @development-tools

sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable wezfurlong/wezterm-nightly

# PACKAGES_NIRI=(
#     niri
#     dunst
#     fuzzel
#     waybar
#
#     hypridle
#     hyprlock
#     swww
# )
#
# sudo dnf install --skip-unavailable ${PACKAGES_NIRI[@]}

PACKAGES_DESKTOP=(
    # Must-have
    git
    lazygit
    stow
    tmux
    zsh
    p7zip
    p7zip-plugins
    unrar
    vim     # Not installed by default
    neovim
    wezterm

    # IME
    ibus-cangjie

    # Monitoring
    htop
    btop
    fastfetch

    # Hardware Controls
    blueman
    pavucontrol
)

sudo dnf install --skip-unavailable ${PACKAGES_DESKTOP[@]}

PACKAGES_LAPTOP=(
    brightnessctl
)

if [ $CHASSIS == 'laptop' ]; then
    sudo dnf install ${PACKAGES_LAPTOP[@]}
fi
