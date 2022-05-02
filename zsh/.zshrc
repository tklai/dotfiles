# Zshell
# Enable colors by default (?)
autoload -U colors
colors

## Remove duplicated value from the specified variables (?)
## Ref: https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html
typeset -U path

## History
HISTSIZE=20000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=30000000

# When the system runs the command longer than REPORTTIME, the shell will print
# the elasped time.
REPORTTIME=15
TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'

NEWLINE=$'\n'
PROMPT="${NEWLINE}%F{204}%n%f@%F{248}%M%f [%D %*] %F{123}%~%f${NEWLINE}%# "

export VISUAL="nvim"

# Command Alias
## ls
alias ll="ls -l"
alias la="ls -la"
alias lt="ls --sort=time"
alias lat="ls -la --sort=time"

## Text editor
alias vi="nvim"
alias vim="nvim"
alias neovim="nvim"

## SSH Fix
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# Private
[ -s "$HOME/.private.credentials" ] && . "$HOME/.private.credentials"
