#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking applications/casks"
# ------------------------------------------------------------------------------

declare -a cask_name=(
"font-jetbrains-mono-nerd-font"
"font-hack-nerd-font"
)

declare -a cask_desc=(
"JetBrains Mono Nerd Font"
"Font Hack Nerd Font"
)

declare -a app_name=(
"1password"
"diffmerge"
"discord"
"figma"
"google-chrome"
"insomnia"
"iterm2"
"rectangle"
"sourcetree"
"visual-studio-code"
"warp"
"zoom"
)

declare -a app_desc=(
"1Password"
"DiffMerge"
"Discord"
"Figma"
"Google Chrome"
"Insomnia"
"iTerm"
"Rectangle"
"Sourcetree"
"Visual Studio Code"
"Warp"
"Zoom.us"
)

if has_command "brew"; then
  for i in "${!cask_name[@]}"; do
    DESC=${cask_desc[$i]}
    NAME=${cask_name[$i]}
    test_cask "$NAME"
    if ! has_cask "$NAME"; then
      get_consent "Install $DESC"
      if has_consent; then
        e_pending "Installing $NAME"
        brew install --cask $NAME
        test_cask "$DESC"
      fi
    fi
  done
  for i in "${!app_name[@]}"; do
    DESC=${app_desc[$i]}
    NAME=${app_name[$i]}
    test_app "$DESC"
    if ! has_app "$DESC"; then
      get_consent "Install $DESC.app"
      if has_consent; then
        e_pending "Installing $NAME"
        brew install --cask $NAME
        test_app "$DESC"
      fi
    fi
  done
fi

# ------------------------------------------------------------------------------
e_message "Applications/Casks complete"
# ------------------------------------------------------------------------------
