#!/usr/bin/env bash

error="$(tput setaf 1)[ERROR]$(tput sgr0)"
success="$(tput setaf 2)[SUCCESS]$(tput sgr0)"
warning="$(tput setaf 3)[WARNING]$(tput sgr0)"
info="$(tput setaf 4)[INFO]$(tput sgr0)"
hr="=========================================="

packages=(
    # Core
    fcitx5
    fcitx5-configtool
    fcitx5-gtk
    fcitx5-qt

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

print_head "info" "Checking if KDE is installed..."
grep kde-desktop < <(sudo dnf group list --installed)
if [ $? -ne 0 ]; then
    print_head "info" "KDE is not installed."

    packages+=(
        fcitx5-autostart
    )
else
    print_head "info" "KDE is installed."

    packages+=(
        kcm-fcitx5
    )
fi

print_head "info" "Installing fcitx5..."

sudo dnf install ${packages[@]}

print_head "success" "All done!"
