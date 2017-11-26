#!/bin/sh
echo -n "\x1b[35m"
cat sergeheader
echo -n "\x1b[0m"
echo "update git repository"
mkdir -p ~/.vim-backup
cp -r sergeVim ~/.vim_backup
cp vimrc ~/.vimrc_backup
cp ~/.vimrc vimrc
cp -r ~/.vim/sergeVim .
git add -A
git commit -m "update git repository"
git push
