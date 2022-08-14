set fish_greeting ""

set -gx TERM xterm-256color

# XDG
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"

alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

if test -f "/opt/homebrew/bin/brew"
    /opt/homebrew/bin/brew shellenv | source
end

if type -q nvim 
    alias vi nvim
    alias vim nvim
    alias neovim nvim

    set -g EDITOR nvim 
    set -x MANPAGER "nvim +Man!"
end

if type -q docker
    alias dattach "docker exec -it"
end

if type -q zoxide
    zoxide init fish | source
end
