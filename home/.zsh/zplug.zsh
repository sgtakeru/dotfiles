
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "~/.zsh/custom", from:local, use:"<->_*.zsh"

zplug "themes/wedisagree", from:oh-my-zsh
# zplug "b4b4r07/ultimate", as:theme
# zplug "S1cK94/minimal", as:theme

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug 'Valodim/zsh-curl-completion'
