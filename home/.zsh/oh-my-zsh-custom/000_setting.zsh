# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000



# 3秒以上かかった処理は詳細表示
REPORTTIME=3

# [[ -s "/home/shigemori/.rvm/scripts/rvm" ]] && source "/home/shigemori/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function



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


# nvm と指定されたバージョンの Node.js がインストール済みの場合だけ
# 設定を有効にする
if [[ -f ~/.node/nvm.sh ]]; then
  source ~/.node/nvm.sh
fi

function zip_rename() {
  find $1 -name '*.zip' | while read fn; do
     name=`unzip -l ${fn} |uniq | head -n 4 | tail -n 1 | cut -d : -f2 |cut -c 6- |cut -d / -f1`
     mv ${fn} ${name}'.zip'
  done
}
