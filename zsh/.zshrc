source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "lukechilds/zsh-nvm"
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

# SOURCE THINGS
# z
. ~/.z/z.sh
_Z_DATA=~/.z/data

# tmuxinator
source ~/.tmuxinator/tmuxinator.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# PROMPT
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
PURE_CMD_MAX_EXEC_TIME=10

# COMPLETION
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# BINDINGS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# add ruby gems to path
path+=('/home/simka/.gem/ruby/2.5.0/bin')
export PATH

# VARIABLES
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='chromium'
export PAGER="most"

# ALIASES
alias emx="emacsclient -c"
alias emt="emacsclient -t"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias ld='exa -d */'        # only directories
alias ll='exa -la'          # all
alias ll='exa -lagh --git'  # all with details

