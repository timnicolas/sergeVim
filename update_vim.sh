# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    update_vim.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <tnicolas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 15:20:39 by tnicolas          #+#    #+#              #
#    Updated: 2017/11/26 18:15:52 by tnicolas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
echo "\x1b[33m"
cat sergeHeader
echo "\x1b[0m"
echo "update vim config"
git pull
mkdir -p ~/.vim-backup
cp -r ~/.vim/sergeVim ~/.vim_backup
cp ~/.vimrc ~/.vimrc_backup
cp vimrc ~/.vimrc
mkdir -p ~/.vim
mkdir -p ~/.vim/sergeVim
if [ "$1" == "--param" ]; then
	cp -r sergeVim ~/.vim
else
	cp -r `find sergeVim \( -iname "*" -a -not -iname "*param*" \) | grep "/"` ~/.vim/sergeVim
fi
vim 'source ~/.vimrc' '+PluginInstall' '+q' '+q'
