#!/bin/sh
echo "update vim config"
git pull
mkdir -p ~/.vim-backup
cp -r ~/.vim/sergeVim ~/.vim_backup
cp ~/.vimrc ~/.vimrc_backup
cp vimrc ~/.vimrc
mkdir -p ~/.vim
cp -r sergeVim ~/.vim
vim 'source ~/.vimrc' '+PluginInstall' '+q' '+q'
