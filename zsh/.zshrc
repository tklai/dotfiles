# Load plugin manager first
if [ -x "$(command -v git)" ]; then
  ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
  [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
  [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
  source "${ZINIT_HOME}/zinit.zsh"

  zinit ice depth=1

  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-completions
  zinit light Aloxaf/fzf-tab
fi

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



# Setup local scripts
if [ -d "$HOME/.local/bin" ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

# Setup local scripts
if [ -d "$HOME/.local/scripts" ]; then
  export PATH=$HOME/.local/scripts:$PATH

  bindkey -s ^f "tmux-sessionizer\n"
fi



# Setup platform
function setup_darwin() {
  # Homebrew
  if [[ -x "$(command -v /opt/homebrew/bin/brew)" && "$(arch)" = "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x "$(command -v /usr/local/bin/brew)" && "$(arch)" = "i386" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  if [ -d "$HOMEBREW_PREFIX/opt/ruby/bin" ]; then
    export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"
  fi

  if [ -d "$HOMEBREW_PREFIX/opt/openjdk/bin" ]; then
    export PATH="$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH"
  fi

  # Copy with clone
  alias cp="cp -c"

  alias rm="echo Please install 'trash' via homebrew or use full path to use 'rm'"
  if [ -x "$(command -v trash)" ]; then
      alias rm="trash -F"
  fi

  bindkey  "^[[1~"   beginning-of-line
  bindkey  "^[[4~"   end-of-line
  bindkey  "^[[3~"   delete-char
}

function setup_linux() {
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        export MOZ_ENABLE_WAYLAND=1
    fi

    export STEAM_FORCE_DESKTOPUI_SCALING=1.5
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    setup_darwin
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    setup_linux
fi



# Command Alias
## Just in case
alias \:q="exit"
alias q="exit"

## Editor
if [ -x "$(command -v nvim)" ]; then
  export EDITOR=nvim
  export MANPAGER='nvim +Man!'

  alias vi="nvim"
  alias vim="nvim"
else
  export EDITOR=nano
fi

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

## fnm
if [ -x "$(command -v fnm)" ]; then
  eval "$(fnm env --use-on-cd)"
fi

## Terminal
### SSH Fix
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

## FZF
if [ -x "$(command -v fzf)" ]; then
  eval "$(fzf --zsh)"
fi

## Zoxide as cd
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

## Docker
if [ -x "$(command -v docker)" ]; then
  alias dcom="docker compose"

  # Attach container
  function dac() {
    local compose_file=$(find . -maxdepth 1 -name "docker-compose.yml" -o -name "docker-compose.yaml" -o -name "compose.yml" -o -name "compose.yaml" | head -n 1)
    if [ -n "$compose_file" ]; then
        docker compose exec "$1" "${@:2}"
    else
        docker exec -it "$1" "${@:2}"
    fi
  }
fi

if [ -x "$(command -v terraform)" ]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C $(which terraform) terraform
fi



# Private
[ -f "$HOME/.private.config" ] && . "$HOME/.private.config"
[ -f "$HOME/.private.credentials" ] && . "$HOME/.private.credentials"
