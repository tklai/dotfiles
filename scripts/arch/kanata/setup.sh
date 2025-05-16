#!/bin/bash

error="$(tput setaf 1)[ERROR]$(tput sgr0)"
success="$(tput setaf 2)[SUCCESS]$(tput sgr0)"
warning="$(tput setaf 3)[WARNING]$(tput sgr0)"
info="$(tput setaf 4)[INFO]$(tput sgr0)"
hr="=========================================="

print_head() {
    echo ""
    echo $hr
    echo "${!1} $2"
    echo $hr
}

if [ -x "$(command -v paru)" ]; then
    AUR_HELPER=paru
elif [ -x "$(command -v yay)" ]; then
    AUR_HELPER=yay
else
    print_head "error" "No AUR helper found."

    exit 1
fi

print_head "info" "Installing kanata..."
$AUR_HELPER -S kanata

print_head "info" "Copying kanata configuration file..."
sudo cp ./kanata.kbd /etc/kanata.kbd

print_head "info" "Enabling kanata via systemctl..."
sudo systemctl enable kanata
sudo systemctl start kanata

print_head "success" "Setup finished."
