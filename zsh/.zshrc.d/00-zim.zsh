#!/usr/bin/env zsh

ENABLE_ZIM=1
LOADED_ZIM=0

if [ $ENABLE_ZIM -eq 1 ]; then
    ZIM_CONFIG_FILE=~/.config/zsh/zimrc
    ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

    if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
        curl -fsSL --create-dirs \
            -o ${ZIM_HOME}/zimfw.zsh \
            https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    fi

    if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
        source ${ZIM_HOME}/zimfw.zsh init
    fi

    source ${ZIM_HOME}/init.zsh

    LOADED_ZIM=1
fi

export LOADED_ZIM
