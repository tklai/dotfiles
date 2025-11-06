#!/usr/bin/env zsh

case "$TERM" in
    "xterm-ghostty")
        alias ssh="TERM=xterm-256color ssh"
        ;;
    "xterm-kitty")
        alias ssh="kitty +kitten ssh"
        ;;
esac
