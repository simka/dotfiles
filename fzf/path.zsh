export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --color=never'
export FZF_DEFAULT_OPTS='--height 60% --multi --reverse'
