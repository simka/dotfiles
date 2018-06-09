#!/bin/bash
set -e
echo '======================================='
echo 'RUNNING REFLECTOR'
echo '======================================='
sudo reflector --protocol https --latest 80 --number 50 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu
echo 'DONE'

echo '======================================='
echo 'INSTALLING YAY'
echo '======================================='
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ~
rm -rf ~/yay
echo 'DONE'

echo '======================================='
echo 'INSTALLING XORG AND I3'
echo '======================================='
yay -S xorg-server xorg-apps xorg-xinit xterm xf86-video-intel i3
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo 'done'

echo '======================================='
echo 'INSTALLING PACKAGES'
echo '======================================='
yay -S alsa-utils alsa-plugins audacity beets calibre chromium compton deadbeef deja-dup deluge dropbox dunst emacs exa feh firefox gimp gnucash htop httpie jack2-dbus keepassxc kitty lxappearance most nemo neovim networkmanager network-manager-applet newsboat polybar postman-bin qjackctl ranger redshift ripgrep rofi spotify stow tig tmux tree udiskie virtualbox virtualbox-host-modules-arch visual-studio-code-bin xcape zsh
echo 'DONE'

echo '======================================='
echo 'SYMLINKING DOTFILES'
echo '======================================='
cd ~/dotfiles
stow compton
stow dunst
stow fonts
stow git
stow i3
stow kitty
stow newsboat
stow nvim
stow polybar
stow rofi
stow tmux
stow tmuxinator
stow xresources
stow zsh
cd ~
echo 'DONE'

echo '======================================='
echo 'SETTING ZSH AS DEFAULT SHELL'
echo '======================================='
chsh -s $(which zsh)
echo 'DONE'

echo '======================================='
echo 'INSTALLING MINPAC FOR NEOVIM'
echo '======================================='
git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
echo 'DONE'

echo '======================================='
echo 'INSTALLING ZPLUG'
echo '======================================='
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
echo 'DONE'

echo '======================================='
echo 'INSTALLING Z'
echo '======================================='
git clone https://github.com/rupa/z.git ~/z
echo 'DONE'

echo '======================================='
echo 'all tasks done, edit ~/.xinitrc and add exec i3 at the end'
echo '======================================='
