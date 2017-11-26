" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    abreviate.vim                                      :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:56:59 by tnicolas          #+#    #+#              "
"    Updated: 2017/11/26 11:57:03 by tnicolas         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"""""""""""""""""""""""""""""""""""""abreviate""""""""""""""""""""""""""""""""""
"main auto with mainn
ab mainn int<tab><tab><tab><tab>main(int ac, char **av)<CR>
			\{<CR>
			\<CR>
			\return(0);<CR>
			\}<esc>4=<up>2<down>i

"test file with testt
ab testt //<d0><CR><left><left><del><del>
			\#include <stdio.h><CR>
			\#include <stdlib.h><CR>
			\#include <unistd.h><CR>
			\#include <limits.h><CR>
			\#include <string.h><CR>
			\#include <ctype.h><CR>
			\<CR>
			\int<tab><tab><tab><tab>main(int ac, char **av)<CR>
			\{<CR>
			\int<tab><tab><tab>i;<CR>
			\<CR>
			\(void)ac;<CR>
			\(void)av;<CR>
			\(void)i;<CR>
			\<CR>
			\<tab>return (0);<CR>
			\}<CR>
			\//</d0><esc>18=<up>15<down>i

"{{
imap {{ {<CR>}<up><CR>
"""""""""""""""""""""""""""""""""""""abreviate""""""""""""""""""""""""""""""""""
