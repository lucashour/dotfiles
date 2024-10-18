# zsh tmux settings
ZSH_TMUX_AUTOSTART="true"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

### Path

# Home binaries
export PATH="$HOME/bin:$PATH"

# MacOS fork error workaround (https://github.com/rtomayko/shotgun/issues/69#issuecomment-338401331)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# GPG
export GPG_TTY=$(tty)

# fzf
source <(fzf --zsh)

### Alias

# Git
alias gcommit='git commit -S -m $($1)'

# Rails
alias rs='rails s'
alias rc='rails c'

# General Utilities
alias v='nvim'
