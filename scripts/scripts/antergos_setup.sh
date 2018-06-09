#!/bin/bash
set -e

echo 'installing pacaur'
sudo pacman -S pacaur --noconfirm --needed
echo 'done'

echo 'installing xorg and i3'
pacaur -S xorg-server xorg-apps xorg-xinit xterm xf86-video-intel i3
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo 'done'
echo 'edit ~/.xinitrc and add exec i3 at the end'

echo 'installing packages'
pacaur -S audacity beets calibre chromium compton deadbeef deja-dup deluge dropbox dunst emacs exa feh firefox gimp gnucash heroku-cli htop httpie keepassxc kitty most nemo neovim networkmanager network-manager-applet newsboat polybar ranger redshift ripgrep rofi soulseekqt spotify stow tig tmux tree udiskie virtualbox virtualbox-host-modules-arch visual-studio-code-bin xcape zsh
echo 'done'

echo 'setting zsh as default shell'
chsh -s $(which zsh)
echo 'done'

echo 'installing zplug'
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
echo 'done'

echo 'installing z'
git clone https://github.com/rupa/z.git ~/z
echo 'done'

echo 'symlinking dotfiles'
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
echo 'done'
