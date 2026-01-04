#!/usr/bin/env bash

set -euo pipefail

msg_hr()      { echo "=========================================="; }
msg_error()   { echo -e "$(tput setaf 1)[ERROR]$(tput sgr0) $*"; }
msg_success() { echo -e "$(tput setaf 2)[SUCCESS]$(tput sgr0) $*"; }
msg_warning() { echo -e "$(tput setaf 3)[WARNING]$(tput sgr0) $*"; }
msg_info()    { echo -e "$(tput setaf 4)[INFO]$(tput sgr0) $*"; }

# Check it is ArchLinux and exit if not
if [[ ! -f /etc/arch-release ]]; then
    msg_error "This script is only for ArchLinux."
    echo
    exit 1
fi

msg_info "You may get a sudo prompt here. Please enter your password if prompted."
sudo -v

echo
msg_info "Installing libvirt and virt-manager..."

packages=(
    libvirt         # Base virtualisation library
    qemu-desktop    # Hypervisor
    dnsmasq         # Networking for NAT

    virt-manager    # VM client
)

sudo pacman -S --needed "${packages[@]}"

if ! pacman -Q firewalld &> /dev/null; then
    echo
    msg_info "Firewalld is not found. Fallback to iptables for firewall backend..."

    sudo pacman -S --needed iptables-nft

    echo "firewall_backend = \"iptables\"" | sudo tee -a "/etc/libvirt/network.conf" > /dev/null
fi

echo
msg_info "Adding user to group libvirt..."
sudo usermod -aG libvirt "$USER"

echo
msg_info "Enabling libvirtd service..."
sudo systemctl enable libvirtd

echo
msg_success "Installation finished"
echo "You may need to restart your session in order to access libvirt session."
