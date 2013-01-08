default: install

# creates symbolic links in ~ to all the dotfile (and directories) in this 
# directory
install:
	find . -maxdepth 1 -name ".*" \
		-not -name ".git" \
		-not -name "." \
		-not -name ".." \
		-print0 | \
		xargs -o -0 -I {} ln -siv `pwd`/{} ~/{}

# clean target is commented out because it is unsafe but left here for reference
#clean:
#	find . -maxdepth 1 -name ".*" \
#		-not -name ".git" \ 
#		-not -name "." \
#		-not -name ".." \
#		-print0 | \
#		xargs -o -0 -I {} rm -rf ~/{}
