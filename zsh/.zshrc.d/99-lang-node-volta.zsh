#!/usr/bin/env zsh

if [ -x "$(command -v volta)" ]; then
  export PATH="$HOME/.volta/bin:$PATH"
fi
