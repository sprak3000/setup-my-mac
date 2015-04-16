# Setup My Mac

## Overview
This repository serves as a checklist for all the software I typically install on a new Mac, setup steps, and any configurations files, etc. needed.

## Setup Steps

### Install Homebrew

[Homebrew](http://brew.sh/) is a package manager for OS X. Useful for managing all the command line software this developer needs. From the command line:

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install Homebrew and Other Packages / Software

```
$ brew install fish
$ brew install ack
$ brew install dos2unix
$ brew install git
$ brew install rbenv
$ brew install ssh-copy-id
$ brew install wget
$ brew install autojump
$ curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
```

### Set Default Command Line Shell to `fish`

```
$ chsh -s /usr/local/bin/fish
```

### Fonts and Colors

* [Solarized Dark theme for iTerm2](http://iterm2colorschemes.com/)
* [Inconsolata font](http://www.levien.com/type/myfonts/inconsolata.html)

## Essential Software

<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://adium.im/" target="_blank">Adium</a></td>
      <td>All the IM clients in one</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://itunes.apple.com/us/app/caffeine/id411246225" target="_blank">Caffeine</a></td>
      <td>Utility for disabling screen / machine sleep. Useful when running long presentations, etc.</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://sourcegear.com/diffmerge/downloads.php" target="_blank">DiffMerge</a></td>
      <td>Diff tool for files and directories</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://filezilla-project.org/download.php?type=client" target="_blank">FileZilla</a></td>
      <td>FTP client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://download.mozilla.org/?product=firefox-aurora-latest-ssl&os=osx&lang=en-US" target="_blank">FireFox Developer Edition</a></td>
      <td>Developer version of FireFox web browser</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://fishshell.com/" target="_blank">Fish Shell</a></td>
      <td>Command line shell (I install via Homebrew)</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://fluidapp.com/" target="_blank">Fluid</a></td>
      <td>Turn web pages / web apps into stand-alone Mac app</td>
      <td>Free / Pay for more features</td>
    </tr>
    <tr>
      <td><a href="https://justgetflux.com/dlmac.html" target="_blank">Flux</a></td>
      <td>Adjusts monitor colors based on time of day</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://github.com/2ndalpha/gasmask" target="_blank">Gas Mask</a></td>
      <td><code>/etc/hosts</code> file manager; lock it down / create versions</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.google.com/chrome/browser/desktop/" target="_blank">Google Chrome</a></td>
      <td>Google's browser (duh)</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.google.com/drive/download/" target="_blank">Google Drive</a></td>
      <td>Keep Google Drive files sync'ed on Mac</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.hipchat.com/downloads" target="_blank">HipChat</a></td>
      <td>Chat client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://brew.sh/" target="_blank">Homebrew</a></td>
      <td>Package manager for OS X</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://iterm2.com/" target="_blank">iTerm2</a></td>
      <td>Replacement for Terminal and the successor to iTerm</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://jumpcut.sourceforge.net/" target="_blank">JumpCut</a></td>
      <td>Clipboard history tool</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://github.com/b4winckler/macvim" target="_blank">MacVim</a></td>
      <td>vi GUI client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.jetbrains.com/phpstorm/download/" target="_blank">PhpStorm</a></td>
      <td>My IDE of choice for PHP / JS programming</td>
      <td>Annual License</td>
    </tr>
    <tr>
      <td><a href="http://robomongo.org/" target="_blank">RoboMongo</a></td>
      <td>MongoDB GUI client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://www.sequelpro.com/download" target="_blank">Sequel Pro</a></td>
      <td>MySQL GUI client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://www.skype.com/en/download-skype/skype-for-computer/" target="_blank">Skype</a></td>
      <td>VoIP / chat client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://slack.com/" target="_blank">Slack</a></td>
      <td>Chat client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.grc.com/misc/truecrypt/truecrypt.htm" target="_blank">TrueCrypt</a></td>
      <td>File / Disk encryption</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://itunes.apple.com/us/app/tweetdeck/id485812721" target="_blank">TweetDeck</a></td>
      <td>Twitter client</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.vagrantup.com/downloads.html" target="_blank">Vagrant</a></td>
      <td>Development machines, development machines, development machines</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://vagrantmanager.com/" target="_blank">Vagrant Manager</a></td>
      <td>Nice GUI for managing Vagrant instances</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.virtualbox.org/wiki/Downloads target="_blank">VirtualBox</a></td>
      <td>Virtual machines for use with Vagrant</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://www.videolan.org/" target="_blank">VLC</a></td>
      <td>Pretty much the only video player you need</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="http://wineskin.urgesoftware.com/tiki-index.php?page=Downloads" target="_blank">WineSkin</a></td>
      <td>Run Windows software, mostly old games, on my Mac</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://www.wireshark.org/download.html" target="_blank">WireShark</a></td>
      <td>Network protocol analyzer</td>
      <td>Free</td>
    </tr>
    <tr>
      <td><a href="https://itunes.apple.com/us/app/xcode/id497799835" target="_blank">Xcode</a></td>
      <td>Apple's iOS / Mac development IDE; command-line tools for it needed for other items in my setup</td>
      <td>Free</td>
    </tr>
  </tbody>
</table>
