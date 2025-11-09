#!/usr/bin/env bash

set -xe

if [[ "$(ps --no-headers -o comm 1)" != "systemd" ]]; then
    echo "This script is for systemd Linux system."
    exit 1;
fi

SYSTEMD_USER=~/.config/systemd/user

mkdir -p $SYSTEMD_USER

cp ./systemd/xremap.service $SYSTEMD_USER

systemctl --user enable --now xremap
