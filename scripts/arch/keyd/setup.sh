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

print_head "info" "Installing keyd..."
yay -S keyd

print_head "info" "Checking user is in 'input' group..."
groups | grep -i keyd > /dev/null
if [ $? -ne 0 ]; then
    print_head "info" "User is not in group. Adding the user into 'keyd'"
    sudo usermod -aG keyd "$USER"
else
    print_head "info" "User is in group."
fi

print_head "info" "Copying keyd configuration file..."
sudo cp ./default.conf /etc/keyd

print_head "info" "Enabling keyd via systemctl..."
sudo systemctl enable keyd
sudo systemctl start keyd

print_head "success" "Setup finished."
