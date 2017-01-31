#!/bin/bash
# .zsh .zshrc .zshrc.alias .zshrc.linux .zshrc.osx .ctags
# .gdbinit .gemrc .inputrc .irbrc .sbtconfig .screenrc .vimrc .vrapperrc import.scala
# .dir_colors .rdebugrc

DOT_FILES=( .aprc .bashrc .brewfile \
                  .gitconfig .gitconfig.local .gitignore_global \
                  .gemrc .irbrc .pryrc .railsshrc .rdebugrc \
                  .keysnail.js .tigrc .tmux.conf \
                  .zsh .zshenv )
# .ssh
# .netrc


for file in ${DOT_FILES[@]}
do
    # TODO 実行時のディレクトリをスクリプトの位置に変更する
    ln -sf $PWD/home/$file $HOME/$file
done


if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

if [ ! -d ~/.zplug ]; then
  curl -sL zplug.sh/installer | zsh
fi
