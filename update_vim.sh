#!/bin/sh
echo "update git repository"
find . -iname ".vim_backup" --delete
mkdir ~/.vim-backup
cp ~/.vim ~/.vim_backup
cp ~/.vimrc ~/.vimrc_backup
git add -A
git commit -m "update git repository"
git push
