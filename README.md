dotfiles
========

This repository contains my complete configuration on my development laptop. I run a Lenovo Thinkpad T430s laptop for development, running Arch Linux. 

Display Server: X Server
Window Manager: Xmonad
Notification bar: Xmobar
Composition Manager: Compton
Terminal Emulator: URxvt
Shell: Zsh
Network Manager: Netctl

My entire list of installed packages is kept in `pacman.installed.20xx.xx`

Getting all Atom packages and installing them: 
```
apm list --installed --bare > packages.list
apm install --packages-file packages.list
```
