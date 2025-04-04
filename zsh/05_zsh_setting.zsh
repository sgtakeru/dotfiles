# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#


HISTFILE=$HOME/dotfiles/zsh/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
REPORTTIME=3                # 3秒以上かかった処理は詳細表示

autoload -Uz compinit
compinit

setopt auto_cd
setopt auto_list            # 補完候補を一覧で表示する
setopt auto_menu            # 補完キー連打で候補順に自動で補完する
setopt auto_pushd           # cd 時に自動でディレクトリスタックに追加する


setopt extended_history # Record start and end time
setopt share_history # share history between terminals
setopt hist_reduce_blanks # reduce extra blank
setopt hist_ignore_dups # 直前と重複するコマンドを記録しない
setopt hist_ignore_all_dups # 既にヒストリにあるコマンドは古い方を削除
setopt hist_ignore_space # Ignore the begining space command to history file
setopt hist_no_store # Remove comannd of 'history' or 'fc -l' from history list
setopt hist_no_functions # Remove functions from history list

# rm * の前に確認をとる
setopt rm_star_wait


# 補完の表示方法
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2


# Completing Groping
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

# 補完で小文字でも大文字にマッチング
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache true
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history

# Directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections truen



# Expand '=command' as path of command
# e.g.) '=ls' -> '/bin/ls'
setopt equals


# Show exit status if it's except zero.
setopt print_exit_value

# Show process ID
setopt long_list_jobs

# Automaticall escape URL when copy and paste
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#929292"

