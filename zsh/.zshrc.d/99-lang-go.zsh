#!/usr/bin/env zsh

if hash go 2>/dev/null; then
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
