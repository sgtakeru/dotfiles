
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi
zplug "b4b4r07/emoji-cli", defer:3

# theme
zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme
# zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug "b4b4r07/ultimate", as:theme
# zplug "S1cK94/minimal", as:theme

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug 'Valodim/zsh-curl-completion'
