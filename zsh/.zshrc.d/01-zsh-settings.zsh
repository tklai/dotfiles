#!/usr/bin/env zsh

autoload -Uz compinit
compinit

# Z-shell settings
# Keep Emacs mode in shell. Vi mode breaks sometimes.
bindkey -e

# Prevent meta+backspace from deleting the entire path
autoload -U select-word-style
select-word-style bash

## History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# When the system runs the command longer than REPORTTIME, the shell will print
# the elasped time.
REPORTTIME=60
TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'

## Better Prompt for me
function git_status() {
    GITSTATUS=$(git status -sb --untracked-files=no --ignore-submodules 2> /dev/null | awk '
    /^##/ { split(substr($0, 4), branches, /\.\.\./); branch = branches[1] }
    /^[[:space:]]+[A-Z]/ { count += gsub(/[[:upper:]]/, "", $1) }
    END { if (count > 0) printf("%s *%d", branch, count); else printf("%s", branch)}
    ')
    if [ "$GITSTATUS" != "" ]; then
        echo " $GITSTATUS"
    fi
}

function precmd() {
  if [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
    echo ""
  else
    NEW_LINE_BEFORE_PROMPT=1
  fi

  PROMPT="%F{204}%n%f@%F{244}%M%f:%F{40}%(5~|%-1~/…/%3~|%4~)%f $(git_status) "$'\n'"%F{250}(%?)%f %# "
  RPROMPT="[%D{%Y-%m-%d %H:%M:%S}]"
}
