#!/usr/bin/env zsh

if [ -x "$(command -v go)" ]; then
    GOPATH=$HOME/go/bin
    if [ -d "$GOPATH" ]; then
        PATH="$GOPATH:$PATH"
    fi

    GOROOT=$HOMEBREW_PREFIX/opt/go/libexec/bin
    if [ -d "$GOROOT" ]; then
        PATH="$GOROOT:$PATH"
    fi

    export PATH
fi
