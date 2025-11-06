#!/usr/bin/env zsh

COMPOSER_BIN_PATH=$HOME/.composer/vendor/bin
if [ -d $COMPOSER_BIN_PATH ]; then
    export PATH="$COMPOSER_BIN_PATH:$PATH"
fi
