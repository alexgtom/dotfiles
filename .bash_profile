alias ls='ls -G'
alias ll='ls -l'

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
##
# Your previous /Volumes/Data/Users/alexgtom/.bash_profile file was backed up as /Volumes/Data/Users/alexgtom/.bash_profile.macports-saved_2012-09-22_at_02:26:24
##

# MacPorts Installer addition on 2012-09-22_at_02:26:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Volumes/Data/Users/alexgtom/.bash_profile file was backed up as /Volumes/Data/Users/alexgtom/.bash_profile.macports-saved_2012-09-22_at_02:27:40
##

# MacPorts Installer addition on 2012-09-22_at_02:27:40: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
