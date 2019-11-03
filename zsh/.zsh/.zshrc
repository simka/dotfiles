# OPTIONS
#
# On slow systems, checking the cached .zcompdump file to see if it must be 
# regenerated adds a noticable delay to zsh startup.  This little hack restricts 
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;

zmodload -i zsh/complist

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

setopt COMPLETE_ALIASES
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=4

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

setopt auto_cd

setopt correct_all # autocorrect commands

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

# PLUGINS
source $ZDOTDIR/.zsh_plugins.sh

# BINDINGS
source $ZDOTDIR/bindings.zsh

# PROMPT
source $ZDOTDIR/prompt.zsh

# ALIASES
source $ZDOTDIR/aliases.zsh


# OTHER
# tmuxinator
source ~/.tmuxinator/tmuxinator.zsh

# fzf
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# asdf
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
