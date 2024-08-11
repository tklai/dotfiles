#!/usr/bin/env zsh

if [ "$TERM" = "xterm-kitty" ]; then
    # SSH Fix
    alias ssh="kitty +kitten ssh"
fi
