# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
REPORTTIME=3                # 3秒以上かかった処理は詳細表示

setopt extended_history     # 履歴ファイルに時刻を記録
setopt hist_ignore_all_dups # 既にヒストリにあるコマンドは古い方を削除
setopt hist_reduce_blanks   # コマンドラインの余計なスペースを削除
setopt share_history        # ターミナル間で履歴を共有する
