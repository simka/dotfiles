#!/bin/bash
set -e
echo '======================================='
echo 'RUNNING REFLECTOR'
echo '======================================='
sudo reflector --protocol https --latest 80 --number 50 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING YAY'
echo '======================================='
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ~
rm -rf ~/yay
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING XORG AND I3'
echo '======================================='
yay -S xorg-server xorg-setxkbmap xorg-xmodmap xorg-xrandr xorg-xrdb xorg-xinit xterm xf86-video-intel i3
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING PACKAGES'
echo '======================================='
yay -S alsa-utils alsa-plugins audacity beets calibre chromium compton deadbeef deluge dropbox dunst emacs exa exercism-cli feh firefox fzf gimp gnucash heroku-cli htop httpie jack2-dbus keepassxc kitty lxappearance most nemo neovim networkmanager network-manager-applet newsboat polybar postman-bin qjackctl ranger redshift ripgrep rofi spotify stow tig tmux tree ttf-font-awesome-4 ttf-inter-ui ttf-iosevka-term udiskie virtualbox visual-studio-code-bin vlc xcape zsh
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'SYMLINKING DOTFILES'
echo '======================================='
cd ~/dotfiles
stow compton
stow dunst
stow git
stow i3
stow kitty
stow newsboat
stow nvim
stow polybar
stow rofi
stow scripts
stow tmux
stow tmuxinator
stow x
stow zsh
cd ~
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'SETTING ZSH AS DEFAULT SHELL'
echo '======================================='
chsh -s $(which zsh)
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING MINPAC FOR NEOVIM'
echo '======================================='
git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING ZPLUG'
echo '======================================='
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING Z'
echo '======================================='
git clone https://github.com/rupa/z.git ~/.z
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'ALL TASKS COMPLETED'
echo '======================================='
