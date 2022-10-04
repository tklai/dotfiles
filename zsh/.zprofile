# XDG User Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Editor
if hash nvim 2>/dev/null; then
    export EDITOR=nvim

    export MANPAGER='nvim +Man!'
else
    export EDITOR=vim
fi

# Homebrew
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export HOMEBREW_PREFIX=$(brew --prefix)
fi

export PATH=$HOME/.local/scripts:$PATH

# NVM
export NVM_DIR="$([[ "$OSTYPE" == "darwin"* ]] && printf %s "$HOME/.nvm" || printf %s "$XDG_CONFIG_HOME/nvm")"
export NVM_SCRIPT_DIR="$([[ "$OSTYPE" == "darwin"* ]] && printf %s "$HOMEBREW_PREFIX/opt/nvm" || printf %s "$NVM_DIR")"
[ -s "$NVM_SCRIPT_DIR/nvm.sh" ] && . "$NVM_SCRIPT_DIR/nvm.sh"
[ -s "$NVM_SCRIPT_DIR/etc/bash_completion.d/nvm" ] && . "$NVM_SCRIPT_DIR/etc/bash_completion.d/nvm"

bindkey -s ^f "tmux-sessionizer\n"
