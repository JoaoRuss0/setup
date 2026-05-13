!#/bin/bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/joaorusso/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Install Software
brew install --cask ghostty discord firefox jetbrains-toolbox docker-desktop
brew install maven

# .config/ghostty/config.ghostty
mkdir -p .config/ghostty/
echo "shell-integration-features = sudo
theme = Apple System Colors Light" > .config/ghostty/config.ghostty

# .ssh/config
mkdir .ssh
echo "Host *
  UseKeychain yes
  SetEnv TERM=xterm-256color" > .ssh/config

# Install ohmyzsh
brew install bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash
source "/Users/joaorusso/.sdkman/bin/sdkman-init.sh"

# Install cargo (rust)
curl https://sh.rustup.rs -sSf | sh
source .zshenv

git config --global user.name "João Russo"
git config --global user.email "joaorusso.net@gmail.com"

# Install intellij + rustrover
    # Font: Jetbrains Mono
    # Theme: Light with Light Header
    # Registry: Disable `project.tree.show.url`
    # Setting: Disable "Use Project Colors in Toolbar"
    # Keymap: Remove "Column selection mode" keymap keybinds

# MacOS
    # Disable Startup Sound
mkdir ~/Developer
