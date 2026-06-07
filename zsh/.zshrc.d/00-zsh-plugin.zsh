#!/usr/bin/env zsh

ENABLE_ZINIT=0
LOADED_ZINIT=0

if [ "$ENABLE_ZINIT" -eq 1 ] && hash git 2>/dev/null; then
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
    [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
    [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    source "${ZINIT_HOME}/zinit.zsh"

    zinit ice depth=1

    zinit ice wait lucid
    zinit light zsh-users/zsh-syntax-highlighting
    zinit ice wait lucid
    zinit light zsh-users/zsh-completions
    zinit ice wait lucid
    zinit light Aloxaf/fzf-tab

    # Config from Aloxaf/fzf-tab
    zstyle ':completion:*:git-checkout:*' sort false
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' menu no
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
    zstyle ':fzf-tab:*' switch-group '[' ']'

    LOADED_ZINIT=1
fi

export LOADED_ZINIT
