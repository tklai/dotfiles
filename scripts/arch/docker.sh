#!/bin/bash

error="$(tput setaf 1)[ERROR]$(tput sgr0)"
success="$(tput setaf 2)[SUCCESS]$(tput sgr0)"
warning="$(tput setaf 3)[WARNING]$(tput sgr0)"
info="$(tput setaf 4)[INFO]$(tput sgr0)"
hr="=========================================="

set -e

# Check it is ArchLinux and exit the script if it is not
if [ ! -f /etc/arch-release ]; then
    echo $hr
    echo "$error This script is only for ArchLinux."
    echo $hr
    echo ""
    exit 1
fi

# Prompt the user to enter the password for further sudo use
echo $hr
echo "$info You may get a sudo prompt here. Please enter your password if prompted."
echo $hr
sudo -v

echo ""
echo $hr
echo "$info Installing docker..."
echo $hr
sudo pacman -S docker docker-compose docker-buildx

echo ""
echo $hr
echo "$info Adding user to group docker..."
echo $hr
sudo usermod -aG docker "$USER"

echo ""
echo $hr
echo "$info Enabling docker service..."
echo $hr
sudo systemctl enable docker

echo ""
echo $hr
echo "$success Installation finished"
echo $hr
echo "You may need to restart your session in order to access docker session."
