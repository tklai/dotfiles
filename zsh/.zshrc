# .zshrc

# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

LOCAL_SCRIPTS="$HOME/.local/scripts"
if [ -d "${LOCAL_SCRIPTS}" ]; then
    if ! [[ "$PATH" =~ "$HOME/.local/scripts:" ]]; then
        PATH="$HOME/.local/scripts:$PATH"
    fi
fi

export PATH

if [ -x "${LOCAL_SCRIPTS}/tmux-sessionizer" ]; then
    bindkey -s ^f "tmux-sessionizer\n"
fi

if [ -d ~/.zshrc.d ]; then
    for rc in ~/.zshrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Private
[ -f "$HOME/.private.config" ] && . "$HOME/.private.config"
[ -f "$HOME/.private.credentials" ] && . "$HOME/.private.credentials"
