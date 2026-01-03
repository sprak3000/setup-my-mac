#!/bin/bash

function detectOS() {
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    printf "🖥️ macOS detected.👍🏽\n\n"
    return
  fi

  echo "⁉️You are not running on a macOS system. Exiting... 👎🏽"
  exit 1
}

function isInstalled() {
  # It is not installed
  if ! loc="$(type -p "$1")" || [[ -z $loc ]]; then
    return 1
  fi

  # It is installed.
  return 0
}

function createDirectory() {
  # Directory already exists
  if [[ -d "$1" ]]; then
    echo "✅ $1 directory already exists! Skipping..."
    return
  fi

  echo "🛠 🗂 Creating $1 directory..."
  mkdir -p "$1"
  echo "✅ $1 directory created!"
}

function isAppInstalled() {
  local app_name="$1"

  # Check common application directories
  if [[ -d "/Applications/${app_name}.app" ]] || [[ -d "$HOME/Applications/${app_name}.app" ]]; then
    return 0
  fi

  # Not installed
  return 1
}

function fileExists() {
  # File does not exist
  if [[ ! -f "$1" ]]; then
    return 1
  fi

  # File exists
  return 0
}

function installRosetta() {
  if /usr/bin/pgrep -q oahd; then
    echo "✅ Rosetta 2 is already installed! Skipping..."
    return
  fi

  echo "🛠  Installing Rosetta 2..."
  softwareupdate --install-rosetta --agree-to-license
  echo "✅ Rosetta 2 installed!"
}

function installHomebrew() {
  if isInstalled "brew"; then
    echo "✅ Homebrew is already installed! Skipping..."
    return
  fi

  echo "🛠  Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "✅ Homebrew installed!"

  # Add Homebrew to PATH for the current session
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "✅ Homebrew added to PATH"
}

function installHomebrewFormula() {
  local formula_name="$1"
  local app_name="$2"

  if isInstalled "${app_name}"; then
    echo "✅ ${app_name} already installed! Skipping..."
    return
  fi

  echo "🛠 Installing ${app_name}..."
  brew install "${formula_name}"
  echo "✅ ${app_name} installed!"
}

function installHomebrewCask() {
  local cask_name="$1"
  local app_name="$2"

  if isAppInstalled "${app_name}"; then
    echo "✅ ${app_name} already installed! Skipping..."
    return
  fi

  echo "🛠 Installing ${app_name}..."
  brew install --cask "${cask_name}"
  echo "✅ ${app_name} installed!"
}

function downloadFile() {
  local output="$1"
  local url="$2"
  local description="$3"

  if fileExists "${output}"; then
    echo "✅ The ${description} already exists! Skipping..."
    return
  fi

  echo "📥 Downloading ${description}..."
  curl --location --output "${output}" "${url}"
  echo "✅ Downloaded the ${description}!"
}

### >>> Installation steps <<< ###

whoami=$(whoami)
userdir="/Users/$whoami"

printf "\n🛠 🛠  🧑‍💻 Setup your macOS machine 🧑‍💻 🛠 🛠\n\n"

detectOS

installRosetta

installHomebrew

### Fonts ###

