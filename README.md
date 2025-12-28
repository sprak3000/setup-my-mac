# Set up my Mac

> [!NOTE]
> - **Latest silicon used:** Apple M1
> - **Latest macOS version used:** `Ventura 13.1`

This repository holds my scripts, configuration files, notes, etc. for the rare occasion of setting up a new Mac for
myself. You will find in here:

- My customizations to various system preferences
- A script to
    - Install a considerable amount of software I use
    - Set up my terminal theme
    - Set up various dotfiles and configuration files.

## Initial Setup

I follow these steps immediately after I first boot up a new Mac and go through the initial setup it presents:

- Apply any system software updates.
- Apply any App Store updates for pre-installed software.
- Remove any unwanted applications from the dock.

## System Preferences

Here are the various customizations I make to the default system preferences.

### General

#### Date & Time

- Turn on `24-hour time`.

#### Language & Region

- Set `First day of week` to `Sunday`.
- Set `Date format` to `YYYY-MM-DD`.

#### Sharing

- `Local hostname` > `Edit` and provide a better hostname.

### Appearance

- Set `Appearance` to `Dark`.

### Desktop & Screen Saver

- Add the `~/Pictures/wallpaper` directory to the `Folders` list and select it.
- Check `Change picture` and set the drop-down to`Every 30 minutes`. Repeat for each monitor attached.
- Check `Random Order`. Repeat for each monitor attached.

### Desktop & Dock

- Adjust `Size` to feel comfortable based on the screen size.
- Set `Minimize windows using` to `Scale effect`.
- Turn off `Automatically hide and show the Dock`.
- Turn off `Show recent applications in Dock`.

### Control Center

- Set `Bluetooth` to `Show in Menu Bar`.
- Set `Focus` to `Always Show in Menu Bar`.
- Turn on `Battery > Show Percentage`.
- Set `Menu Bar Only > Spotlight` to `Don't Show in Menu Bar`.
- Set `Menu Bar Only > Siri` to `Don't Show in Menu Bar`.
- Turn on `Menu Bar Only > Clock > Clock Options > Use a 24-hour clock`.

### Siri & Spotlight

- Turn off `Ask Siri`.
- Uncheck all the items under `Spotlight`.

### Wi-Fi

- Click the `Details` button next to the desired network(s) and go to the `DNS` entry.
    - Clear out any existing entries in `DNS Servers`.
    - Add these DNS servers instead in this order:
        - `1.1.1.1`
        - `8.8.8.8`
        - `8.8.4.4`

## Installation Script

```
./setup-my-mac.sh
```

This `bash` script performs the following tasks:

