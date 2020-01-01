# dotfiles

My personal dotfiles for ArchLinux/Manjaro/etc. and macOS. Managed by dotbot, topical structure inspired by Zach Holman.

## requirements

Installation script assumes you have `yay` if on Arch or `homebrew` if on macOS installed. That's about it.

## installation

Run `install` script in the root of this repo. This will clear dead symlinks in `~` and `~/.config`, install necessary packages (TODO) using `yay` or `homebrew` and symlink configs as necessary.