foundJetBrainsMonoFont=false
for font in ~/Library/Fonts/*JetBrains* /Library/Fonts/*JetBrains*; do
  if [[ -e "$font" ]]; then
    foundJetBrainsMonoFont=true
    break
  fi
done

if [[ "$foundJetBrainsMonoFont" == "true" ]]; then
  echo "✅ JetBrains Mono fonts already installed! Skipping..."
else
  echo "🛠  Installing JetBrains Mono font..."
  brew install --cask font-jetbrains-mono
  echo "✅ JetBrains Mono font installed!"
fi

### Fish shell ###

installHomebrewFormula "fish" "fish"

if [ 1 = "$(grep --count fish /etc/shells)" ]; then
  echo "✅ fish is already in list of allowed shells! Skipping..."
else
  echo "🛠  Adding fish shell to list of allowed shells..."
  command -v fish | sudo tee -a /etc/shells
  echo "✅ fish shell added to the list of allowed shells!"
fi

if [ 1 = "$(dscl . -read "$userdir" UserShell | grep --count fish)" ]; then
  echo "✅ fish is already the default shell! Skipping..."
else
  chsh -s "$(command -v fish)"
  echo "✅ fish is now the default shell!"
fi

downloadFile "$userdir/.config/fish/config.fish" "https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/private_dot_config/private_fish/config.fish" "fish configuration file"

if  [[ -d "$userdir/.local/share/omf" ]]; then
  echo "✅ oh-my-fish is already installed! Skipping..."
else
  echo "🛠 Installing oh-my-fish..."
  curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > /tmp/omf-install
  fish /tmp/omf-install --noninteractive
  rm /tmp/omf-install
  echo "✅ oh-my-fish installed!"
fi

if [[ -d "$userdir/.local/share/omf/pkg/bass" ]]; then
  echo "✅ The oh-my-fish bass package is already installed! Skipping..."
else
  echo "🛠  Installing oh-my-fish bass package..."
  fish --command="omf install bass"
  echo "✅ oh-my-fish package bass installed!"
fi

if [[ -d "$userdir/.local/share/omf/themes/gitstatus" ]]; then
  echo "✅ The oh-my-fish gitstatus theme is already installed! Skipping..."
else
  echo "🛠  Installing oh-my-fish gitstatus theme..."
  fish --command="omf install gitstatus"
  echo "✅ oh-my-fish gitstatus theme installed!"
fi

if fileExists "$userdir/.config/omf/theme" && [[ "$(cat "$userdir/.config/omf/theme")" == "gitstatus" ]]; then
  echo "✅ fish theme already set to gitstatus! Skipping..."
else
  echo "🛠  Setting fish theme to gitstatus..."
  fish --command="omf theme gitstatus"
  echo "✅ fish theme set to gitstatus!"
fi

### Terminal & utilities ###

installHomebrewCask "iTerm2" "iTerm"
downloadFile "$userdir/.zprofile" "https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_zprofile" ".zprofile file"
downloadFile "$userdir/.zshrc" "https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_zshrc" ".zshrc file"

installHomebrewFormula "autojump" "autojump"
installHomebrewFormula "vfox" "vfox"
installHomebrewFormula "yt-dlp" "yt-dlp"
installHomebrewFormula "jq" "jq"
installHomebrewFormula "tbls" "tbls"
installHomebrewFormula "go-task" "task"
installHomebrewFormula "revive" "revive"

### System utilities ###

installHomebrewCask "jumpcut" "Jumpcut"
installHomebrewCask "caffeine" "Caffeine"
installHomebrewCask "flux-app" "Flux"
installHomebrewCask "veracrypt" "VeraCrypt"
#installHomebrewCask "logi-options+" "logioptionsplus"

installHomebrewCask "xbar" "xbar"
#if [[ -d "$userdir/.xbar" ]]; then
#  echo "✅ $userdir/.xbar directory already exists! Skipping..."
#else
#  echo "🛠  Creating $userdir/.xbar directory..."
#  ln -s ~/Library/Application\ Support/xbar/plugins ~/.xbar
#  echo "✅ $userdir/.xbar directory created!"
#fi

installHomebrewCask "hammerspoon" "Hammerspoon"
createDirectory "$userdir/.hammerspoon/Spoons"
downloadFile "$userdir/.hammerspoon/init.lua" "https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_hammerspoon/init.lua" "Hammerspoon configuration file"
if [[ -d "$userdir/.hammerspoon/Spoons/ArrangeDesktop.spoon" ]]; then
  echo "✅ ArrangeDesktop spoon already installed! Skipping..."
else
  downloadFile "/tmp/ArrangeDesktop.spoon.zip" "https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ArrangeDesktop.spoon.zip" "ArrangeDesktop spoon archive file"
  unzip /tmp/ArrangeDesktop.spoon.zip -d "$userdir/.hammerspoon/Spoons/"
  rm /tmp/ArrangeDesktop.spoon.zip
  echo "✅ ArrangeDesktop spoon installed!"
fi

### Web browsers ###

installHomebrewCask "firefox@developer-edition" "Firefox Developer Edition"
installHomebrewCask "google-chrome" "Google Chrome"

### Chat clients ###

installHomebrewCask "slack" "Slack"
installHomebrewCask "discord" "Discord"
installHomebrewCask "zoom" "zoom.us"

### IDEs ###

installHomebrewCask "webstorm" "WebStorm"
installHomebrewCask "phpstorm" "PHPStorm"
installHomebrewCask "goland" "GoLand"
installHomebrewCask "datagrip" "DataGrip"

installHomebrewCask "macvim" "MacVim"
downloadFile "$userdir/.gvimrc" "https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_gvimrc" ".gvimrc" ".gvimrc file"
downloadFile "$userdir/.vimrc" "https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_vimrc" ".vimrc" ".vimrc file"

### Docker ###

installHomebrewCask "orbstack" "OrbStack"

### PHP ###

if [[ -d "$(brew --repository)/Library/Taps/shivammathur/homebrew-php" ]]; then
  echo "✅ shivammathur/php tap already installed! Skipping..."
else
  echo "🛠  Installing shivammathur/php tap..."
  brew tap shivammathur/php
  echo "✅ shivammathur/php installed!"
fi

installHomebrewFormula "shivammathur/php/php@8.5" "PHP"

### Gaming ###

installHomebrewCask "gog-galaxy" "GOG Galaxy"
installHomebrewCask "steam" "Steam"
installHomebrewCask "battle-net" "Battle.net"

### GitHub ###

createDirectory "$userdir/github.com"

### Wallpapers ###

createDirectory "$userdir/Pictures/wallpaper"

printf "\n🎉🎉🎉 Setup complete! 🎉🎉🎉\n\n"
