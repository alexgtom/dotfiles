#!/bin/bash

VIMHOME=~/.vim

cd ~ ; \
ln -si {dotfiles/,}.bash_profile ; \
ln -si {dotfiles/,}.bashrc ; \
ln -si {dotfiles/,}.cvsignore ; \
ln -si {dotfiles/,}.ssh ; \
ln -si {dotfiles/,}.vim ; \
ln -si {dotfiles/,}.vimrc ; \
ln -si {dotfiles/,}.zshrc ; \
ln -si {dotfiles/,}.octaverc ; \
ln -si {dotfiles/,}.gitconfig ; \
ln -si {dotfiles/,}.tmux.conf; \
ln -si {dotfiles/,}.profile; \
ln -si {dotfiles/,}.zpreztorc; \
cd -

mkdir -p ~/.vimbackup
mkdir -p ~/.virtualenvs

# install vim plugins with vundle
vim +BundleInstall +qall
