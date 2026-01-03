# Set up my Mac

> [!NOTE]
> - **Latest silicon used:** Apple M4 Max
> - **Latest macOS version used:** `Tahoe 26.0.1`

> [!WARNING]
> The latest run had some hiccups. Here are known issues:
>
> - Homebrew installed but was not available for subsequent commands. A fix is applied to the script but has not been
    tested.
> - Some items needed Rosetta to be installed before they could be installed. A fix is applied to the script but has not
    been tested.
> - Installation of oh-my-fish stopped the installation by dropping into fish shell. A fix is applied to the script but
    has not been tested.
> - You need to start xbar before making a symlink to the plugins directory. This is currently commented out.
> - The Battle.net Homebrew cask drops a manual installer on the system. You need to examine the output to find the
    command to run.

## Steps

1. Power on the machine and run through the [initial boot up](./INITIAL-BOOT-UP.md) steps.
2. Make my preferred [system settings changes](./SYSTEM-SETTINGS.md).
3. Open up `Terminal` and run
   `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sprak3000/setup-my-mac/refs/heads/master/setup-my-mac.sh)"`
   to install tools, software, etc.

## What I install

The script performs the following tasks:

- Installs Rosetta for Intel compatibility
- Installs [Homebrew](https://brew.sh/) package manager
- Installs [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font
- Installs and configures [fish shell](https://fishshell.com/) as the default shell
- Installs [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) package manager with `bass` package and `gitstatus`
  theme
- Downloads fish, zsh, vim, and Hammerspoon configuration files from dotfiles repository
- Installs terminal and utilities: iTerm2, autojump, vfox, yt-dlp, jq, tbls, go-task, revive
- Installs system utilities: Jumpcut, Caffeine, Flux, VeraCrypt, xbar, Hammerspoon (with ArrangeDesktop spoon)
- Installs web browsers: Firefox Developer Edition, Google Chrome
- Installs chat clients: Slack, Discord, and Zoom
- Installs JetBrains IDEs: WebStorm, PHPStorm, GoLand, DataGrip
- Installs MacVim
- Installs OrbStack for Docker containers
- Installs PHP 8.5 via shivammathur/php tap
- Installs gaming platforms: GOG Galaxy, Steam, Battle.net
- Creates directories: `~/github.com` and `~/Pictures/wallpaper`

The script detects already installed software and skips reinstallation to prevent errors and save time.
