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

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ -f ~/.zsh/.p10k.zsh ]] && source ~/.zsh/.p10k.zsh

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
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light Valodim/zsh-curl-completion

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit load romkatv/powerlevel10k

zinit ice from"gh-r" as"program"
zinit load x-motemen/ghq

zinit snippet ~/.zsh/00_utils.zsh
zinit snippet ~/.zsh/01_define_function.zsh
zinit snippet ~/.zsh/02_keybinds.zsh
zinit snippet ~/.zsh/03_path.zsh
zinit snippet ~/.zsh/04_aliases.zsh
zinit snippet ~/.zsh/08_zsh_setting.zsh
zinit snippet ~/.zsh/90_project_alias.zsh
zinit snippet ~/.zsh/99_work.zsh