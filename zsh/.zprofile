PATH=$PATH:$HOME/.bin

export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='firefox'
export TERMINAL="kitty"

# yarn global packages
export PATH="$PATH:`yarn global bin`"

# android development
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# start X
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
