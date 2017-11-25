#!/bin/sh
echo "update git repository"
mkdir -p ~/.vim-backup
cp -r sergeVim ~/.vim_backup
cp vimrc ~/.vimrc_backup
cp ~/.vimrc .
cp -r ~/.vim/sergeVim .
git add -A
git commit -m "update git repository"
git push
