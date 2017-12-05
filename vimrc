" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:55:26 by tnicolas          #+#    #+#              "
"    Updated: 2017/11/26 11:55:26 by tnicolas         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" **************************************************************************** "
"                                      __      ___                             "
"                                      \ \    / (_)                            "
"                 ___  ___ _ __ __ _  __\ \  / / _ _ __ ___                    "
"                / __|/ _ \ '__/ _` |/ _ \ \/ / | | '_ ` _ \                   "
"                \__ \  __/ | | (_| |  __/\  /  | | | | | | |                  "
"                |___/\___|_|  \__, |\___| \/   |_|_| |_| |_|                  "
"                               __/ |                                          "
"                              |___/                                           "
"                                                                              "
" **************************************************************************** "

"""""""""""""""""""""""""""""""""""""key""""""""""""""""""""""""""""""""""""""""
"notation in vimrc
"C					Control : <C-w>
"S					Shift : <S-k>
"A / M				Alt : <A-tab>
"<BS>				Backspace
"<Tab>				Tab
"<CR>				Enter
"<Enter>			Enter
"<Return>			Enter
"<Esc>				Escape
"<Space>			Space
"<Up>				Up arrow
"<Down>				Down arrow
"<Left>				Left arrow
"<Right>			Right arrow
"<F1> - <F12>		Function keys 1 to 12
"#1, #2..#9,#0		Function keys F1 to F9, F10
"<Insert>			Insert
"<Del>				Delete
"<Home>				Home
"<End>				End
"<PageUp>			Page-Up
"<PageDown>			Page-Down
"<bar>				the '|' character, which otherwise needs to be escaped '\|'
"""""""""""""""""""""""""""""""""""""key""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""variable"""""""""""""""""""""""""""""""""""
"g:varname			The variable is global
"s:varname			The variable is local to the current script file
"w:varname			The variable is local to the current editor window
"t:varname			The variable is local to the current editor tab
"b:varname			The variable is local to the current editor buffer
"l:varname			The variable is local to the current function
"a:varname			The variable is a parameter of the current function
"v:varname			The variable is one that Vim predefines
"""""""""""""""""""""""""""""""""""""variable"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""Source"""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:help_vim_file='~/.vim/sergeVim/sergeVim_help.vim'
let g:setting_vim_file='~/.vim/sergeVim/setting.vim'
"if has("mouse_sgr")
"	set ttymouse=sgr
"else
"	set ttymouse=xterm2
"endif
source ~/.vim/sergeVim/setting.vim
source ~/.vim/sergeVim/basic_function.vim
source ~/.vim/sergeVim/plugin.vim
source ~/.vim/sergeVim/abreviate.vim
source ~/.vim/sergeVim/function.vim
source ~/.vim/sergeVim/42header.vim
source ~/.vim/sergeVim/emptyHeader.vim
source ~/.vim/sergeVim/sergeVimHeader.vim
source ~/.vim/sergeVim/norm.vim
"""""""""""""""""""""""""""""""""""""Source"""""""""""""""""""""""""""""""""""""
