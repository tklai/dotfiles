#!/usr/bin/env zsh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        export MOZ_ENABLE_WAYLAND=1
    fi

    export STEAM_FORCE_DESKTOPUI_SCALING=1.5

    if [[ -z "${SSH_CONNECTION}" ]]; then
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
    fi
fi
