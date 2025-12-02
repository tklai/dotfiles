#!/usr/bin/env bash

set -xe

sudo tee /etc/yum.repos.d/microsoft-visual-studio-code.repo <<EOF
[microsoft-visual-studio-code]
name=Microsoft Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
enabled=1
EOF

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install code
