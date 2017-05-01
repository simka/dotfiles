# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# nvm
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# adb
if [ -d "$HOME/adb/platform-tools" ] ; then
     export PATH="$HOME/adb/platform-tools:$PATH"
fi

# autojump
source /etc/profile.d/autojump.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
source ~/.aliases
