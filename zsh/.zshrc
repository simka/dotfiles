source ~/antigen.zsh

antigen bundle ssh-agent
antigen bundle git
antigen bundle node
antigen bundle rupa/z
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

# HISTORY
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# SOURCE THINGS

# tmuxinator completions
source ~/.tmuxinator/tmuxinator.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# PROMPT
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
PURE_GIT_DOWN_ARROW=▼
PURE_GIT_UP_ARROW=▲
PURE_CMD_MAX_EXEC_TIME=10

# COMPLETION
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# BINDINGS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# VARIABLES
export EDITOR='nvim'
export BROWSER='chromium'
export PAGER="most"

# ALIASES
alias vi='nvim'
alias vim='nvim'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias la='ls -AF'          # all files
alias ld='ls -d */'        # only directories
alias ll='exa -lagh --git' # all with details

