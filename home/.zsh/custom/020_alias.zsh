
# directory shortcut
alias dr="cd ~/Dropbox"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias cd-android='cd ~/local/android-sdk-linux'

alias h="history"
alias l='ls -l'
alias la='ls -lA'
alias lv='lv -c'
alias cp='cp -irp'

alias afind='ack-grep -il'
alias 'gr'='grep --color=auto -RUIn'
alias tree='tree -C'
alias jman='LANG=ja_JP.utf8 man'

alias delete_sharp='find . -name "*#*" -exec rm -i {} \;'
alias delete_white="grep -Er '^#$' . '"

alias ec='emacsclient'
alias ecc='emacsclient -c'

# ruby rails
alias be='bundle exec'
alias r=rails
alias rsu='rails s -u'

# git
alias g.s='git status'

# tmux
alias tmux='tmux -2'
alias mux='tmux -2'

# less option
export LESS='-R'
export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'


alias vi='nvim'
alias vim='nvim'

# =====================================================
# Define functions
# =====================================================


# =====================================================
# from @metalefty
r-grep() { find . -print0 | xargs -0 grep $@ ;}


# =====================================================
# ターミナル上に256カラーを表示
function 256colortest() {
  local code
  for code in {0..255}; do
    echo -e "\e[38;05;${code}m $code: Test"
  done
}

# =====================================================
# トレーニング用カウントダウン(ubuntu)
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

# =====================================================
# とあるディレクトリにあるZIPのファイル名を、ZIP内のファイル名で置き換える
function zip_rename() {
  find $1 -name '*.zip' | while read fn; do
     name=`unzip -l ${fn} |uniq | head -n 4 | tail -n 1 | cut -d : -f2 |cut -c 6- |cut -d / -f1`
     mv ${fn} ${name}'.zip'
  done
}

# =====================================================
# ubuntoのリリース情報の設定をバックアップから復元
# linux-mintをいれて壊れたため。
fuction copy_ubuntu_lsb() {
  sudo cp ~/Dropbox/Documents/ubuntu/lsb-release_ubuntu /etc/lsb-release
  sudo cp ~/Dropbox/Documents/ubuntu/issue.net_ubuntu /etc/issue.net
  sudo cp ~/Dropbox/Documents/ubuntu/issue_ubuntu /etc/issue
  cat /etc/issue.net /etc/issue /etc/lsb-release
}



# =====================================================
# FOR zeus
function  rezeus() {
  rm -f .zeus.sock
  ps -ef | grep zeus | awk ' { print $2 } ' | xargs kill -9 | true
  zeus start
}
