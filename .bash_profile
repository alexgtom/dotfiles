alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lf='ls -f'

export ANDROIDSDK=~/adt-bundle-mac-x86_64/sdk
export EDITOR=vi

export PATH=$PATH:/usr/local/texlive/2012/bin/universal-darwin
export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/StaticAnalyzer:$PATH
export PATH=~/StaticAnalyzer:$PATH
export PATH=$ANDROIDSDK/platform-tools:$PATH
export PATH=$ANDROIDSDK/tools:$PATH

test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Setting PATH for MacPython 2.5
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

# Setting PATH for Python 2.7
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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
[ -f /etc/bash_completion ] && source /etc/bash_completion