- Installs [Homebrew](https://brew.sh/) package manager
- Installs [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font
- Installs and configures [fish shell](https://fishshell.com/) as the default shell
- Installs [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) package manager with `bass` package and `gitstatus`
  theme
- Downloads fish, zsh, vim, and Hammerspoon configuration files from dotfiles repository
- Installs terminal and utilities: iTerm2, autojump, vfox, yt-dlp, jq, tbls, go-task, revive
- Installs system utilities: Jumpcut, Caffeine, Flux, VeraCrypt, xbar, Hammerspoon (with ArrangeDesktop spoon)
- Installs web browsers: Firefox Developer Edition, Google Chrome
- Installs chat clients: Slack and Discord
- Installs JetBrains IDEs: WebStorm, PHPStorm, GoLand, DataGrip
- Installs MacVim
- Installs OrbStack for Docker containers
- Installs PHP 8.5 via shivammathur/php tap
- Installs gaming platforms: GOG Galaxy, Steam, Battle.net
- Creates directories: `~/github.com` and `~/Pictures/wallpaper`

The script detects already installed software and skips reinstallation to prevent errors and save time.

## What I Use

### Utilities

|                            Name                             | Description                                                           |                                            Installation                                            |
|:-----------------------------------------------------------:|-----------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------:|
|                [Homebrew](https://brew.sh/)                 | OS X package manager used to install software                         | See latest instructions on homepage. `setup-my-mac.sh` has those instructions as of last check-in. |
|        [autojump](https://github.com/wting/autojump)        | Utility for quickly changing to previously visited directories        |                                              Homebrew                                              |
|           [vfox](https://vfox.lhan.me/index.html)           | Version manager for programming languages and tools                   |                                              Homebrew                                              |
|         [yt-dlp](https://github.com/yt-dlp/yt-dlp)          | Utility for downloading videos from YouTube and other streaming sites |                                              Homebrew                                              |
|             [jq](https://jqlang.github.io/jq/)              | Command-line JSON processor                                           |                                              Homebrew                                              |
|            [tbls](https://github.com/k1LoW/tbls)            | Database documentation tool                                           |                                              Homebrew                                              |
|              [go-task](https://taskfile.dev/)               | Task runner / build tool                                              |                                              Homebrew                                              |
|         [revive](https://github.com/mgechev/revive)         | Go linter                                                             |                                              Homebrew                                              |
|         [Jumpcut](https://github.com/snark/jumpcut)         | Clipboard manager                                                     |                                           Homebrew Cask                                            |
| [Caffeine](https://intelliscapesolutions.com/apps/caffeine) | Prevents your Mac from automatically going to sleep                   |                                           Homebrew Cask                                            |
|     [VeraCrypt](https://www.veracrypt.fr/en/Home.html)      | Disk encryption software                                              |                                           Homebrew Cask                                            |
|              [f.lux](https://justgetflux.com/)              | Adjust the screen colors based on time of day                         |                                           Homebrew Cask                                            |
|       [MacVIM](https://macvim-dev.github.io/macvim/)        | Text editor                                                           |                                           Homebrew Cask                                            |
|                [xbar](https://xbarapp.com/)                 | Put the output of a script into your menu bar                         |                                           Homebrew Cask                                            |
|         [Hammerspoon](https://www.hammerspoon.org/)         | LUA based automation tool                                             |                                           Homebrew Cask                                            |

### Alternative Terminals, Shells, Fonts

|                           Name                            | Description                                                                            |                                            Installation                                            |
|:---------------------------------------------------------:|----------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------:|
|               [iTerm2](http://iterm2.com/)                | My preferred replacement for the OS X terminal program                                 |                                           Homebrew Cask                                            |
|           [fish shell](https://fishshell.com/)            | My preferred shell these days                                                          |                                              Homebrew                                              |
|  [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)   | Package manager for fish shell used to install themes and fish shell related utilities | See latest instructions on homepage. `setup-my-mac.sh` has those instructions as of last check-in. |
| [JetBrains Mono Font](https://www.jetbrains.com/lp/mono/) | Programmer friendly font                                                               |                                           Homebrew Cask                                            |

### Programming IDEs & Tools

|                      Name                       | Description                                          | Installation  |
|:-----------------------------------------------:|------------------------------------------------------|:-------------:|
| [PHPStorm](https://www.jetbrains.com/phpstorm/) | JetBrains IDE for PHP development                    | Homebrew Cask |
|     [GoLand](https://www.jetbrains.com/go/)     | JetBrains IDE for Go development                     | Homebrew Cask |
| [WebStorm](https://www.jetbrains.com/webstorm/) | JetBrains IDE for JavaScript development             | Homebrew Cask |
| [DataGrip](https://www.jetbrains.com/datagrip/) | JetBrains IDE for SQL / database development         | Homebrew Cask |
|        [OrbStack](https://orbstack.dev/)        | Fast, lightweight Docker and Linux container runtime | Homebrew Cask |
|           [PHP](https://www.php.net/)           | PHP 8.5 programming language                         |   Homebrew    |

### Web Browsers

|                                     Name                                      | Description                                  | Installation  |
|:-----------------------------------------------------------------------------:|----------------------------------------------|:-------------:|
| [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) | Version of Firefox geared towards developers | Homebrew Cask |
|                [Google Chrome](https://www.google.com/chrome/)                | Google's web browser                         | Homebrew Cask |

### Chat & Social Media

|              Name               | Description                 | Installation  |
|:-------------------------------:|-----------------------------|:-------------:|
|   [Slack](https://slack.com/)   | Team communication platform | Homebrew Cask |
| [Discord](https://discord.com/) | Voice, video and text chat  | Homebrew Cask |

### Entertainment

|                                 Name                                 | Description                     | Installation  |
|:--------------------------------------------------------------------:|---------------------------------|:-------------:|
| [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop) | Blizzard gaming client          | Homebrew Cask |
|               [Steam](https://store.steampowered.com/)               | Platform for a variety of games | Homebrew Cask |
|               [GOG Galaxy](https://www.gog.com/galaxy)               | Platform for older games        | Homebrew Cask |
