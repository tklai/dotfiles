#!/usr/bin/env zsh

# FNM
# If fnm is not installed as system package, append the path to execution path.
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
fi

# This should look for the executable from all paths, including newly appended
# path and system installed path.
if hash fnm 2>/dev/null; then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi

# Volta
if hash volta 2>/dev/null; then
    export PATH="$HOME/.volta/bin:$PATH"
fi
