#!/usr/bin/env zsh

if [[ "$OSTYPE" == "darwin"* ]]; then
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

  if [ -d "$HOMEBREW_PREFIX/opt/trash/bin" ]; then
      export PATH="$HOMEBREW_PREFIX/opt/trash/bin:$PATH"
      alias rm="trash -F"
  fi

  bindkey  "^[[1~"   beginning-of-line
  bindkey  "^[[4~"   end-of-line
  bindkey  "^[[3~"   delete-char
fi
