#!/usr/bin/env zsh

if hash nvim 2>/dev/null; then
    export EDITOR=nvim
    export MANPAGER='nvim +Man!'

    alias vi="nvim"
    alias vim="nvim"
else
    export EDITOR=nano
fi
