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
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING PACKAGES'
echo '======================================='
yay -S alsa-utils alsa-plugins arc-gtk-theme audacity beets calibre chromium compton deadbeef deluge dropbox dunst emacs exa exercism-cli feh firefox fzf gimp gnome-disk-utility gnucash heroku-cli htop httpie keepassxc kitty lxappearance most nemo neovim networkmanager network-manager-applet newsboat p7zip paper-icon-theme polybar postman-bin python-pip ranger redshift ripgrep rofi spotify stow tig tmux tmuxinator tree ttf-font-awesome-4 ttf-inter-ui ttf-iosevka-term udiskie virtualbox visual-studio-code-bin vlc xcape xclip zathura zathura-pdf-mupdf zsh
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'ENABLING NETWORK MANAGER SERVICE'
echo '======================================='
systemctl enable NetworkManager.service
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'ENABLING REDSHIFT SERVICE'
echo '======================================='
systemctl --user enable redshift.service
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'ADDING USER TO AUDIO GROUP'
echo '======================================='
sudo usermod -aG audio simka
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
echo 'INSTALLING ZPLUG'
echo '======================================='
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING Z'
echo '======================================='
mkdir ~/scripts
git clone https://github.com/rupa/z.git ~/scripts/z
echo '======================================='
echo 'DONE'
echo '======================================='


echo '======================================='
echo 'INSTALLING I3 ALTERNATING LAYOUT SCRIPT'
echo '======================================='
pip install i3-py --user
git clone https://github.com/olemartinorg/i3-alternating-layout ~/scripts/i3-alternating-layout
echo '======================================='
echo 'DONE'
echo '======================================='

echo '======================================='
echo 'INSTALLING TMUX PLUGIN MANAGER'
echo '======================================='
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo '======================================='
echo 'DONE, DON'T FORGET TO INSTALL PLUGINS!
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
echo 'ALL TASKS COMPLETED'
echo '======================================='
