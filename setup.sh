#!/bin/bash
# .zsh .zshrc .zshrc.alias .zshrc.linux .zshrc.osx .ctags
# .gdbinit .gemrc .inputrc .irbrc .sbtconfig .screenrc .vimrc .vrapperrc import.scala
# .dir_colors .rdebugrc

DOT_FILES=( .aprc .bashrc .brewfile .gemrc .gitconfig .gitignore_global .irbrc .keysnail.js .pryrc .railsshrc .rdebugrc .tigrc .tmux.conf .zsh .zshenv )
# .ssh
# .netrc


for file in ${DOT_FILES[@]}
do
    # TODO 実行時のディレクトリをスクリプトの位置に変更する
    ln -sf $PWD/home/$file $HOME/$file
done
