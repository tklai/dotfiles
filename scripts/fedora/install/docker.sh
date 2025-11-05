#!/usr/bin/env bash

set -xe

docker=(
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
)

sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo --overwrite

sudo dnf install ${docker[@]}

sudo systemctl enable --now docker

sudo usermod -aG docker $(whoami)
