alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lf='ls -f'
alias 162='cd ~/Documents/CS162'
alias os='cd ~/Documents/CS162/nachos'
alias 170='cd ~/Documents/CS170'

export EDITOR=vi

export ANDROIDSDK=~/adt-bundle-mac-x86_64/sdk



# show git branch in terminal prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# If possible, add tab completion for many more commands
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$PATH:$ANDROIDSDK/platform-tools
export PATH=$PATH:$ANDROIDSDK/tools
export PATH=$PATH:/usr/local/texlive/2012/bin/universal-darwin
export PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p362
export PATH=/usr/local/bin:$PATH
export PATH=~/Documents/CS162/nachos/bin:$PATH
export PATH=~/bin:$PATH

# For java
export CLASSPATH=~/Documents/CS162/nachos/unittest/lib/*:.:nachos:~/Documents/CS162/nachos/unittest:~/Documents/CS162/proj3

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
