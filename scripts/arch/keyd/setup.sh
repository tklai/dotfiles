#!/usr/bin/env bash

set -euo pipefail

msg_hr()      { echo "=========================================="; }
msg_error()   { echo -e "$(tput setaf 1)[ERROR]$(tput sgr0) $*"; }
msg_success() { echo -e "$(tput setaf 2)[SUCCESS]$(tput sgr0) $*"; }
msg_warning() { echo -e "$(tput setaf 3)[WARNING]$(tput sgr0) $*"; }
msg_info()    { echo -e "$(tput setaf 4)[INFO]$(tput sgr0) $*"; }

if [ -x "$(command -v paru)" ]; then
    AUR_HELPER=paru
elif [ -x "$(command -v yay)" ]; then
    AUR_HELPER=yay
else
    echo
    msg_error "No AUR helper found."

    exit 1
fi

echo
msg_info "Installing keyd..."
$AUR_HELPER -S keyd

echo
msg_info "Checking user is in 'input' group..."
groups | grep -i keyd > /dev/null
if [ $? -ne 0 ]; then
    echo
    msg_info "User is not in group. Adding the user into 'keyd'"
    sudo usermod -aG keyd "$USER"
else
    echo
    msg_info "User is in group."
fi

echo
msg_info "Copying keyd configuration file..."
sudo cp ./default.conf /etc/keyd

echo
msg_info "Enabling keyd via systemctl..."
sudo systemctl enable --now keyd

echo
msg_success "Setup finished."
