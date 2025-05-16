#!/usr/bin/env zsh

# If fnm is not installed as system pacakge, append the path to execution path.
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
fi

# This should look for the executable from all paths, including newly appended
# path and system installed path.
if [ -x "$(command -v fnm)" ]; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi
