#!/usr/bin/env zsh

if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi
