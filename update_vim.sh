# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    update_vim.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <tnicolas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 15:20:39 by tnicolas          #+#    #+#              #
#    Updated: 2017/11/26 18:37:04 by tnicolas         ###   ########.fr        #
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
git pull
mkdir -p ~/.vim_backup
cp -r ~/.vim/sergeVim ~/.vim_backup
cp ~/.vimrc ~/.vim_backup/vimrc
cp vimrc ~/.vimrc
mkdir -p ~/.vim
mkdir -p ~/.vim/sergeVim
if [[ $# -eq 1 && "$1" == "--param" ]]; then
	cp -r `find sergeVim \( -iname "*" -a -not -iname "*param*" \) | grep "/"` ~/.vim/sergeVim
else
	cp -r sergeVim ~/.vim
fi
vim 'source ~/.vimrc' '+PluginInstall' '+q' '+q'
