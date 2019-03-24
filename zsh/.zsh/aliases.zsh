# antigen
alias antigen-static-bundle='antibody bundle < $ZDOTDIR/.zsh/.zsh_plugins.txt > $ZDOTDIR/.zsh/.zsh_plugins.sh' # regenerate static bundle

# exa
alias ld='exa -d */'        # only directories
alias ll='exa -la'          # all
alias lll='exa -lagh --git'  # all with details

# git
alias g='git'
alias gst='git status'
alias gc='git checkout'
alias gp='git push'
alias gpf='git push --force-with-lease'

# tig
alias tis='tig status'
alias til='tig log'
alias tib='tig blame -C'

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
