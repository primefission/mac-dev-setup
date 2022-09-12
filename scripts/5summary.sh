#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Creating summary"
# ------------------------------------------------------------------------------

e_success "$(uname -p) Architecture"
if has_path "Developer"; then
  e_success "~/Developer"
else
  e_failure "~/Developer"
fi
if has_path "Sandbox"; then
  e_success "~/Sandbox"
else
  e_failure "~/Sandbox"
fi
test_command "xcode-select"
test_command "brew"
test_command "watchman"
test_command "trash"
test_command "dockutil"
test_command "pyenv"
test_command "git"
test_command "zsh"
test_path ".oh-my-zsh"
test_brew "powerlevel10k"
test_brew "zsh-autosuggestions"
test_brew "zsh-syntax-highlighting"
test_command "node"
test_command "n"
#test_command "nvm"
test_command "yarn"
test_command "pnpm"
test_command "npm"
test_command "serve"
if has_cask "font-jetbrains-mono-nerd-font"; then
  e_success "JetBrains Mono Nerd Font"
else
  e_failure "JetBrains Mono Nerd Font"
fi
test_app "1Password"
test_app "DiffMerge"
test_app "Discord"
test_app "Figma"
test_app "Google Chrome"
test_app "Insomnia"
test_app "iTerm"
test_app "Rectangle"
test_app "Sourcetree"
test_app "Visual Studio Code"
test_app "Warp"
test_app "Zoom.us"

# ------------------------------------------------------------------------------
e_message "Summary complete"
# ------------------------------------------------------------------------------
