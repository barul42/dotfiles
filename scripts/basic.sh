#!/bin/bash
mkdir ~/git
cd ~/git
git clone https://github.com/barul42/dotfiles
mkdir ~/.bash/
mkdir ~/.vim/
ln -sf ~/git/dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/git/dotfiles/bash/functions.sh ~/.bash/functions.sh
ln -sf ~/git/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/git/dotfiles/vim/colors ~/.vim/colors
ln -sf ~/git/dotfiles/Xresources ~/.Xresources
source ~/.bashrc
