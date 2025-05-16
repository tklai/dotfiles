#!/usr/bin/env zsh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        export MOZ_ENABLE_WAYLAND=1
    fi

    export STEAM_FORCE_DESKTOPUI_SCALING=1.5
fi
