# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    update_vim.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <tnicolas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 15:20:39 by tnicolas          #+#    #+#              #
#    Updated: 2017/12/15 11:21:48 by tnicolas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                      __      ___                             #
#                                      \ \    / (_)                            #
#                 ___  ___ _ __ __ _  __\ \  / / _ _ __ ___                    #
#                / __|/ _ \ '__/ _` |/ _ \ \/ / | | '_ ` _ \                   #
#                \__ \  __/ | | (_| |  __/\  /  | | | | | | |                  #
#                |___/\___|_|  \__, |\___| \/   |_|_| |_| |_|                  #
#                               __/ |                                          #
#                              |___/                                           #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
echo "\x1b[33m"
cat sergeHeader
echo "\x1b[0m"
echo "update vim config"
git pull origin master
mkdir -p ~/.vim_backup
cp -r ~/.vim/sergeVim ~/.vim_backup
cp ~/.vimrc ~/.vim_backup/vimrc
cp vimrc ~/.vimrc
mkdir -p ~/.vim
mkdir -p ~/.vim/sergeVim
if [[ $# -eq 1 && "$1" == "--param" ]]; then
	cp -r `find sergeVim \( -iname "*" -a -not -iname "*setting*" \) | grep "/"` ~/.vim/sergeVim
else
	cp -r sergeVim ~/.vim
fi
echo "let g:pwdGitSergeVim='"`pwd`"'" > ~/.vim/sergePwd.vim
vim 'source ~/.vimrc' '+PluginInstall' '+q' '+SergeAlias' '+q'
