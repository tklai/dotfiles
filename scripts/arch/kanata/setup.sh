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
msg_info "Installing kanata..."
$AUR_HELPER -S kanata

echo
msg_info "Copying kanata configuration file..."
sudo cp ./kanata.kbd /etc/kanata.kbd

echo
msg_info "Enabling kanata via systemctl..."
sudo systemctl enable --now kanata

echo
msg_success "Setup finished."
