#!/bin/bash

#### Get current user
whoami=$(whoami)
userdir="/Users/$whoami"

#### Install Homebrew ####
if ! brew_loc="$(type -p "brew")" || [[ -z $brew_loc ]]; then
  echo ">>>> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo ">>>> Homebrew already installed"
fi

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> "$userdir/.zprofile"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$userdir/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

#### Install software via Brewfile ####
brew bundle install --no-lock

#### Add fish shell to the list of allowed shells ####
if [ 1 = "$(grep --count fish /etc/shells)" ]; then
  echo ">>>> fish shell already in list of allowed shells"
else
  echo ">>>> Adding fish shell to list of allowed shells"
  echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
fi

#### Make fish the default shell ####
if [ 1 = "$(dscl . -read $userdir UserShell | grep --count fish)" ]; then
  echo ">>>> fish shell already the default shell"
else
  echo ">>>> Making fish shell the default shell"
  chsh -s /opt/homebrew/bin/fish
fi

#### Install oh-my-fish package manager ####
if ! omf_loc="$(fish --command='type -p "omf"')" || [[ -z $omf_loc ]]; then
  echo ">>>> Installing oh-my-fish"
  curl -L https://get.oh-my.fish | fish
else
  echo ">>>> oh-my-fish already installed"
fi

#### Install oh-my-fish packages ####
omfPackages=("bass" "gitstatus")
for package in "${omfPackages[@]}"; do
  if [ 1 = "$(fish --command='omf list' | grep --count $package)" ]; then
    echo ">>>> oh-my-fish package $package already installed"
  else
    echo ">>>> Installing oh-my-fish package $package"
    fish --command="omf install $package"
  fi
done

#### Set fish shell theme to gitstatus ####
if [ 1 = "$(fish --command='omf theme' | grep default | head -n 1 | grep --count gitstatus)" ]; then
  echo ">>>> fish shell theme is already gitstatus"
else
  echo ">>>> Setting fish shell theme to gitstatus"
  fish --command="omf theme gitstatus"
fi

#### Install dotfiles via chezmoi ####
chezmoi init --apply sprak3000

#### Setup Hammerspoon and Arrange Desktop spoon ####
if [ -d "$userdir/.hammerspoon/Spoons" ]; then
  echo ">>>> $userdir/.hammerspoon/Spoons already exists"
else
  echo ">>>> Creating $userdir/.hammerspoon/Spoons"
  mkdir "$userdir/.hammerspoon/Spoons"
fi

if [ -d "$userdir/.hammerspoon/Spoons/ArrangeDesktop.spoon" ]; then
  echo ">>>> $userdir/.hammerspoon/Spoons/ArrangeDesktop.spoon already exists"
else
  echo ">>>> Downloading and installing $userdir/.hammerspoon/Spoons/ArrangeDesktop.spoon"
  curl -L -o /tmp/ArrangeDesktop.spoon.zip https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ArrangeDesktop.spoon.zip
  unzip /tmp/ArrangeDesktop.spoon.zip -d "$userdir/.hammerspoon/Spoons/"
  rm /tmp/ArrangeDesktop.spoon.zip
fi

#### Link to xbar plugins folder ####
if [ -d "$userdir/.xbar" ]; then
  echo ">>>> $userdir/.xbar already exists"
else
  echo ">>>> Creating $userdir/.xbar"
  ln -s ~/Library/Application\ Support/xbar/plugins .xbar
fi

#### Create github.com directory ####
if [ -d "$userdir/github.com" ]; then
  echo ">>>> $userdir/github.com already exists"
else
  echo ">>>> Creating $userdir/github.com"
  mkdir "$userdir/github.com"
fi

#### Create the wallpapers directory ####
if [ -d "$userdir/Pictures/wallpaper" ]; then
  echo ">>>> $userdir/Pictures/wallpaper already exists"
else
  echo ">>>> Creating $userdir/Pictures/wallpaper"
  mkdir "$userdir/Pictures/wallpaper"
fi

#### Parting words
#echo ">>>> Software to install through App Store >>>>"
#
#appStoreInstalls=("XCode")
#for install in "${appStoreInstalls[@]}"; do
#  echo -e "\t$install"
#done

echo ">>>> Software to install manually >>>>"

manualInstalls=("FileZilla" "H+R Block Tax" "Quicken")
for install in "${manualInstalls[@]}"; do
  echo -e "\t$install"
done
