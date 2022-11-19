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

##### Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/):

```sh
brew install zsh-syntax-highlighting && \
echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc && \
echo "# Warning: Must be last sourced!" >> ~/.zshrc && \
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

Restart your CLI for this to take effect.
Note the `source` command must be **at the end** of `~/.zshrc`.

##### Install iTerm:

```sh
brew install --cask iterm2
```

1. Copy my iTerm settings:
   ```sh
   cp ~/git/mac-dev-setup/.zshrc ~/
   ```
2. Set the theme by going to:
   - "Preferences &rarr; Profiles &rarr; Colors &rarr; Color Presets… &rarr; Import…"
   - Theme location: `~/git/mac-dev-setup/Moonlight.itermcolors`
3. Set the font by going to:
   - "Preferences &rarr; Profiles &rarr; Text &rarr; Font"
   - Font name: "JetBrainsMono Nerd Font Mono"
4. Restart iTerm and resolve any remaining issues.

##### Install Terminal:

1. Set the theme and font by going to:
   - "Preferences &rarr; Profiles &rarr; Import…"
   - Theme location: `~/git/mac-dev-setup/Moonlight.terminal`
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
   cp ~/git/mac-dev-setup/Moonlight.yaml ~/.warp/themes/
   ```
2. Set the theme and font by going to:
   - "Settings &rarr; Appearance &rarr; Themes"
   - Theme name: "Moonlight"
   - Font name: "JetBrainsMono Nerd Font Mono"


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
  IdentityFile ~/.ssh/id_ed25519
```

```sh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

Copy key to clipboard and paste into github settings
```sh
$ pbcopy < ~/.ssh/id_ed25519.pub
```

#### Synology Drive Client
https://www.synology.com/en-my/support/download/DS1618+?version=7.1#utilities