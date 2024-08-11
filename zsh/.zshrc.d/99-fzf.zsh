#!/usr/bin/env zsh

if [ -x "$(command -v fzf)" ]; then
  eval "$(fzf --zsh)"
fi
