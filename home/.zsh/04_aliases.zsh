alias ls='ls -GF'
alias grep='grep --color'
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias du='du -h'
alias lv='lv -c'
alias tree='tree -C'

if has 'git'; then
    alias gst='git status'
    alias g="git"
    alias git-delete-local-branches="git branch --merged | grep -vE '^\*|master$|develop$' | xargs -p -I % git branch -d %"
fi


# Common aliases
alias l="ls -l"
alias ld='ls -ld'          # Show info about the directory
alias ll='ls -l'          # Show long file information
alias la='ls -A'          # Show hidden files
alias lla='ls -lA'        # Show hidden all files
alias lx='ls -lXB'         # Sort by extension
alias lk='ls -lSr'         # Sort by size, biggest last
alias lc='ls -ltcr'        # Sort by and show change time, most recent last
alias lu='ls -ltur'        # Sort by and show access time, most recent last
alias lt='ls -ltr'         # Sort by date, most recent last
alias lr='ls -lR'          # Recursive ls
alias ldot='ls -ld .*'

alias dud='du -hd 1'
alias duf='du -hs *'

alias h="history"
alias t='tail -f'

alias delete_sharp='find . -name "*#*" -exec rm -i {} \;'
alias delete_white="grep -Er '^#$' . '"


alias ec='emacsclient'
alias ecc='emacsclient -c'

# ruby rails
alias be='bundle exec'
alias r=rails
alias rsu='rails s -u'

# tmux
alias tmux='tmux -2'
alias mux='tmux -2'

# less option
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# zsh
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'

# Use if colordiff exists
if has 'colordiff'; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

# Global aliases
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g X='| xargs'
alias -g L="| less"
alias -g F='| "$(available $INTERACTIVE_FILTER)"'
alias -g S="| sort"
alias -g N=" >/dev/null 2>&1"
alias -g N1=" >/dev/null"
alias -g N2=" 2>/dev/null"

if has "jq"; then
    alias -g J='| jq .'
fi


# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

