#!/usr/bin/env zsh

if [ -x "$(command -v nvim)" ]; then
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'

  alias vi="nvim"
  alias vim="nvim"
else
  export EDITOR=nano
fi
