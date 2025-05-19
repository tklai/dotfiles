#!/usr/bin/env bash

error="$(tput setaf 1)[ERROR]$(tput sgr0)"
success="$(tput setaf 2)[SUCCESS]$(tput sgr0)"
warning="$(tput setaf 3)[WARNING]$(tput sgr0)"
info="$(tput setaf 4)[INFO]$(tput sgr0)"
hr="=========================================="

virt=(
    virt-manager
)

docker=(
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
)

print_head() {
    echo ""
    echo $hr
    echo "${!1} $2"
    echo $hr
}

print_head "info" "Please enter your password for sudo use."
sudo -v

print_head "info" "Installing virt-manager"
sudo dnf install ${virt[@]}

print_head "success" "Virtual Machine Manager done!"

print_head "info" "Populating Docker Repo..."
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

print_head "info" "Installing Docker..."
sudo dnf install ${docker[@]}

print_head "info" "Starting Docker via systemd..."
sudo systemctl enable --now docker

print_head "info" "Adding $(whoami) to Docker group..."
sudo usermod -aG docker $(whoami)

print_head "success" "Docker done!"

print_head "success" "All done!"
