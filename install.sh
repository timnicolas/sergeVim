# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnicolas <tnicolas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/26 15:19:15 by tnicolas          #+#    #+#              #
#    Updated: 2017/11/26 15:20:30 by tnicolas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
echo "\x1b[32m"
cat sergeheader
echo "\x1b[0m"
cp ~/.vimrc ~/.vimrc_old_config
cp vimrc ~/.vimrc
if [ -d "~/.vim" ]; then
	rm -rf ~/.vim
fi
mkdir -p ~/.vim
cp -r sergeVim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim 'source ~/.vimrc' '+PluginInstall' '+q' '+q'
