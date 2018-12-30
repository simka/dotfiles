source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "djui/alias-tips"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# source plugins and add commands to $PATH
zplug load

# HISTORY
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# COMPLETION
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=4

# PROMPT
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
PURE_CMD_MAX_EXEC_TIME=10

# tiny care terminal
export TTC_REPOS='/home/simka/code' 
export TTC_WEATHER='Wroclaw'
export TTC_APIKEYS=false

# BINDINGS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# SOURCE
# tmuxinator
. ~/.tmuxinator/tmuxinator.zsh

# z
. ~/scripts/z/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# exa
export EXA_COLORS="uu=38;5;249:un=38;5;241:gu=38;5;245:gn=38;5;241:da=38;5;245:sn=38;5;7:sb=38;5;7:ur=38;5;3;1:uw=38;5;5;1:ux=38;5;1;1:ue=38;5;1;1:gr=38;5;249:gw=38;5;249:gx=38;5;249:tr=38;5;249:tw=38;5;249:tx=38;5;249:fi=38;5;248:di=38;5;253:ex=38;5;1:xa=38;5;12:*.png=38;5;4:*.jpg=38;5;4:*.gif=38;5;4"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# ALIASES
alias emx="emacsclient -c"
alias emt="emacsclient -t"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias ld='exa -d */'        # only directories
alias ll='exa -la'          # all
alias ll='exa -lagh --git'  # all with details

