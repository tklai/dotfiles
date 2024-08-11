#!/usr/bin/env zsh

if [ -d ~/.zshrc.d ]; then
    for rc in ~/.zshrc.d/*; do
        . "$rc"
    done
fi

# Private
[ -f "$HOME/.private.config" ] && . "$HOME/.private.config"
[ -f "$HOME/.private.credentials" ] && . "$HOME/.private.credentials"
