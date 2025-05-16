#!/usr/bin/env zsh

PATH_RUSTUP="$HOMEBREW_PREFIX/opt/rustup/bin"
if [ -d "$PATH_RUSTUP" ]; then
    export PATH="$PATH_RUSTUP:$PATH"
fi
