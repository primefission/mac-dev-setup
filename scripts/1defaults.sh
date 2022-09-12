#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Creating defaults"
# ------------------------------------------------------------------------------



get_consent "Change mouse direction - needs a logout"
  if has_consent; then
  e_pending "Changing mouse direction"
  defaults write -g com.apple.swipescrolldirection -bool FALSE
fi

#get_consent "Autohide Dock"
#if has_consent; then
#  e_pending "Autohiding Dock"
#  defaults write com.apple.dock autohide -boolean true
#  killall Dock
#fi

get_consent "Display hidden Finder files/folders"
if has_consent; then
  e_pending "Displaying hidden Finder files/folders"
  defaults write com.apple.finder AppleShowAllFiles -boolean true
  killall Finder
fi

if ! has_path "Developer"; then
  get_consent "Create ~/Developer folder"
  if has_consent; then
    e_pending "Creating ~/Developer folder"
    mkdir -p ~/Developer
    test_path "Developer"
  fi
fi

if ! has_path "Sandbox"; then
  get_consent "Create ~/Sandbox folder"
  if has_consent; then
    e_pending "Creating ~/Sandbox folder"
    mkdir -p ~/Sandbox
    test_path "Sandbox"
  fi
fi

if ! has_path "git/powerlevel10k-media"; then
  get_consent "Clone into ~/git/powerlevel10k-media folder"
  if has_consent; then
    e_pending "Creating ~/git/powerlevel10k-media folder"
    git -C ~/git clone https://github.com/romkatv/powerlevel10k-media.git 
    test_path "git/powerlevel10k-media"
  fi
fi

if ! has_command "xcode-select"; then
  e_pending "Installing xcode-select (CLI tools)"
  xcode-select --install
  test_command "xcode-select"
fi

if ! has_command "brew"; then
  e_pending "Installing brew (Homebrew)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if has_arm; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'>>$HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew doctor
  brew tap homebrew/cask-fonts
  test_command "brew"
fi

get_consent "Expand save and print panel by default"
  if has_consent; then
    e_pending "✔ General: Expand save and print panel by default"
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
  fi

get_consent "Remove press and hold keys"
if has_consent; then
    e_pending "✔ Typing: Disable press-and-hold for keys in favor of key repeat"
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  fi
        

# ------------------------------------------------------------------------------
e_message "Defaults complete"
# ------------------------------------------------------------------------------
