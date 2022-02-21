if [ `uname -m` = 'arm64' ]; then
    HOMEBREW_BASE="/opt/homebrew"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    HOMEBREW_BASE="/usr/local"
    export HOMEBREW_PREFIX=$HOMEBREW_BASE
    export PATH="${HOMEBREW_BASE}/sbin:${PATH}"

    # for ncurses
    export PKG_CONFIG="/usr/local/bin/pkg-config"
    export PATH="/usr/local/opt/ncurses/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/ncurses/lib"
    export CPPFLAGS="-I/usr/local/opt/ncurses/include"
    export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"
    export LDFLAGS="-L/usr/local/opt/libffi/lib"
    export CPPFLAGS="-I/usr/local/opt/libffi/include"
    export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
fi

# for gnu coreutils
export PATH="${HOMEBREW_BASE}/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="${HOMEBREW_BASE}/opt/coreutils/libexec/gnuman:${MANPATH}"

export PATH=$HOME/local/bin:$PATH

# for android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# For nodenv
eval "$(nodenv init -)"

# for go
export GOPATH=$HOME/local
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on

# for Java
#export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
PATH=${JAVA_HOME}/bin:${PATH}

export THOR_MERGE="code -d $1 $2"
