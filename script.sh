#!/bin/bash
set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> "$HOME/.zprofile"
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> "$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Install from brewfile
brew bundle install --file="./Brewfile"

# .config/ghostty/config.ghostty
mkdir -p "$HOME/.config/ghostty/"
echo "shell-integration-features = sudo
theme = Apple System Colors Light" > "$HOME/.config/ghostty/config.ghostty"

# .ssh/config
mkdir -p "$HOME/.ssh/"
echo "Host *
  UseKeychain yes
  SetEnv TERM=xterm-256color" > "$HOME/.ssh/config"

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sed -i '' 's/^#*sdkman_auto_env=.*/sdkman_auto_env=true/' "$HOME/.sdkman/etc/config"

# Terraform
mkdir -p "$HOME/.terraform.d/plugin-cache/"
echo "plugin_cache_dir   = \"$HOME/.terraform.d/plugin-cache\"
disable_checkpoint = true" > "$HOME/.terraformrc"

git config --global user.name "João Russo"
git config --global user.email "joaorusso.net@gmail.com"

mkdir -p "$HOME/Developer"

echo "export PATH=$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts/:$PATH" >> "$HOME/.zshrc"

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"