#!/bin/bash

#### Get current user
whoami=$(whoami)
userdir="/Users/$whoami"


function welcome() {
  printf "🛠🛠🧑‍💻 Setup your macOS machine 🧑‍💻🛠🛠\n\n"
}

function detectOS() {
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    echo "🖥️ macOS detected. 👍🏽"
  else
    echo "⁉️You are not running on a macOS system. Exiting... 👎🏽"
    exit 1
  fi
}

function installHomebrew() {
  echo "🛠🍺️Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "🍺✅ Homebrew installed!"
}

function installFonts() {
  echo "🛠📝Installing JetBrains Mono font..."
  brew install --cask font-jetbrains-mono
  echo "📝✅JetBrains Mono font installed!"
}

function installFirefox() {
  echo "🛠🦊Installing Firefox Developer Edition..."
  brew install --cask firefox@developer-edition
  echo "🦊✅Firefox Developer Edition installed!"
}

function installChatClients() {
  echo "🛠💬Installing Slack..."
  brew install --cask slack
  echo "💬✅Slack installed!"

  echo "🛠🌐Installing Discord..."
  brew install --cask discord
  echo "🌐✅Discord installed!"
}

function installFishShell() {
  echo "🛠🐟Installing fish shell..."
  brew install fish
  echo "🐟✅ fish shell installed!"

  echo "🛠🐟Adding fish shell to list of allowed shells..."
  command -v fish | sudo tee -a /etc/shells
  echo "🐟✅fish shell added to the list of allowed shells!"

  echo "🛠🐟Making fish shell the default shell..."
  chsh -s "$(command -v fish)"
  echo "🐟✅fish shell is now the default shell!"
}

function installOhMyFish() {
  echo "🛠🐟Installing oh-my-fish..."
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
  echo "🐟✅oh-my-fish installed!"

  omfPackages=("bass" "gitstatus")
  for package in "${omfPackages[@]}"; do
    echo "🛠🐟Installing oh-my-fish $package package..."
    fish --command="omf install $package"
    echo "🐟✅oh-my-fish package $package installed!"
  done

  echo "🛠🐟Setting fish shell theme to gitstatus..."
  fish --command="omf theme gitstatus"
  echo "🐟✅fish shell theme set to gitstatus1"
}

function installTerminalUtilities() {
  echo "🛠🖥️Installing iTerm2..."
  brew install --cask iterm2
  echo "🖥✅iTerm2 installed!"

  echo "🛠Installing autojump..."
  brew install autojump
  echo "✅autojump installed!"

  echo "🛠Installing vfox..."
  brew install vfox
  echo "✅vfox installed!"

  echo "🛠Installing yt-dlp..."
  brew install yt-dlp
  echo "✅yt-dlp installed!"
}

function installDotFiles() {
    echo "🛠🐟Installing fish shell configuration files..."
    curl --location --output "$userdir/.config/fish/" https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/private_dot_config/private_fish/config.fish
    echo "🛠🐟fish shell configuration files installed!"

    echo "🛠Installing vim configuration files..."
    curl --location --output "$userdir/" https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_gvimrc
    curl --location --output "$userdir/" https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_vimrc
    echo "🛠vim configuration files installed!"

    echo "🛠Installing zsh configuration files..."
    curl --location --output "$userdir/" https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_zprofile
    curl --location --output "$userdir/" https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_zshrc
    echo "🛠zsh configuration files installed!"
}

function installSystemUtilities() {
  echo "🛠✂️Installing jumpcut..."
  brew install --cask jumpcut
  echo "✂️✅jumpcut installed!"

  echo "🛠☕️Installing caffeine..."
  brew install --cask caffeine
  echo "☕️✅caffeine installed!"

  echo "🛠🌓Installing f.lux..."
  brew install --cask flux-app
  echo "🌓✅f.lux installed!"

  echo "🛠🔐Installing veracrypt..."
  brew install --cask veracrypt
  echo "🔐✅veracrypt installed!"
}

function installHammerspoon() {
  echo "🛠🥄Installing hammerspoon..."
  brew install --cask hammerspoon
  echo "🥄✅hammerspoon installed!"

  echo "🛠🗂️Creating .hammerspoon/Spoons directory..."
  mkdir -p "$userdir/.hammerspoon/Spoons"
  echo "🗂️✅.hammerspoon/Spoons directory created!"

  echo "🛠🥄Installing hammerspoon configuration file..."
  curl --location --output "$userdir/.hammerspoon/" https://raw.githubusercontent.com/sprak3000/dotfiles/refs/heads/main/dot_hammerspoon/init.lua
  echo "🛠🥄hammerspoon configuration file installed!"

  echo "🛠🥄Downloading and installing $userdir/.hammerspoon/Spoons/ArrangeDesktop.spoon"
  curl --location --output /tmp/ArrangeDesktop.spoon.zip https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ArrangeDesktop.spoon.zip
  unzip /tmp/ArrangeDesktop.spoon.zip -d "$userdir/.hammerspoon/Spoons/"
  rm /tmp/ArrangeDesktop.spoon.zip
  echo "🥄✅$userdir/.hammerspoon/Spoons/ArrangeDesktop.spoon installed!"
}

function installXbar() {
  echo "🛠Installing xbar..."
  brew install --cask xbar
  echo "✅xbar installed!"

  echo "🛠🗂️Creating $userdir/.xbar directory..."
  ln -s ~/Library/Application\ Support/xbar/plugins ~/.xbar
  echo "🗂️✅$userdir/.xbar directory created!"
}

function installIDEs() {
  echo "🛠🕸️Installing WebStorm..."
  brew install --cask webstorm
  echo "🕸✅WebStorm installed!"

  echo "🛠⛈️Installing PHPStorm..."
  brew install --cask phpstorm
  echo "⛈️✅PHPStorm installed!"

  echo "🛠⛰️Installing GoLand..."
  brew install --cask goland
  echo "⛰️✅GoLand installed!"

  echo "🛠📊Installing DataGrip..."
  brew install --cask datagrip
  echo "📊✅DataGrip installed!"

  echo "🛠Installing MacVim..."
  brew install macvim
  echo "✅MacVim installed!"
}

function installGames() {
  echo "🛠Installing GOG Galaxy..."
  brew install --cask gog-galaxy
  echo "✅GOG Galaxy installed!"

  echo "🛠Installing Steam..."
  brew install --cask steam
  echo "✅Steam installed!"

  echo "🛠Installing Battle.net..."
  brew install --cask battle-net
  echo "✅Battle.net installed!"
}

function setupGitHub() {
  echo "🛠🗂️Creating github.com directory..."
  mkdir -p "$userdir/github.com"
  echo "🗂️✅github.com directory created!"
}

function setupWallpapers() {
  echo "🛠🗂️Creating Pictures/wallpaper directory..."
  mkdir -p "$userdir/Pictures/wallpaper"
  echo "🗂️✅Pictures/wallpaper directory created!"
}

welcome
detectOS
installHomebrew
installFonts
installFirefox
installChatClients
installFishShell
installOhMyFish
installTerminalUtilities
installSystemUtilities
installDotFiles
installHammerspoon
installXbar
installIDEs
installGames
setupGitHub
setupWallpapers
