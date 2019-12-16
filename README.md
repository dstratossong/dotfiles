dotfiles
========

This repository contains my complete configuration on my development laptop. 

## 2019-Present

- Operating System: MacOS
- Laptop: Macbook Pro 2018

## 2017-2019

- Operating System: Debian 9 Linux (on Google Cloud Platform)
- Laptop: Samsung Chromebook Pro
- Editor: Vim
- Terminal Multiplexer: Tmux

## 2014-2017

- Operating System: Arch Linux
- Cloud System: Ubuntu Linux (on Amazon Web Service)
- Laptop: Lenovo Thinkpad T430s
- Display Server: X Server
- Window Manager: Xmonad
- Notification bar: Xmobar
- Composition Manager: Compton
- Terminal Emulator: URxvt
- Shell: Zsh
- Editor: Atom
- Network Manager: Netctl

My entire list of installed packages is kept in `pacman.installed.20xx.xx`
```
yaourt -Qet > pacman.installed.20xx.xx
```

Getting all Atom packages and installing them: 
```
apm list --installed --bare > packages.list
apm install --packages-file packages.list
```
