# Setup My Mac

## Overview
This repository holds my scripts, configuration files, notes, etc. for the rare occasion of setting up a new Mac for
myself. You will fine in here:
* My customizations to various system preferences
* A script to 
  * Install a considerable amount of software I use
  * Remind of software I need to install manually
  * Setup my terminal theme
* Various dotfiles and configuration files I use

**Current OS X Version Used:** `Catalina 10.15.X`

## Initial Setup
I follow these steps immediately after I first boot up a new Mac and go through the initial setup it presents:
* Apply any system software updates.
* Apply any App Store updates for pre-installed software.
* Remove any unwanted applications from the dock.
* Install the following software from the App Store: 
  * [Lastpass](https://www.lastpass.com/) 
  * [Slack](https://slack.com/)
  * [XCode](https://apps.apple.com/us/app/xcode/id497799835)
  * [TweetDeck](https://tweetdeck.twitter.com/)

## System Preferences
Here are the various customizations I make to the default system preferences.

### General
* Turn off `Use font smoothing when available`.
* Set `Appearance` to `Dark`.

### Desktop & Screen Saver
* Create the directory `~/Pictures/wallpaper`.
* Add the directory to the `Desktop` folder list and select it.
* Set `Desktop` to `Change picture: Every 30 minutes` and set it to `Random Order`.

### Dock
* Adjust `Size` to feel comfortable based on the screen size.
* Set `Minimize windows using` to `Scale effect`.
* Turn off `Automatically hide and show the Dock`.
* Turn off `Show recent applications in Dock`.

### Siri
* Turn off `Enable Siri`.

### Language & Region
* `General` tab
  * Set `First day of week` to `Sunday`.
  * Set `Time format` to `24-Hour Time`.

### Network
* `Wi-Fi` > `Advanced` > `DNS`
  * Clear out any existing entries in `DNS Servers`.
  * Add these DNS servers instead in this order: `1.1.1.1`, `8.8.8.8`, `8.8.4.4`.
  
### Sharing
* Fill in `Computer Name` with something cool.
* `Computer Name` > `Edit` and use the same name for the `Local Hostname`.
  
## Installation Script
```
./setup-my-mac.sh
```

This `bash` script performs the following tasks in order:
* Install [Homebrew](https://brew.sh/).
* Use Homebrew to install various system utilities and [fish shell](https://fishshell.com/).
* Setup fish shell to be the default shell.
* Install the [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) package manager.
* Use oh-my-fish to install any fish shell packages and the `gitstatus` theme.
* Use Homebrew to automatically install various software you would otherwise have to manually install.
* Create the directory `~/github.com`.
* Remind me of any other software I need to manually download and install or install from the App Store.

The script endeavors to only perform a step if necessary. e.g., It attempts to detect already installed software to
prevent trying to inst all it again.

## What I Use
### Utilities
| Name | Description | Installation |
|:----:|-------------|:------------:|
| [Homebrew](https://brew.sh/) | OS X package manager used to install software | See latest instructions on homepage. `setup-my-mac.sh` has those instructions as of last check-in. |
| [wget](https://www.gnu.org/software/wget/) | Utility for retrieving files via HTTPS, etc. | Homebrew |
| [autojump](https://github.com/wting/autojump) | Utility for quickly changing to previously visited directories | Homebrew |
| [youtube-dl](https://ytdl-org.github.io/youtube-dl/) | Utility for downloading videos from YouTube and other streaming sites | Homebrew |
| [ssh-copy-id](https://www.ssh.com/ssh/copy-id) | Utility for installing SSH keys on a server | Homebrew |
| [Jumpcut](https://github.com/snark/jumpcut) | Clipboard manager | Homebrew Cask |
| [Caffeine](https://intelliscapesolutions.com/apps/caffeine) | Prevents your Mac from automatically going to sleep | Homebrew Cask |
| [VeraCrypt](https://www.veracrypt.fr/en/Home.html) | Disk encryption software | Homebrew Cask |
| [LastPass](https://www.lastpass.com/) | Password manager | App Store |
| [FileZilla](https://filezilla-project.org/) | FTP client | Manual |
| [f.lux](https://justgetflux.com/) | Adjust the screen colors based on time of day | Homebrew Cask |
| [MacVIM](https://macvim-dev.github.io/macvim/) | Text editor | Homebrew Cask |

### Alternative Terminals, Shells, Fonts
| Name | Description | Installation |
|:----:|-------------|:------------:|
| [iTerm2](http://iterm2.com/) | My preferred replacement for the OS X terminal program | Homebrew Cask |
| [fish shell](https://fishshell.com/) | My preferred shell these days | Homebrew |
| [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) | Package manager for fish shell used to install themes and fish shell related utilities | See latest instructions on homepage. `setup-my-mac.sh` has those instructions as of last check-in. |
| [JetBrains Mono Font](https://www.jetbrains.com/lp/mono/) | Programmer friendly font | Homebrew Cask |

### Programming IDEs
| Name | Description | Installation |
|:----:|-------------|:------------:|
| [PHPStorm](https://www.jetbrains.com/phpstorm/) | JetBrains IDE for PHP development | Manual |
| [GoLand](https://www.jetbrains.com/go/) | JetBrains IDE for Go development | Manual |
| [DataGrip](https://www.jetbrains.com/datagrip/) | JetBrains IDE for SQL / database development | Manual |
| [XCode](https://apps.apple.com/us/app/xcode/id497799835) | Apple development | App Store |

### Web Browsers
| Name | Description | Installation |
|:----:|-------------|:------------:|
| [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) | Version of Firefox geared towards developers | Homebrew Cask |

### Chat & Social Media
| Name | Description | Installation |
|:----:|-------------|:------------:|
| [Slack](https://slack.com/) |  | App Store |
| [Discord](https://discord.com/) |  | Homebrew Cask |
| [TweetDeck](https://tweetdeck.twitter.com/) | Twitter client | App Store |

### Entertainment
| Name | Description | Installation |
|:----:|-------------|:------------:|
| [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop) | Blizzard gaming client | Manual |
| [Steam](https://store.steampowered.com/) | Platform for a variety of games | Homebrew Cask |
| [GOG Galaxy](https://www.gog.com/galaxy) | Platform for older games | Homebrew Cask |
| [Twitch](https://www.twitch.tv/) | Watch streams from gamers and more | Homebrew Cask |
| [VLC](https://www.videolan.org/vlc/index.html) | Media player | Homebrew Cask |

### Finance
| Name | Description | Installation |
|:----:|-------------|:------------:|
| [Quicken Deluxe](https://www.quicken.com/personal-finance/quicken-deluxe-mac) | Keep track of financial accounts | Manual |
| [H&R Block Tax Software](https://www.hrblock.com/tax-software/) | Tax preparation & filing | Manual |
