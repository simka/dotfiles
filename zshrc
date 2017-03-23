# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# nvm
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# autojump
source /etc/profile.d/autojump.zsh

# aliases
source ~/.aliases