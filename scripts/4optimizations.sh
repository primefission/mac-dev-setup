#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Running optimizations"
# ------------------------------------------------------------------------------

get_consent "Re-sort Launchpad applications"
if has_consent; then
  e_pending "Re-sorting Launchpad applications"
  defaults write com.apple.dock ResetLaunchPad -boolean true
  killall Dock
fi

get_consent "Finder and Safari defaults"
if has_consent; then
  e_pending "Setting Finder defaults"
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1
  e_pending "✔ Finder: Set tap to click on trackpad"
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  e_pending "✔ Finder: Disable the warning when changing a file extension"
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  e_pending "✔ Finder: Show the ~/Library folder"
  chflags nohidden ~/Library
  e_pending "✔ Safari show status bar"
  #https://gist.github.com/alanzeino/42b6d983c7aa2f29d64ea2749621f7cf
  defaults write com.apple.Safari ShowOverlayStatusBar -bool true
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  killall Dock
fi


get_consent "Cleaning up dock"
if has_consent; then
  e_pending "Cleaning up dock"
  defaults write com.apple.dock tilesize -int 32; killall Dock
  dockutil --remove all
  dockutil --add /Applications/Safari.app
  dockutil --add "/Applications/Visual Studio Code.app"
fi

get_consent "Create Dock spacers"
if has_consent; then
  e_pending "Creating Dock spacers"
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  killall Dock
fi

if has_command "zsh"; then
  if has_path ".oh-my-zsh"; then
    get_consent "Update oh-my-zsh"
    if has_consent; then
      e_pending "Updating oh-my-zsh"
      $ZSH/tools/upgrade.sh
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "brew"; then
  get_consent "Optimize Homebrew"
  if has_consent; then
    e_pending "Running brew update"
    brew update
    e_pending "Running brew upgrade"
    brew upgrade
    e_pending "Running brew doctor"
    brew doctor
    e_pending "Running brew cleanup"
    brew cleanup
  fi
fi

# ------------------------------------------------------------------------------
e_message "Optimizations complete"
# ------------------------------------------------------------------------------
