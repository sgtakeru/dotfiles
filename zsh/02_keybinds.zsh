

function git-branch-fzf() {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | perl -pne 's{^refs/heads/}{}' | fzf --query "$LBUFFER")

  if [ -n "$selected_branch" ]; then
    BUFFER="git sw ${selected_branch}"
    zle accept-line
  fi
  zle reset-prompt
}

zle -N git-branch-fzf
bindkey "^g^b" git-branch-fzf


function ghq-fzf() {
    local selected_dir=$(ghq list | fzf --query="$LBUFFER")

    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq root)/${selected_dir}"
        zle accept-line
    fi

    zle reset-prompt
}

zle -N ghq-fzf
bindkey "^]" ghq-fzf

# expand global aliases by space
# http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
  if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
    zle _expand_alias
    # zle expand-word
  fi
  zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space
bindkey -M isearch " " magic-space

export EMOJI_CLI_KEYBIND="^x^e"
