#!/usr/bin/env zsh

alias \:q="exit"
alias q="exit"

EXECUTABLE_LS="ls --color=auto"
alias ls="$EXECUTABLE_LS"
alias ll="$EXECUTABLE_LS -l"
alias la="$EXECUTABLE_LS -la"
alias lt="$EXECUTABLE_LS --sort=time"
alias lat="$EXECUTABLE_LS -la --sort=time"
