# XDG User Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

## History
HISTSIZE=20000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=30000000
HISTDUP=erase
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# When the system runs the command longer than REPORTTIME, the shell will print
# the elasped time.
REPORTTIME=60
TIMEFMT='%J  %*U user %*S system %P cpu (%*E wasted time).'

# Keep Emacs mode in shell. Vi mode breaks sometimes.
bindkey -e

# Just in case
alias \:q="exit"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Copy with clone
    alias cp="cp -c"

    alias rm="echo Please install 'trash' via homebrew or use full path to use 'rm'"
    if [ -x "$(command -v trash)" ]; then
        alias rm="trash -F"
    fi
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi
