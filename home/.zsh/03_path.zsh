export PATH=/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

PATH=$HOME/local/bin:$PATH

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH="$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$PATH"

RDS_CLI_TOOL_HOME=$HOME/local/app/RDSCli-1.15.001
export PATH="$RDS_CLI_TOOL_HOME/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Cask for emacs
export PATH="$HOME/.cask/bin:$PATH"

# For homebrew-brewfile
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_ROOT=/usr/local
export HOMEBREW_BREWFILE=~/.brewfile

export PATH=$ZPLUG_HOME/bin:$PATH

# For nodenv
eval "$(nodenv init -)"

# Haskell stack
export PATH="${HOME}/.local/bin:${PATH}"

# The next line updates PATH for the Google Cloud SDK.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc

# for go
export GOPATH=$HOME/local
export PATH=$PATH:$GOPATH/bin

# for flutter
export PATH="$PATH:$HOME/local/app/flutter/bin"

# for gmk
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/avr-gcc@7/lib"
