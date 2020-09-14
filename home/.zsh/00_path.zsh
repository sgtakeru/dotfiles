export PATH=/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

PATH=$HOME/local/bin:$PATH

# for gnu coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH="$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Cask for emacs
export PATH="$HOME/.cask/bin:$PATH"

# For homebrew-brewfile
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_PREFIX=/usr/local
export HOMEBREW_BREWFILE=~/.brewfile

# For nodenv
eval "$(nodenv init -)"

# Haskell stack
export PATH="${HOME}/.local/bin:${PATH}"

# for Google Cloud SDK.
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# for go
export GOPATH=$HOME/local
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on

# for flutter
export PATH="$PATH:$HOME/local/app/flutter/bin"

# for gmk
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/avr-gcc@7/lib"

# for Java
export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

# for ncurses
export PKG_CONFIG="/usr/local/bin/pkg-config"

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"
export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/readline/lib/pkgconfig"


export PATH=/usr/local/Cellar/jmeter/5.3/libexec/bin:${PATH}
