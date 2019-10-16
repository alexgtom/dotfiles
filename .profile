# PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH

# virtualenvwrapper
export WORKON_HOME="~/.virtualenvs"
[ -r "$(which virtualenvwrapper_lazy.sh)" ] && source "$(which virtualenvwrapper_lazy.sh)"

# aliases
alias vimrc='vi ~/dotfiles/.vimrc'
alias zshrc='vi ~/dotfiles/.zshrc'
alias dotfiles='cd ~/dotfiles'
alias vimfiles='cd ~/.vim'
alias batsapi='workon batsapi && cd ~/src/bats-api'
alias failtracer='workon failtracer && cd ~/core-os-failtracer'
alias batscli='workon batscli && cd ~/src/bats-cli'
alias batslib='workon batslib && cd ~/src/bats-lib'
alias vi=nvim
alias tmux='tmux -2'
alias shell='workon batsapi && cd ~/src/bats-api && python manage.py shell_plus'


# variables
export EDITOR=vim

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# rdb
export RDB_ATTACHMENT_DIRECTORY=$HOME/go/src/apple.com/rdb

# fzf respect gitignore
export FZF_DEFAULT_COMMAND='ag -g ""'
