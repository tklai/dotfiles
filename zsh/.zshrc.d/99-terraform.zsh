#!/usr/bin/env zsh

if [ -x "$(command -v terraform)" ]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C $(which terraform) terraform
fi
