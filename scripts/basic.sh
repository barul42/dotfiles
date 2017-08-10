#!/bin/bash
mkdir ~/git && cd ~/git
git clone https://github.com/barul42/dotfiles
mkdir ~/.bash/ ~/.vim/
mkdir -p ~/.config/{i3,i3status}
ln -sf ~/git/dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/git/dotfiles/bash/functions.sh ~/.bash/functions.sh
ln -sf ~/git/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/git/dotfiles/vim/colors ~/.vim/colors
ln -sf ~/git/dotfiles/Xresources ~/.Xresources
ln -sf ~/git/dotfiles/xinitrc ~/.xinitrc
ln -sf ~/git/dotfiles/i3/config ~/.config/i3/
ln -sf ~/git/dotfiles/i3/i3status/config ~/.config/i3status/
source ~/.bashrc
