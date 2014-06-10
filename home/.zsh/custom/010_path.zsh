
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export ANT_HOME=$HOME/local/app/apache-ant-1.8.4
PATH=$ANT_HOME/bin:$PATH
PATH=$HOME/local/bin:$PATH
PATH=/usr/local/heroku/bin:$PATH  ## Added by the Heroku Toolbelt

ANDROID_HOME=$HOME/local/app/adt-bundle-mac-x86_64/sdk
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



# The next line updates PATH for the Google Cloud SDK.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
source $HOME/local/app/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc


# source $HOME/.homesick/repos/homeshick/homeshick.sh

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
[ -f /opt/boxen/nvm/nvm.sh ] && source /opt/boxen/nvm/nvm.sh


# =====================================================
# Define functions
# =====================================================
# from @metalefty
r-grep() { find . -print0 | xargs -0 grep $@ ;}

fuction copy_ubuntu_lsb() {
  sudo cp ~/Dropbox/Documents/ubuntu/lsb-release_ubuntu /etc/lsb-release
  sudo cp ~/Dropbox/Documents/ubuntu/issue.net_ubuntu /etc/issue.net
  sudo cp ~/Dropbox/Documents/ubuntu/issue_ubuntu /etc/issue
  cat /etc/issue.net /etc/issue /etc/lsb-release
}

function 256colortest() {
  local code
  for code in {0..255}; do
    echo -e "\e[38;05;${code}m $code: Test"
  done
}

function fukkin() {
  local count
  local time
  espeak "are you ready?"
  sleep 1

  for count in {1..10}; do
    espeak "start ${count}"
    sleep 1

    for time in {1..6}; do
      espeak ${time}
      sleep 0.8
    done
    espeak "finish!"

    sleep 0.8

  done

  espeak "done"

}

function fukkin10() {
  local count
  local time
  espeak "are you ready?"
  sleep 1

  for count in {1..10}; do
    espeak "start ${count}"
    sleep 1

    for time in {1..10}; do
      espeak ${time}
      sleep 0.8
    done
    espeak "finish!"

    sleep 0.8

  done

  espeak "done"

}

function zip_rename() {
  find $1 -name '*.zip' | while read fn; do
     name=`unzip -l ${fn} |uniq | head -n 4 | tail -n 1 | cut -d : -f2 |cut -c 6- |cut -d / -f1`
     mv ${fn} ${name}'.zip'
  done
}
