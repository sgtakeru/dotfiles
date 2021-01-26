# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=(~/.zsh $fpath)

# if [[ -f ~/.zplug/init.zsh ]]; then
#     export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
#     source ~/.zplug/init.zsh

#     if ! zplug check --verbose; then
#         printf "Install? [y/N]: "
#         if read -q; then
#             echo; zplug install
#         fi
#         echo
#     fi
#     zplug load
# fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zsh/.zinit" && command chmod g-rwX "$HOME/.zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light Valodim/zsh-curl-completion

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit load romkatv/powerlevel10k

zinit ice from"gh-r" as"program"
zinit load x-motemen/ghq

zinit snippet ~/.zsh/00_path.zsh
zinit snippet "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"

zinit snippet ~/.zsh/01_utils.zsh
zinit snippet ~/.zsh/02_keybinds.zsh
zinit snippet ~/.zsh/03_aliases.zsh
zinit snippet ~/.zsh/05_zsh_setting.zsh
zinit snippet ~/.zsh/99_work.zsh

# To customize prompt, run `p10k configure` or edit ~/Dropbox/Mackup/dotfiles/p10k.zsh.
[[ ! -f ~/Dropbox/Mackup/dotfiles/p10k.zsh ]] || source ~/Dropbox/Mackup/dotfiles/p10k.zsh
