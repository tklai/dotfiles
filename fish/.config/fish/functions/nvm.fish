function nvm
    switch (uname)
        case "Darwin"
            set -q NVM_DIR || set -g NVM_DIR "$HOME/.nvm"
            set -q NVM_SCRIPT_DIR || set -g NVM_SCRIPT_DIR "$HOMEBREW_PREFIX/opt/nvm"
        case "Linux"
            set -q NVM_DIR || set -g NVM_DIR "$XDG_CONFIG_HOME/nvm"
            set -q NVM_SCRIPT_DIR || set -g NVM_SCRIPT_DIR NVM_DIR
        case '*'
            return 127
    end

    bass source $NVM_SCRIPT_DIR/nvm.sh --no-use ';' nvm $argv
end
