export PATH=/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

PATH=$HOME/local/bin:$PATH

# for gnu coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# for android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

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
#export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home"
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

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
