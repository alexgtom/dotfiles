#!/bin/bash

VIMHOME=~/.vim

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

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
cd -

mkdir -p ~/.vimbackup
mkdir -p ~/.virtualenvs

# install vim plugins with vundle
vim +BundleInstall +qall

# zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
