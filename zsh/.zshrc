# Setup local scripts
if [ -d "$HOME/.local/bin" ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

# Setup local scripts
if [ -d "$HOME/.local/scripts" ]; then
  export PATH=$HOME/.local/scripts:$PATH

  bindkey -s ^f "tmux-sessionizer\n"
fi

setup_darwin () {
  # Homebrew
  if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ "$(arch)" = "i386" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  # Copy with clone
  alias cp="cp -c"

  alias rm="echo Please install 'trash' via homebrew or use full path to use 'rm'"
  if [ -x "$(command -v trash)" ]; then
      alias rm="trash -F"
  fi
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    setup_darwin
fi

# Editor
if [ -x "$(command -v nvim)" ]; then
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'

  alias vi="nvim"
  alias vim="nvim"
  alias neovim="nvim"
else
  export EDITOR=vim
fi

# Command Alias
## Directory Listing
EXECUTABLE_LS="ls --color=auto"
if [ -x "$(command -v exa)" ]; then
    EXECUTABLE_LS="exa"
fi
alias ls="$EXECUTABLE_LS"
alias ll="$EXECUTABLE_LS -l"
alias la="$EXECUTABLE_LS -la"
alias lt="$EXECUTABLE_LS --sort=time"
alias lat="$EXECUTABLE_LS -la --sort=time"

if [ -x "$(command -v fnm)" ]; then
  eval "$(fnm env --use-on-cd)"
fi

if [ -x "$(command -v starship)" ]; then
  eval "$(starship init $0[2,-1])"
fi

# Terminal
## SSH Fix
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# ZSH
SYNTAX_HIGHLIGHTING_PATH=/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$SYNTAX_HIGHLIGHTING_PATH" ] && . "$SYNTAX_HIGHLIGHTING_PATH"

# Private
[ -f "$HOME/.private.config" ] && . "$HOME/.private.config"
[ -f "$HOME/.private.credentials" ] && . "$HOME/.private.credentials"
