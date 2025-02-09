#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This script only can be run on 'darwin*' (macOS). You have '$OSTYPE'."
    exit 1
fi

#{{{ Saving

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#}}}

#{{{ Input Device

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 3

#}}}

#{{{ Screen

# Disable LCD Font Smoothing
defaults -currentHost write -g AppleFontSmoothing -int 1

# Screenshots
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Screensaver
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

#}}}

#{{{ Finder

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

#}}}

#{{{ Dock

# Show docker immediately
defaults write com.apple.dock autohide-delay -int 0

# Speed up animations
defaults write com.apple.dock autohide-time-modifier -float 0.25;

#}}}

#{{{ Misc

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Drag windows everywhere by holding control + command
defaults write -g NSWindowShouldDragOnGesture -bool true

#}}}

echo "Configurations have been applied. Please reboot or re-login to take effects."
