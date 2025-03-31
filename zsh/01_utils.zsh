# is_exists returns true if executable $1 exists in $PATH
is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

# has is wrapper function
has() {
    is_exists "$@"
}

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
  local max_loop_count=${1:-10}
  local max_recursive_count=${2:-6}
  say "are you ready?"
  sleep 1

  for count in {1..$max_loop_count}; do
    say "start ${count}"
    sleep 1
    for time in {1..$max_recursive_count}; do
      say ${time}
      sleep 0.8
    done
    say "finish!"
    sleep 0.8
  done
  say "done"
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
