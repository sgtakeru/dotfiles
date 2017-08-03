export PATH=/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

export ANT_HOME=$HOME/local/app/apache-ant-1.8.4
PATH=$ANT_HOME/bin:$PATH
PATH=$HOME/local/bin:$PATH

ANDROID_HOME=$HOME/local/app/adt-bundle-mac-x86_64-20140702/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

RDS_CLI_TOOL_HOME=$HOME/local/app/RDSCli-1.15.001
export PATH="$RDS_CLI_TOOL_HOME/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Cask for emacs
export PATH="$HOME/.cask/bin:$PATH"

# For homebrew-brewfile
export HOMEBREW_ROOT=/usr/local
export HOMEBREW_BREWFILE=~/.brewfile

export PATH=$ZPLUG_HOME/bin:$PATH

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# rvm default

# nvm と指定されたバージョンの Node.js がインストール済みの場合だけ
# 設定を有効にする
# if [[ -f ~/.node/nvm.sh ]]; then
#   source ~/.node/nvm.sh
# fi

# Node環境用にNコマンドを使う
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# Haskell stack
export PATH="${HOME}/.local/bin:${PATH}"


# The next line updates PATH for the Google Cloud SDK.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc

# for go
export GOPATH=$HOME/local/
