#!/usr/bin/env bash

if [ -f "/sys/devices/system/cpu/intel_pstate/no_turbo" ]; then
    echo "Found Intel..."
    
    if [ -x "$(command -v systemctl)" ]; then
        echo "Adding conf to disable Intel Turbo Boost on boot with systemd."
        echo 'w /sys/devices/system/cpu/intel_pstate/no_turbo - - - - 1' | sudo tee /etc/tmpfiles.d/disable-intel-turbo-boost.conf
    fi
else
    echo "Team AMD!"
fi
