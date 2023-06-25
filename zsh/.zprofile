# XDG User Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

## History
HISTSIZE=20000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=30000000

# When the system runs the command longer than REPORTTIME, the shell will print
# the elasped time.
REPORTTIME=60
TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'

# Keep Emacs mode in shell. Vi mode breaks sometimes.
bindkey -e

# Just in case
alias \:q="exit"
