# XDG User Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export VISUAL="nvim"

# Command Alias
## exa
alias ls="exa -la"
## Text editor
alias vi="nvim"
alias vim="nvim"
alias neovim="nvim"

# OS-specific
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Homebrew location
    export HOMEBREW_PREFIX=$(brew --prefix)
fi

# asdf
source $(brew --prefix asdf)/libexec/asdf.sh

# Private
source $HOME/.credentials
