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

# Command Alias
## Directory Listing
EXECUTABLE_LS="ls"
if hash exa 2>/dev/null; then
    EXECUTABLE_LS="exa"
fi
alias ls="$EXECUTABLE_LS"
alias ll="$EXECUTABLE_LS -l"
alias la="$EXECUTABLE_LS -la"
alias lt="$EXECUTABLE_LS --sort=time"
alias lat="$EXECUTABLE_LS -la --sort=time"

## Text editor
if hash nvim 2>/dev/null; then
    alias vi="nvim"
    alias vim="nvim"
    alias neovim="nvim"
fi

# Docker
if hash docker 2>/dev/null; then
    alias dattach="docker exec -it"
fi

# Terminal
## SSH Fix
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

## Eoxide
if hash zoxide 2>/dev/null; then
    eval "$(zoxide init zsh)"
fi

if hash exa 2>/dev/null; then
    export MANPAGER="nvim +Man!"
fi

# Private
[ -s "$HOME/.private.credentials" ] && . "$HOME/.private.credentials"
