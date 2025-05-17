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
echo "$info Installing libvirt and virt-manager..."
echo $hr

packages=(
    libvirt       # VM server
    virt-manager  # VM client
    qemu          # Hypervisor
    edk2-ovmf     # Enables UEFI support
    dnsmasq       # For NAT/DHCP networking

    # Spice
    qemu-ui-spice-core
    qemu-ui-spice-app

    # Video drivers
    qemu-hw-display-virtio-gpu
    qemu-hw-display-virtio-gpu-gl
    qemu-hw-display-virtio-gpu-pci
    qemu-hw-display-virtio-gpu-pci-gl
    qemu-hw-display-virtio-vga
    qemu-hw-display-virtio-vga-gl

    # Sound
    qemu-audio-alsa
    qemu-audio-dbus
    qemu-audio-pipewire
    qemu-audio-sdl
    qemu-audio-spice
)
sudo pacman -S --needed ${packages[@]}

# libvirtd uses polkit or user groups by default. Just for references.
# Reference: https://wiki.archlinux.org/title/libvirt#Set_up_authentication
# sed -ie '/#unix_sock_group/s/#//' /etc/libvirt/libvirtd.conf
# sed -ie '/#unix_sock_ro_perms/s/0777/0770/' /etc/libvirt/libvirtd.conf
# sed -ie '/#unix_sock_ro_perms/s/#//' /etc/libvirt/libvirtd.conf
# sed -ie '/#unix_sock_rw_perms/s/#//' /etc/libvirt/libvirtd.conf
# sed -ie '/#auth_unix_ro/s/#//' /etc/libvirt/libvirtd.conf
# sed -ie '/#auth_unix_rw/s/#//' /etc/libvirt/libvirtd.conf

echo ""
echo $hr
echo "$info Adding user to group libvirt..."
echo $hr
sudo usermod -aG libvirt "$USER"

echo ""
echo $hr
echo "$info Enabling libvirtd service..."
echo $hr
sudo systemctl enable libvirtd

echo ""
echo $hr
echo "$success Installation finished"
echo $hr
echo "You may need to restart your session in order to access libvirt session."
