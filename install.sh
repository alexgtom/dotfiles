#!/bin/bash

VIMHOME=~/.vim

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git

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


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
