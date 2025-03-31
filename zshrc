# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=(~/.zsh $fpath)

### zi
# install
if [[ ! -d "${HOME}/.zi" ]]; then
  zi_home="${HOME}/.zi" && mkdir -p $zi_home
  git clone https://github.com/z-shell/zi.git "${zi_home}/bin"
fi

# intialize
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
### zi

# p10k
zi ice depth'1' atload"[[ ! -f ~/Dropbox/Mackup/dotfiles/p10k.zsh ]] || source ~/Dropbox/Mackup/dotfiles/p10k.zsh" nocd
zi light romkatv/powerlevel10k

zstyle ":history-search-multi-word" page-size "20"

# load plugins
zi light-mode for \
  zsh-users/zsh-autosuggestions \
  zdharma/fast-syntax-highlighting \
  zsh-users/zsh-completions \
  Valodim/zsh-curl-completion \
  wfxr/forgit \
  z-shell/F-Sy-H \
  z-shell/H-S-MW

# [fzf](https://github.com/junegunn/fzf)
zi ice from"gh-r" as"program"
zi light @junegunn/fzf

# [ghq](https://github.com/x-motemen/ghq)
zi ice from"gh-r" as"program" pick"*/ghq"
zi light x-motemen/ghq

zi ice wait lucid pick"h.sh"
zi light paoloantinori/hhighlighter

# [ripgrep](https://github.com/BurntSushi/ripgrep)
if [ `uname -m` = 'arm64' ]; then
    zi ice from"gh-r" as"program" bpick"*aarch64-apple-darwin*" pick"rg"
    zi light microsoft/ripgrep-prebuilt
fi

# # [bat](https://github.com/sharkdp/bat)
zi ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zi light sharkdp/bat

# # [fd](https://github.com/sharkdp/fd)
zi ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zi light sharkdp/fd

# [delta](https://github.com/dandavison/delta)
zi ice as"program" from"gh-r" pick"*/delta"
zi light dandavison/delta

# [direnv](https://github.com/direnv/direnv)
zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv


zi ice wait'1' lucid pick'init.sh'
zi light "b4b4r07/enhancd"

zi snippet ~/.zsh/00_path.zsh
zi snippet ~/.zsh/01_utils.zsh
zi snippet ~/.zsh/02_keybinds.zsh
zi snippet ~/.zsh/03_aliases.zsh
zi snippet ~/.zsh/05_zsh_setting.zsh
zi snippet ~/.zsh/99_work.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

eval "$(/Users/shigemori/.local/bin/mise activate zsh)"
