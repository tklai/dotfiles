#!/usr/bin/env zsh

# Setup local bin
LOCAL_BIN="$HOME/.local/bin"
if [ -d "${LOCAL_BIN}" ]; then
  export PATH="${LOCAL_BIN}:$PATH"
fi

# Setup local scripts
LOCAL_SCRIPTS="$HOME/.local/scripts"
if [ -d "${LOCAL_SCRIPTS}" ]; then
  export PATH="${LOCAL_SCRIPTS}:$PATH"

  if [ -x "${LOCAL_SCRIPTS}/tmux-sessionizer" ]; then
    bindkey -s ^f "tmux-sessionizer\n"
  fi
fi
