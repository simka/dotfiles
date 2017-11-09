source ~/.zplug/init.zsh

# HISTORY
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# VARIABLES
export EDITOR='nvim'
export BROWSER='chromium'

# SOURCE THINGS
source ~/dotfiles/scripts/most.sh

# Z - https://github.com/rupa/z
. ~/z/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# PLUGINS
zplug "chrissicool/zsh-256color"
zplug "djui/alias-tips"
zplug "peterhurford/git-it-on.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "lib/git", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

zplug "zsh-users/zsh-history-substring-search"

NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"
zplug "lukechilds/zsh-better-npm-completion", defer:2

# PROMPT
autoload -Uz compinit promptinit
promptinit
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
PURE_PROMPT_SYMBOL=φ
PURE_GIT_DOWN_ARROW=▼
PURE_GIT_UP_ARROW=▲
PURE_CMD_MAX_EXEC_TIME=10
prompt pure

# COMPLETION
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# BINDINGS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ALIASES
alias vi='nvim'
alias vim='nvim'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias la='ls -AF'          # all files
alias ld='ls -d */'        # only directories
alias ll='exa -lagh --git' # all with details

# install plugins if listed and not installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
