#!/usr/bin/env zsh

EXECUTABLE_LS="ls --color=auto"
if [ -x "$(command -v eza)" ]; then
  EXECUTABLE_LS="eza"
fi
alias ls="$EXECUTABLE_LS"
alias ll="$EXECUTABLE_LS -l"
alias la="$EXECUTABLE_LS -la"
alias lt="$EXECUTABLE_LS --sort=time"
alias lat="$EXECUTABLE_LS -la --sort=time"
