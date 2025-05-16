#!/usr/bin/env zsh

if [ "$TERM" = "xterm-ghostty" ]; then
    # SSH Fix
    alias ssh="TERM=xterm-256color ssh"
fi
