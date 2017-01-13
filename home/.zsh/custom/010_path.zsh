
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

# Cask for emacs
export PATH="$HOME/.cask/bin:$PATH"

# For homebrew-brewfile
export HOMEBREW_BREWFILE=~/.brewfile

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# rvm default

# nvm と指定されたバージョンの Node.js がインストール済みの場合だけ
# 設定を有効にする
if [[ -f ~/.node/nvm.sh ]]; then
  source ~/.node/nvm.sh
fi

# Haskell stack
export PATH="${HOME}/.local/bin:${PATH}"


# The next line updates PATH for the Google Cloud SDK.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc


# for docker
export DOCKER_HOST=tcp://localhost:2375


# for go
export GOPATH=$HOME/local/

# gradle
source $ZSH_PLUGINS/_gradle


# =====================================================
# Define functions
# =====================================================
# from @metalefty
r-grep() { find . -print0 | xargs -0 grep $@ ;}


function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src


# Search shell history with peco: https://github.com/peco/peco
# Adapted from: https://github.com/mooz/percol#zsh-history-search
if which peco &> /dev/null; then
  function peco_select_history() {
    local tac
    (which gtac &> /dev/null && tac="gtac") || \
      (which tac &> /dev/null && tac="tac") || \
      tac="tail -r"
    BUFFER=$(fc -l -n 1 | eval $tac | \
                peco --layout=bottom-up --query "$LBUFFER")
    CURSOR=$#BUFFER # move cursor
    zle -R -c       # refresh
  }

  zle -N peco_select_history
  bindkey '^X^R' peco_select_history
fi
