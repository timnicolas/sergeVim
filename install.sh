#!/bin/sh
cp ~/.vimrc ~/.vimrc_old_config
cp vimrc ~/.vimrc
mkdir -p ~/.vim
cp -r sergeVim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim 'source ~/.vimrc' '+PluginInstall' '+q' '+q'
