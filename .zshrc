# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/alexgtom/bin:/Users/alexgtom/Documents/CS162/nachos/bin:/usr/local/bin:/Users/alexgtom/.rvm/gems/ruby-1.9.3-p362/bin:/Users/alexgtom/.rvm/gems/ruby-1.9.3-p362@global/bin:/Users/alexgtom/.rvm/rubies/ruby-1.9.3-p362/bin:/Users/alexgtom/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin:/Users/alexgtom/adt-bundle-mac-x86_64/sdk/platform-tools:/Users/alexgtom/adt-bundle-mac-x86_64/sdk/tools:/usr/local/texlive/2012/bin/universal-darwin:/usr/local/Cellar/ruby/1.9.3-p362


alias 162='cd ~/Documents/CS162'
alias os='cd ~/Documents/CS162/nachos'
alias 170='cd ~/Documents/CS170'

export EDITOR=vi

export ANDROIDSDK=~/adt-bundle-mac-x86_64/sdk

