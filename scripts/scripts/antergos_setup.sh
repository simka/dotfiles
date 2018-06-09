echo 'installing pacaur'
sudo pacman -S pacaur --noconfirm --needed
echo 'done'

echo 'installing xorg etc.'
pacaur -S xorg-server xorg-apps xorg-xinit xterm xf86-video-intel i3 --noconfirm --needed
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo 'done'
echo 'edit ~/.xinitrc and add exec i3 at the end'

echo 'installing packages'
pacaur -S audacity beets calibre chromium compton deadbeef deja-dup deluge dropbox dunst emacs exa feh firefox gimp gnucash heroku-cli htop httpie keepassxc kitty most nemo neovim networkmanager nm-applet newsboat polybar ranger redshift ripgrep rofi soulseekqt spotify stow tig tmux tree udiskie virtualbox virtualbox-host-modules-arch visual-studio-code xcape zsh
echo 'done'

echo 'setting zsh as default shell'
chsh -s $(which zsh)
echo 'done'

echo 'symlinking dotfiles'
stow coloschemes
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
