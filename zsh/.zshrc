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

# BINDINGS
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# SETTINGS

# tmuxinator
. ~/.tmuxinator/tmuxinator.zsh

# FZF
. /usr/share/fzf/key-bindings.zsh
. /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
export FZF_DEFAULT_OPTS='
  --height 75% --multi --reverse
'

# bat
export BAT_THEME="1337"

# exa
export EXA_COLORS="uu=38;5;249:un=38;5;241:gu=38;5;245:gn=38;5;241:da=38;5;245:sn=38;5;7:sb=38;5;7:ur=38;5;3;1:uw=38;5;5;1:ux=38;5;1;1:ue=38;5;1;1:gr=38;5;249:gw=38;5;249:gx=38;5;249:tr=38;5;249:tw=38;5;249:tx=38;5;249:fi=38;5;248:di=38;5;253:ex=38;5;1:xa=38;5;12:*.png=38;5;4:*.jpg=38;5;4:*.gif=38;5;4"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# ALIASES
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias ld='exa -d */'        # only directories
alias ll='exa -la'          # all
alias lll='exa -lagh --git'  # all with details

