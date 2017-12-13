" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    color.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/08 23:32:11 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/13 10:42:28 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""info"""""""""""""""""""""""""""""""""""""""
"0       0       Black
"1       4       DarkBlue
"2       2       DarkGreen
"3       6       DarkCyan
"4       1       DarkRed
"5       5       DarkMagenta
"6       3       Brown, DarkYellow
"7       7       LightGray, LightGrey, Gray, Grey
"8       0*      DarkGray, DarkGrey
"9       4*      Blue, LightBlue
"10      2*      Green, LightGreen
"11      6*      Cyan, LightCyan
"12      1*      Red, LightRed
"13      5*      Magenta, LightMagenta
"14      3*      Yellow, LightYellow
"15      7*      White

"for 256 colors https://jonasjacek.github.io/colors/

"https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax
"""""""""""""""""""""""""""""""""""""info"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
if g:_enable_color_all == 0
	finish
endif
syntax enable
hi CursorLine ctermbg=236 cterm=none
hi PreProc ctermfg=red
"color function
augroup Syntax
	autocmd!
	autocmd BufEnter * if (expand('%:e') == 'h' || expand('%:e') == 'c' ||
				\expand('%:e') == 'cpp')
"	autocmd BufEnter * hi Color_bigFunction ctermbg=DarkGrey
"	autocmd BufEnter * syn match Color_bigFunction /^{\(\(^}\)\@!.*\n\)\{26}.*/
"	autocmd BufEnter * syn match Color_bigFunction /^{\(\(^}\)\<@!.*\n\)\{26}\zs.*\ze/
	autocmd BufEnter * 	highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd BufEnter *	match ExtraWhitespace /\s\+$/
"	autocmd BufEnter *	syn match Color_hashtag /# *\w\+/
"	autocmd BufEnter * 	hi Color_hashtag ctermfg=red
	autocmd BufEnter * 	syn match Color_function_prototype /\zs\w\+\ze(.*)\|
				\\zs\w\+\ze(.*\n.*)/
	autocmd BufEnter * 	hi Color_function_prototype ctermfg=Blue
	autocmd BufEnter * 	syn match Color_define_name /[A-Z_][A-Z_]\+/
	autocmd BufEnter * 	hi Color_define_name ctermfg=LightBlue
	autocmd BufEnter * 	syn match Color_typedef /\(\w\)\@<!\zst_\w\+\ze/
	autocmd BufEnter * 	hi Color_typedef ctermfg=LightGreen
"	autocmd BufEnter * 	syn match Color_includes /<\(\.\.\/\)*\(\w*\/\)*\w\+\.*
"				\\w*>/
"	autocmd BufEnter * 	hi Color_includes ctermfg=Magenta
	autocmd BufEnter * 	syn match Color_operator /&\||\|\w\zs\*\+\ze\|\zs\*\+
				\\ze\w\|\zs\*\+\ze)\|(\zs\*\+\ze/
	" )
	autocmd BufEnter * 	hi Color_operator ctermfg=Red
	autocmd BufEnter * 	syn match Color_deleteline /\/\/dd.*\|\/\/d\d.*/
	autocmd BufEnter * 	hi Color_deleteline ctermfg=DarkRed
	autocmd BufEnter * 	hi Number ctermfg=DarkGreen
	autocmd BufEnter * 	hi Float ctermfg=DarkGreen
	autocmd BufEnter * endif
augroup END
"hi Color_function_prototype guifg=Blue ctermfg=Blue term=bold
"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
