# Mac dev setup

> A macOS setup guide specific to front-end development.

## Guided Setup

For a guided setup, open up **Terminal.app** and run the following command:

1. Save repo to `~/git` folder:
   ```sh
   mkdir ~/git
   git clone https://github.com/primefission/mac-dev-setup.git ~/git/mac-dev-setup && \
   cd ~/git/mac-dev-setup/scripts
   ```
2. Run the installer script.
   ```sh
   sh install.sh
   ```
   **OR** Run the installer scripts individually:
   ```sh
   sh defaults.sh
   sh tools.sh
   sh casks.sh
   sh optimizations.sh
   sh summary.sh
   ```

🔥 The scripts auto-skip prompts for items already installed. **Recommended:** Rerun as many times as needed.

✨ And thats it! For additional CLI and IDE customizations, refer to the related **Manual Setup** section below.

## Manual Setup

For those who prefer à la carte, this section contains everything that the **Guided Setup** attempts to do including CLI and IDE customizations.

1. If you haven’t already, save repo to `~/Downloads` folder:
   ```sh
   git clone https://github.com/michaelschwobe/mac-dev-setup.git ~/Downloads/mac-dev-setup && \
   cd ~/Downloads/mac-dev-setup/scripts
   ```
2. Continue with setup below.

- [Defaults](#defaults)
- [Tools](#tools)
- [Applications](#applications)
- [Optimizations](#optimizations)

### Defaults

##### Create Dock spacers:

```sh
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
killall Dock
```

##### Autohide Dock:

```sh
defaults write com.apple.dock autohide -boolean true && \
killall Dock
```

##### Display hidden Finder files/folders:

```sh
defaults write com.apple.finder AppleShowAllFiles -boolean true && \
killall Finder
```

##### Create `~/Developer` folder:

```sh
mkdir -p ~/Developer
```

##### Create `~/Sandbox` folder:

```sh
mkdir -p ~/Sandbox
```

##### Installing xcode-select (CLI tools):

```sh
xcode-select --install
```

##### Installing brew ([Homebrew](https://brew.sh/)):

If: Apple Silicon/ARM Architecture:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'>>$HOME/.zprofile && \
eval "$(/opt/homebrew/bin/brew shellenv)" && \
brew doctor
```

If Intel Architecture:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
brew doctor
```

### Tools

##### Install [watchman](https://facebook.github.io/watchman/):

```sh
brew install watchman
```

##### Install [trash](https://hasseg.org/trash/):

```sh
brew install trash
```

##### Install [git](https://git-scm.com/):

```sh
brew install git
```

##### Install [git-flow](https://github.com/nvie/gitflow/):

```sh
brew install git-flow
```

##### Install [zsh](https://www.zsh.org/):

```sh
brew install zsh
```

##### Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh):

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##### Install [powerlevel10k](https://github.com/romkatv/powerlevel10k/) (CLI theming):

```sh
brew install romkatv/powerlevel10k/powerlevel10k && \
echo '# Theme configuration: PowerLevel10K' >> ~/.zshrc && \
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc && \
echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc && \
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc && \
echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc
```

Restart your CLI for this to take effect, or run:

```sh
p10k configure
```

##### Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/):

```sh
brew install zsh-autosuggestions && \
echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc && \
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
```

Restart your CLI for this to take effect.

##### Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/):

```sh
brew install zsh-syntax-highlighting && \
echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc && \
echo "# Warning: Must be last sourced!" >> ~/.zshrc && \
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

Restart your CLI for this to take effect.
Note the `source` command must be **at the end** of `~/.zshrc`.

##### Install [node](https://nodejs.org/) (Node via [Homebrew](https://brew.sh/)):

```sh
brew install node
```

##### Install [n](https://github.com/tj/n/) (Node via n):

```sh
brew install n
```

##### Install [nvm](https://github.com/nvm-sh/nvm/) (Node via nvm):

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

##### Install [yarn](https://yarnpkg.com/):

```sh
brew install yarn
```

##### Install [pnpm](https://pnpm.io/):

```sh
brew install pnpm
```

##### Upgrade [npm](https://www.npmjs.com/):

```sh
npm install --location=global npm@latest
```

##### Install/Upgrade [serve](https://github.com/zeit/serve/) (globally via npm):

```sh
npm install --location=global serve@latest
```

### Applications/Casks

##### Install JetBrains Mono Nerd Font:

```sh
brew tap homebrew/cask-fonts # You only need to do this once!
brew install font-jetbrains-mono-nerd-font
```

##### Install 1Password:

```sh
brew install --cask 1password
```

##### Install Brave Browser:

```sh
brew install --cask brave-browser
```

##### Install DiffMerge:

```sh
brew install --cask diffmerge
```

##### Install Discord:

```sh
brew install --cask discord
```

##### Install Figma:

```sh
brew install --cask figma
```

##### Install Google Chrome:

```sh
brew install --cask google-chrome
```

##### Install Insomnia:

```sh
brew install --cask insomnia
```

##### Install iTerm:

```sh
brew install --cask iterm2
```

1. Copy my iTerm settings:
   ```sh
   cp ~/Downloads/mac-dev-setup/.zshrc ~/
   ```
2. Set the theme by going to:
   - "Preferences &rarr; Profiles &rarr; Colors &rarr; Color Presets… &rarr; Import…"
   - Theme location: `~/Downloads/mac-dev-setup/Moonlight.itermcolors`
3. Set the font by going to:
   - "Preferences &rarr; Profiles &rarr; Text &rarr; Font"
   - Font name: "JetBrainsMono Nerd Font Mono"
4. Restart iTerm and resolve any remaining issues.

##### Install Rectangle:

```sh
brew install --cask rectangle
```

##### Install Slack:

```sh
brew install --cask slack
```

##### Install Sourcetree:

```sh
brew install --cask sourcetree
```

1. Set the font by going to:
   - "Preferences &rarr; Diff &rarr; Internal Diff Visualization &rarr; Diff View font"
   - Font name: "JetBrainsMono Nerd Font Mono"
2. Restart Sourcetree and resolve any remaining issues.

##### Install Spotify:

```sh
brew install --cask spotify
```

##### Install Terminal:

1. Set the theme and font by going to:
   - "Preferences &rarr; Profiles &rarr; Import…"
   - Theme location: `~/Downloads/mac-dev-setup/Moonlight.terminal`
   - Font name: "JetBrainsMono Nerd Font Mono"
2. Restart iTerm and resolve any remaining issues.

##### Install Visual Studio Code:

```sh
brew install --cask visual-studio-code
```

1. Install my Extensions:
   ```sh
   code --install-extension alefragnani.project-manager
   code --install-extension atomiks.moonlight
   code --install-extension bradlc.vscode-tailwindcss
   code --install-extension christian-kohler.npm-intellisense
   code --install-extension christian-kohler.path-intellisense
   code --install-extension dbaeumer.vscode-eslint
   code --install-extension dsznajder.es7-react-js-snippets
   code --install-extension editorconfig.editorconfig
   code --install-extension esbenp.prettier-vscode
   code --install-extension formulahendry.auto-rename-tag
   code --install-extension gruntfuggly.todo-tree
   code --install-extension mikestead.dotenv
   code --install-extension ms-vscode.sublime-keybindings
   code --install-extension prisma.prisma
   code --install-extension silvenon.mdx
   code --install-extension stylelint.vscode-stylelint
   code --install-extension tyriar.sort-lines
   code --install-extension vscode-icons-team.vscode-icons
   code --install-extension wix.vscode-import-cost
   code --install-extension zenclabs.previewjs
   code --install-extension zignd.html-css-class-completion
   ```
2. Copy my Visual Studio Code User settings:
   ```sh
   cp ~/Downloads/mac-dev-setup/Code/* ~/Library/Application\ Support/Code/User
   ```
3. Restart Visual Studio Code and resolve any remaining issues.

##### Install Warp:

```sh
brew install --cask warp
```

1. Copy the theme:
   ```sh
   mkdir -p ~/.warp/themes/ && \
   cp ~/Downloads/mac-dev-setup/Moonlight.yaml ~/.warp/themes/
   ```
2. Set the theme and font by going to:
   - "Settings &rarr; Appearance &rarr; Themes"
   - Theme name: "Moonlight"
   - Font name: "JetBrainsMono Nerd Font Mono"

##### Install Zoom.us:

```sh
brew install --cask zoom
```

### Optimizations

##### Re-sort Launchpad applications:

```sh
defaults write com.apple.dock ResetLaunchPad -boolean true; killall Dock
```

##### Updating [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh):

```sh
omz update
```

##### Optimizing [Homebrew](https://brew.sh/):

```sh
brew update && brew upgrade && brew doctor && brew cleanup
```

## Other Inspirations
https://github.com/geerlingguy/mac-dev-playbook
https://github.com/vendasta/setup-new-computer-script

## Manual Installs

#### Terminal Fonts
script will download into the git folder - double click each font to install, then setup via mac terminal preferences to use Menlso font

#### Synology Drive CLient
https://www.synology.com/en-my/support/download/DS1618+?version=7.1#system

#### 1password
Login to 1password on the web

#### Github ssh
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```
update .ssh/config file
with 
```sh
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_dev_ed25519
```

```sh
ssh-add --apple-use-keychain ~/.ssh/id_dev_d25519
```

