#!/bin/sh
echo "update vim config"
git pull
find . -iname ".vim_backup" --delete
mkdir ~/.vim-backup
cp ~/.vim ~/.vim_backup
cp ~/.vimrc ~/.vimrc_backup
