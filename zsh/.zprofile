PATH=$PATH:$HOME/.bin

export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='firefox'
export PAGER="most"
export TERMINAL="kitty"


if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
