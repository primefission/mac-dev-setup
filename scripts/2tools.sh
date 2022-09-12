#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking tools"
# ------------------------------------------------------------------------------

if has_command "brew"; then
  if ! has_command "watchman"; then
    e_pending "Installing watchman"
    brew install watchman
    test_command "watchman"
  fi
fi

if has_command "brew"; then
  if ! has_command "trash"; then
    e_pending "Installing trash"
    brew install trash
    test_command "trash"
  fi
fi

if has_command "brew"; then
  if ! has_command "dockutil"; then
    e_pending "Installing dockutil"
    pkg_name=$(curl -s https://api.github.com/repos/kcrawford/dockutil/releases/latest | grep "dockutil-.*\.pkg\"" \
     | head -1| cut -d : -f 2,3 | tr -d \" | tr -d ,| xargs )
    source="https://github.com/kcrawford/dockutil/releases/latest/download/${pkg_name}"
    tempPath="/tmp/dockutil.pkg"
    curl -L --max-redirs 5 -sS "$source" -o "$tempPath"
    sudo installer -pkg "/tmp/dockutil.pkg" -target /
    rm /tmp/dockutil.pkg
    test_command "dockutil"
  fi
fi

#PYTHON----


if has_command "brew"; then
  if ! has_command "pyenv"; then
    e_pending "Installing pyenv"
    echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> ~/.zshrc
    echo '  eval "$(pyenv init -)"' >> ~/.zshrc
    echo 'fi' >> ~/.zshrc
    brew install pyenv
    test_command "pyenv"
  fi
fi

if has_command "pyenv"; then
  e_pending "Installing pyenv python environment"
  pyenv install 3.10.6
  pyenv global 3.10.6
fi

if has_command "brew"; then
  if ! has_command "poetry"; then
    e_pending "Installing poetry"
    brew install poetry
    test_command "poetry"
  fi
fi



if has_command "brew"; then
  if ! has_command "git"; then
    get_consent "Install git"
    if has_consent; then
      e_pending "Installing git"
      brew install git
      test_command "git"
    fi
  fi
fi


if has_command "brew"; then
  if ! has_command "zsh"; then
    get_consent "Install zsh"
    if has_consent; then
      e_pending "Installing zsh"
      brew install zsh
      test_command "zsh"
    fi
  fi
fi

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    get_consent "Install oh-my-zsh"
    if has_consent; then
      e_pending "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "powerlevel10k"; then
    get_consent "Install powerlevel10k (CLI theming)"
    if has_consent; then
      e_pending "Installing powerlevel10k"
      brew install romkatv/powerlevel10k/powerlevel10k
      echo '# Theme configuration: PowerLevel10K' >> ~/.zshrc
      echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
      echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
      echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
      echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc
      test_brew "powerlevel10k"
      p10k configure
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-autosuggestions"; then
    get_consent "Install zsh-autosuggestions"
    if has_consent; then
      e_pending "Installing zsh-autosuggestions"
      brew install zsh-autosuggestions
      echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
      test_brew "zsh-autosuggestions"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-syntax-highlighting"; then
    get_consent "Install zsh-syntax-highlighting"
    if has_consent; then
      e_pending "Installing zsh-syntax-highlighting"
      brew install zsh-syntax-highlighting
      echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc
      echo "# Warning: Must be last sourced!" >> ~/.zshrc
      echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
      test_brew "zsh-syntax-highlighting"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "node"; then
    get_consent "Install node (Node via Homebrew)"
    if has_consent; then
      e_pending "Installing node"
      brew install node
      test_command "node"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "n"; then
    get_consent "Install n (Node via n)"
    if has_consent; then
      e_pending "Installing n"
      brew install n
      test_command "n"
    fi
  fi
fi

if has_command "brew"; then
  if ! [ -d "${HOME}/.nvm/.git" ]; then
    get_consent "Install nvm (Node via nvm)"
    if has_consent; then
      e_pending "Installing nvm"
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
      test_command "nvm"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "yarn"; then
    get_consent "Install yarn"
    if has_consent; then
      e_pending "Installing yarn"
      brew install yarn
      test_command "yarn"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "pnpm"; then
    get_consent "Install pnpm"
    if has_consent; then
      e_pending "Installing pnpm"
      brew install pnpm
      test_command "pnpm"
    fi
  fi
fi

if has_command 'npm'; then
  get_consent "Upgrade npm"
  if has_consent; then
    e_pending "Upgrading npm"
    npm install --location=global npm@latest
    test_command "npm"
  fi
fi

if has_command "npm"; then
  get_consent "Install/Upgrade serve (globally via npm)"
  if has_consent; then
    e_pending "Installing/Upgrading serve"
    npm install --location=global serve@latest
    test_command "serve"
  fi
fi

# Set up Git
get_consent "Setup Git"
if has_consent; then
  e_pending "Set Up Git"
  e_pending "✔ Set Git to store credentials in Keychain"
  git config --global credential.helper osxkeychain

  if [ -n "$(git config --global user.email)" ]; then
      e_pending "✔ Git email is set to $(git config --global user.email)"
  else
      read -p 'What is your Git email address?: ' gitEmail
      git config --global user.email "$gitEmail"
  fi

  if [ -n "$(git config --global user.name)" ]; then
      e_pending "✔ Git display name is set to $(git config --global user.name)"
  else
      read -p 'What is your Git display name (Firstname Lastname)?: ' gitName
      git config --global user.name "$gitName"
  fi
  
  e_pending "✔ Configure git to always ssh when dealing with https github repos"
  git config --global url."git@github.com:".insteadOf https://github.com/
  # you can remove this change by editing your ~/.gitconfig file

  e_pending "✔ Adding github.com to known_hosts file [~/.ssh/known_hosts]"
  mkdir -p ~/.ssh 
  touch ~/.ssh/known_hosts
  touch ~/.ssh/config
  ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
fi

# ------------------------------------------------------------------------------
e_message "Tools complete"
# ------------------------------------------------------------------------------
