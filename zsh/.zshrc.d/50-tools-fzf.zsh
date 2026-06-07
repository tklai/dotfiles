#!/usr/bin/env zsh

if hash fzf 2>/dev/null; then
    eval "$(fzf --zsh)"
fi
