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

print_head "info" "Xremap requires uinput module. Checking..."

lsmod | grep -i uinput > /dev/null
if [ $? -ne 0 ]; then
    print_head "info" "uinput is not loaded. Make it loads."
    echo 'uinput' | sudo tee /etc/modules-load.d/uinput.conf
    echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-input.rules
else
    print_head "info" "uinput is loaded."
fi

print_head "info" "Checking user is in 'input' group..."
groups | grep -i input > /dev/null
if [ $? -ne 0 ]; then
    print_head "info" "User is not in group. Adding the user into 'input'"
    sudo usermod -aG input "$USER"
else
    print_head "info" "User is in group."
fi

print_head "success" "Setup finished"
echo "You may need to restart your session."
