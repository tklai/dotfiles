#!/usr/bin/env zsh

if [ -x "$(command -v go)" ]; then
  GOPATH=$HOME/go/bin
  if [ -d "$GOPATH" ]; then
    export PATH="$GOPATH:$PATH"
  fi

  GOROOT=$HOMEBREW_PREFIX/opt/go/libexec/bin
  if [ -d "$GOROOT" ]; then
    export PATH="$GOROOT:$PATH"
  fi
fi
