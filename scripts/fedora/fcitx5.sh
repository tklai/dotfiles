#!/usr/bin/env bash

error="$(tput setaf 1)[ERROR]$(tput sgr0)"
success="$(tput setaf 2)[SUCCESS]$(tput sgr0)"
warning="$(tput setaf 3)[WARNING]$(tput sgr0)"
info="$(tput setaf 4)[INFO]$(tput sgr0)"
hr="=========================================="

packages=(
    # Core
    fcitx5
    fcitx5-autostart
    fcitx5-configtool
    fcitx5-gtk
    fcitx5-qt

    kcm-fcitx5

    # Tables
    fcitx5-table-extra
    fcitx5-table-other
    fcitx5-chinese-addons
    fcitx5-mozc
)

print_head() {
    echo ""
    echo $hr
    echo "${!1} $2"
    echo $hr
}

print_head "info" "Please enter your password for sudo use."
sudo -v

print_head "info" "Removing ibus..."
sudo dnf remove ibus

print_head "info" "Installing fcitx5..."

sudo dnf install ${packages[@]}

print_head "success" "All done!"
