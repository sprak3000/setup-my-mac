# Setup My Mac

- **Current Silicon Used:** Apple M1
- **Current OS X Version Used:** `Ventura 13.1`

This repository holds my scripts, configuration files, notes, etc. for the rare occasion of setting up a new Mac for
myself. You will find in here:

- My customizations to various system preferences
- A script to
    - Install a considerable amount of software I use
    - Setup my terminal theme
    - Setup various dotfiles and configuration files.

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

This `bash` script performs the following tasks in order:

- Install [Homebrew](https://brew.sh/).
- Use Homebrew to automatically install various software you would otherwise have to manually install (see `Brewfile`
  for list).
- Setup fish shell to be the default shell.
- Install the [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) package manager.
- Use oh-my-fish to install any fish shell packages and the `gitstatus` theme.
- Create the directories `~/github.com`, `~/Pictures/wallpapers`.
- Remind me of any other software I need to manually download and install.
- Use [chezmoi](https://www.chezmoi.io) to install dotfiles and configuration files.

The script endeavors to only perform a step if necessary. e.g., It attempts to detect already installed software to
prevent trying to inst all it again.

## What I Use

### Utilities

|                            Name                             | Description                                                           |                                            Installation                                            |
|:-----------------------------------------------------------:|-----------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------:|
|                [Homebrew](https://brew.sh/)                 | OS X package manager used to install software                         | See latest instructions on homepage. `setup-my-mac.sh` has those instructions as of last check-in. |
|        [autojump](https://github.com/wting/autojump)        | Utility for quickly changing to previously visited directories        |                                              Homebrew                                              |
|         [yt-dlp](https://github.com/yt-dlp/yt-dlp)          | Utility for downloading videos from YouTube and other streaming sites |                                              Homebrew                                              |
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

### Programming IDEs

|                           Name                           | Description                                  | Installation |
|:--------------------------------------------------------:|----------------------------------------------|:------------:|
|     [PHPStorm](https://www.jetbrains.com/phpstorm/)      | JetBrains IDE for PHP development            |    Manual    |
|         [GoLand](https://www.jetbrains.com/go/)          | JetBrains IDE for Go development             |    Manual    |
|     [WebStorm](https://www.jetbrains.com/webstorm/)      | JetBrains IDE for JavaScript development     |    Manual    |
|     [DataGrip](https://www.jetbrains.com/datagrip/)      | JetBrains IDE for SQL / database development |    Manual    |

### Web Browsers

|                                     Name                                      | Description                                  | Installation  |
|:-----------------------------------------------------------------------------:|----------------------------------------------|:-------------:|
| [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) | Version of Firefox geared towards developers | Homebrew Cask |

### Chat & Social Media

|                Name                | Description    | Installation  |
|:----------------------------------:|----------------|:-------------:|
|    [Slack](https://slack.com/)     |                |   App Store   |
|  [Discord](https://discord.com/)   |                | Homebrew Cask |

### Entertainment

|                                 Name                                 | Description                     | Installation  |
|:--------------------------------------------------------------------:|---------------------------------|:-------------:|
| [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop) | Blizzard gaming client          |    Manual     |
|               [Steam](https://store.steampowered.com/)               | Platform for a variety of games | Homebrew Cask |
|               [GOG Galaxy](https://www.gog.com/galaxy)               | Platform for older games        | Homebrew Cask |
