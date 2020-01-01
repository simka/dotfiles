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

