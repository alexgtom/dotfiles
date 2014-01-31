# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:~/bin
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:~/adt-bundle-mac-x86_64/sdk/platform-tools
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.gem/bin # Add RVM to PATH for scripting
export PATH=$PATH:/usr/local/share/python
export PATH=$PATH:/usr/texbin

# virtualenvwrapper
export WORKON_HOME="~/.virtualenvs"
[ -r "$(which virtualenvwrapper_lazy.sh)" ] && source "$(which virtualenvwrapper_lazy.sh)"

alias vimrc='vi ~/dotfiles/.vimrc'
alias zshrc='vi ~/dotfiles/.zshrc'
alias dotfiles='cd ~/dotfiles'
alias vimfiles='cd ~/.vim'
alias batsapi='workon batsapi && cd ~/bats-api'
alias failtracer='workon failtracer && cd ~/core-os-failtracer'
alias vi=vim
alias tmux='tmux -2'

export BATS=~/bats-api

export EDITOR=vi

export ANDROIDSDK=~/adt-bundle-mac-x86_64/sdk

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export GEM_HOME=~/.gem
export GEM_PATH=~/.gem
