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

# *nix
# XDG User Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

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

# OS-specific
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Homebrew location
    export HOMEBREW_PREFIX=$(brew --prefix)
fi

# Private
source $HOME/.credentials
