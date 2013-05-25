VIMHOME=~/.vim

default: install

install: symlink ohmyzsh

ohmyzsh:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

symlink:
	cd ~ ; \
	ln -si {dotfiles/,}.bash_profile ; \
	ln -si {dotfiles/,}.bashrc ; \
	ln -si {dotfiles/,}.cvsignore ; \
	ln -si {dotfiles/,}.ssh ; \
	ln -si {dotfiles/,}.vim ; \
	ln -si {dotfiles/,}.vimbackup ; \
	ln -si {dotfiles/,}.vimrc ; \
	ln -si {dotfiles/,}.zshrc ; \
	cd -
