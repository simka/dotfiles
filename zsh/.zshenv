export ZDOTDIR=$HOME/.zsh
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='firefox'
export TERMINAL="kitty"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
fi

# scripts
export PATH=$PATH:$HOME/.bin

# yarn global packages
export PATH="$(yarn global bin):$PATH"

# android development
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
fi

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
export FZF_DEFAULT_OPTS='
  --height 75% --multi --reverse
'
