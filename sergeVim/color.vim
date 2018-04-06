" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    color.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/08 23:32:11 by tnicolas          #+#    #+#              "
"    Updated: 2018/02/07 14:15:07 by tnicolas         ###   ########.fr        "
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

"to know inforation about the color under cursor:
" :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
"""""""""""""""""""""""""""""""""""""info"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
if g:_enable_color_all == 0
	finish
endif
syntax enable
hi CursorLine ctermbg=237 cterm=none
hi PreProc ctermfg=red
"color function
augroup Syntax
	autocmd!
	" C language
	autocmd BufEnter * if (expand('%:e') == 'h' || expand('%:e') == 'c' ||
				\expand('%:e') == 'cpp')
"	autocmd BufEnter * hi Color_bigFunction ctermbg=DarkGrey
"	autocmd BufEnter * syn match Color_bigFunction /^{\(\(^}\)\@!.*\n\)\{26}.*/
"	autocmd BufEnter * syn match Color_bigFunction /^{\(\(^}\)\<@!.*\n\)\{26}\zs.*\ze/
	autocmd BufEnter * 	hi ExtraWhitespace ctermbg=red guibg=red
	autocmd BufEnter *	match ExtraWhitespace /\s\+$/
	autocmd BufEnter * 	syn match Color_function_prototype /\zs\w\+\ze(\(.*\n\)*.*)/
	autocmd BufEnter * 	hi Color_function_prototype ctermfg=Blue
	autocmd BufEnter * 	syn match Color_define_name /[A-Z][A-Z_0-9]\+/
	autocmd BufEnter * 	hi Color_define_name ctermfg=LightBlue
	autocmd BufEnter * 	syn match Color_typedef /\(\w\)\@<!\zs[tseu]_\w\+\ze\|\zs\w\+_t\ze\(\w\)\@!/
	autocmd BufEnter * 	hi Color_typedef ctermfg=LightGreen
	autocmd BufEnter * 	syn match Color_operator /&\||\|\w\zs\*\+\ze\|\zs\*\+
				\\ze\w\|\zs\*\+\ze)\|(\zs\*\+\ze\|\zs\*\+\ze(/
	" ) )
	autocmd BufEnter * 	hi Color_operator ctermfg=Red
	autocmd BufEnter * 	syn match Color_deleteline /\/\/dd.*\|\/\/d\d.*/
	autocmd BufEnter * 	hi Color_deleteline ctermfg=DarkRed
	autocmd BufEnter * 	hi Number ctermfg=DarkGreen
	autocmd BufEnter * 	hi Float ctermfg=DarkGreen
	autocmd BufEnter * endif


	" python
	autocmd BufEnter * if (expand('%:e') == 'py')
	autocmd BufEnter * 	hi ExtraWhitespace ctermbg=red guibg=red
	autocmd BufEnter *	match ExtraWhitespace /\s\+$/
	autocmd BufEnter * 	syn match Color_function_prototype /\zs\w\+\ze(\(.*\n\)*.*)/
	autocmd BufEnter * 	hi Color_function_prototype ctermfg=Blue
	autocmd BufEnter * 	syn match Color_define_name /[A-Z][A-Z_0-9]\+/
	autocmd BufEnter * 	hi Color_define_name ctermfg=LightBlue cterm=bold
	autocmd BufEnter * 	syn match Color_operator /&\||\|\w\zs\*\+\ze\|\zs\*\+
				\\ze\w\|\zs\*\+\ze)\|(\zs\*\+\ze\|\zs\*\+\ze(/
	" ) )
	autocmd BufEnter * 	hi Color_operator ctermfg=Red
"	autocmd BufEnter * 	syn match Color_parent /\zs\w\+\ze\./
"	autocmd BufEnter * 	hi Color_parent ctermfg=34
	

	autocmd BufEnter * 	hi pythonBuiltin ctermfg=Blue cterm=bold
	autocmd BufEnter * 	hi pythonFunction ctermfg=Blue cterm=bold
	autocmd BufEnter * 	hi pythonOperator ctermfg=Yellow
	autocmd BufEnter * 	hi Number ctermfg=DarkGreen
	autocmd BufEnter * 	hi Float ctermfg=DarkGreen
	autocmd BufEnter * endif
augroup END
"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
