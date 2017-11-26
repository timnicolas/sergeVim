# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    update_git.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <tnicolas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 15:20:33 by tnicolas          #+#    #+#              #
#    Updated: 2017/11/26 15:20:35 by tnicolas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
echo "\x1b[35m"
cat sergeheader
echo "\x1b[0m"
echo "update git repository"
mkdir -p ~/.vim-backup
cp -r sergeVim ~/.vim_backup
cp vimrc ~/.vimrc_backup
cp ~/.vimrc vimrc
cp -r ~/.vim/sergeVim .
git add -A
git commit -m "update git repository"
git push
