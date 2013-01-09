VIMHOME=~/.vim

default: install

install: symlink submodule

submodule: 
	cd $$VIMHOME ; 
	git submodule update --init

# creates symbolic links in ~ to all the dotfile (and directories) in this 
# directory
symlink:
	find . -maxdepth 1 -name ".*" \
		-not -name ".git" \
		-not -name "." \
		-not -name ".." \
		-print0 | \
		xargs -o -0 -I {} bash -c \
			'if [ ! -L ~/{} ] ; then ln -sv `pwd`/{} ~/{} ; fi'

# clean target is commented out because it is unsafe but left here for reference
#clean:
#	find . -maxdepth 1 -name ".*" \
#		-not -name ".git" \ 
#		-not -name "." \
#		-not -name ".." \
#		-print0 | \
#		xargs -o -0 -I {} rm -rf ~/{}
