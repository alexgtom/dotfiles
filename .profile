# PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH

# virtualenvwrapper
export WORKON_HOME="~/.virtualenvs"
[ -r "$(which virtualenvwrapper_lazy.sh)" ] && source "$(which virtualenvwrapper_lazy.sh)"

# aliases
alias vimrc='vi ~/dotfiles/.vimrc'
alias zshrc='vi ~/dotfiles/.zshrc'
alias dotfiles='cd ~/dotfiles'
alias vimfiles='cd ~/.vim'
alias batsapi='workon batsapi && cd ~/bats-api'
alias failtracer='workon failtracer && cd ~/core-os-failtracer'
alias batscli='workon batscli && cd ~/bats-cli'
alias batslib='workon batslib && cd ~/bats-lib'
alias vi=vim
alias tmux='tmux -2'


# variables
export EDITOR=vim

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# rdb
export RDB_ATTACHMENT_DIRECTORY=$HOME/go/src/apple.com/rdb


# docker
export DOCKER_CERT_PATH=/Users/alexgtom/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
