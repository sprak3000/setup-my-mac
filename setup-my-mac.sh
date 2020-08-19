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


#### Install Homebrew formulae

brewFormulae=("wget" "autojump" "youtube-dl" "ssh-copy-id" "fish")

for formula in "${brewFormulae[@]}"; do
  if ! formula_loc="$(type -p "brew")" || [[ -z $formula_loc ]]; then
    echo ">>>> Installing Homebrew formula $formula"
    #brew install $formula
  else
    echo ">>>> Homebrew formula $formula already installed"
  fi
done


#### Add fish shell to the list of allowed shells

if [ 1 = "$(grep --count fish /etc/shells)" ]; then
  echo ">>>> fish shell already in list of allowed shells"
else
  echo ">>>> Adding fish shell to list of allowed shells"
  #echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi


#### Make fish the default shell

if [ 1 = "$(dscl . -read $userdir UserShell | grep --count fish)" ]; then
  echo ">>>> fish shell already the default shell"
else
  echo ">>>> Making fish shell the default shell"
  #chsh -s /usr/local/bin/fish
fi


#### Install oh-my-fish package manager

if ! omf_loc="$(fish --command='type -p "omf"')" || [[ -z $omf_loc ]]; then
  echo ">>>> Installing oh-my-fish"
  #curl -L https://get.oh-my.fish | fish
else
  echo ">>>> oh-my-fish already installed"
fi


#### Install oh-my-fish packages

omfPackages=("bass" "gitstatus")

for package in "${omfPackages[@]}"; do
  if [ 1 = "$(fish --command='omf list' | grep --count $package)" ]; then
    echo ">>>> oh-my-fish package $package already installed"
  else
    echo ">>>> Installing oh-my-fish package $package"
    #omf install $package
  fi
done


#### Set fish shell theme to gitstatus

if [ 1 = "$(fish --command='omf theme' | grep default | head -n 1 | grep --count gitstatus)" ]; then
  echo ">>>> fish shell theme is already gitstatus"
else
  echo ">>>> Setting fish shell theme to gitstatus"
  #fish --command="omf theme gitstatus"
fi


#### Install software from Homebrew casks

caskFormulae=("jumpcut" "caffeine" "iterm2" "firefox-developer-edition" "steam" "macvim" "veracrypt" "gog-galaxy" "twitch" "vlc" "discord" "homebrew/cask-fonts/font-jetbrains-mono" "flux")

for formula in "${caskFormulae[@]}"; do
  if [ 1 = "$(brew cask list | grep --count $formula)" ]; then
    echo ">>>> Homebrew cask formula $formula already installed"
  else
    echo ">>>> Installing Homebrew cask formula $formula"
    #brew cask install $formula
  fi
done


### Install dotfiles

if [ -f "$userdir/.vimrc" ]; then
  echo ">>>> $userdir/.vimrc already exists"
else
  echo ">>>> Creating $userdir/.vimrc"
  #cp ./dotfiles/gvimrc $userdir/.vimrc
fi

if [ -f "$userdir/.gvimrc" ]; then
  echo ">>>> $userdir/.gvimrc already exists"
else
  echo ">>>> Creating $userdir/.gvimrc"
  #cp ./dotfiles/gvimrc $userdir/.gvimrc
fi


#### Setting up default github.com directory

if [ -d "$userdir/github.com" ]; then
  echo ">>>> $userdir/github.com already exists"
else
  echo ">>>> Creating $userdir/github.com"
  #echo "$userdir/github.com" | mkdir
fi


#### Parting words

echo ">>>> Software to install through App Store >>>>"

appStoreInstalls=("LastPass" "Slack" "TweetDeck" "XCode")
for install in "${appStoreInstalls[@]}"; do
  echo -e "\t$install"
done

echo ">>>> Software to install manually >>>>"

manualInstalls=("GoLand" "PHPStorm" "FileZilla" "H+R Block Tax" "Quicken")
for install in "${manualInstalls[@]}"; do
  echo -e "\t$install"
done

