# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    update_git.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <tnicolas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 15:20:33 by tnicolas          #+#    #+#              #
#    Updated: 2017/12/05 12:21:56 by tnicolas         ###   ########.fr        #
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
echo "\x1b[35m"
cat sergeHeader
echo "\x1b[0m"
echo "update git repository"
mkdir -p ~/.vim_backup
cp -r sergeVim ~/.vim_backup
cp vimrc ~/.vimrc_backup
cp ~/.vimrc vimrc
if [[ $# -eq 1 && "$1" == "--param" ]]; then
	cp -r `find ~/.vim/sergeVim \( -iname "*" -a -not -iname "*param*" \) | grep "sergeVim/"` sergeVim
else
	cp -r ~/.vim/sergeVim .
fi
git add -A
git commit -m "update git repository"
git push origin master
