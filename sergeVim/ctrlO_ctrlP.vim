" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    ctrlO_ctrlP.vim                                    :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/14 22:07:23 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/15 15:39:23 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""variables""""""""""""""""""""""""""""""""""
"open file under cursor <C-o> <C-p>
nmap <C-o> :call TryOpenFileUnderCursorName()<CR>
nmap <C-p> :call TryOpenFileUnderCursorNameLast()<CR>
let g:last1 = 'no_file'
let g:last1_pos = 'no_file'
let g:last1_col = 'no_file'
let g:last1_top = 'no_file'
let g:last2 = 'no_file'
let g:last2_pos = 'no_file'
let g:last2_col = 'no_file'
let g:last2_top = 'no_file'
let g:last3 = 'no_file'
let g:last3_pos = 'no_file'
let g:last3_col = 'no_file'
let g:last3_top = 'no_file'
let g:last4 = 'no_file'
let g:last4_pos = 'no_file'
let g:last4_col = 'no_file'
let g:last4_top = 'no_file'
let g:last5 = 'no_file'
let g:last5_pos = 'no_file'
let g:last5_col = 'no_file'
let g:last5_top = 'no_file'
let g:last6 = 'no_file'
let g:last6_pos = 'no_file'
let g:last6_col = 'no_file'
let g:last6_top = 'no_file'
let g:last7 = 'no_file'
let g:last7_pos = 'no_file'
let g:last7_col = 'no_file'
let g:last7_top = 'no_file'
let g:last8 = 'no_file'
let g:last8_pos = 'no_file'
let g:last8_col = 'no_file'
let g:last8_top = 'no_file'
let g:last9 = 'no_file'
let g:last9_pos = 'no_file'
let g:last9_col = 'no_file'
let g:last9_top = 'no_file'
let g:last10 = 'no_file'
let g:last10_pos = 'no_file'
let g:last10_col = 'no_file'
let g:last10_top = 'no_file'
let g:last11 = 'no_file'
let g:last11_pos = 'no_file'
let g:last11_col = 'no_file'
let g:last11_top = 'no_file'
let g:last12 = 'no_file'
let g:last12_pos = 'no_file'
let g:last12_col = 'no_file'
let g:last12_top = 'no_file'
let g:last13 = 'no_file'
let g:last13_pos = 'no_file'
let g:last13_col = 'no_file'
let g:last13_top = 'no_file'
let g:last14 = 'no_file'
let g:last14_pos = 'no_file'
let g:last14_col = 'no_file'
let g:last14_top = 'no_file'
let g:last15 = 'no_file'
let g:last15_pos = 'no_file'
let g:last15_col = 'no_file'
let g:last15_top = 'no_file'
let g:last16 = 'no_file'
let g:last16_pos = 'no_file'
let g:last16_col = 'no_file'
let g:last16_top = 'no_file'
let g:last17 = 'no_file'
let g:last17_pos = 'no_file'
let g:last17_col = 'no_file'
let g:last17_top = 'no_file'
let g:last18 = 'no_file'
let g:last18_pos = 'no_file'
let g:last18_col = 'no_file'
let g:last18_top = 'no_file'
let g:last19 = 'no_file'
let g:last19_pos = 'no_file'
let g:last19_col = 'no_file'
let g:last19_top = 'no_file'
"""""""""""""""""""""""""""""""""""""variables""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""ctrlO""""""""""""""""""""""""""""""""""""""
function! TryOpenFileUnderCursorName()
	call LastPosMoveDown()
	call SetCursorPlaceSaveArg('last1', 'last1_pos', 'last1_col', 'last1_top')
	let func_name = expand('<cword>')
	echo g:last1 . ' ' . g:last1_top
	if search('^\(static\s\+\)\=\w\+[\t ]\+\**' . l:func_name . '[\t ]*(.*\(\n.*\)*)', 'b') > 0
		:normal zt
"		echo '"' . expand('%') . '" -> ' . l:func_name . '()'
	else
		exe ':silent! vimgrep /^\(static\s\+\)\=\w\+[\t ]\+\**' . l:func_name . '[\t ]*(.*\(\n.*\)*)/ **/*.c'
		if search('^\(static\s\+\)\=\w\+[\t ]\+\**' . l:func_name . '[\t ]*(.*\(\n.*\)*)', 'b') > 0
			:normal zt
		else
			call LastPosMoveUp()
			echo "no function under cursor"
		endif
"		echo '"' . expand('%') . '" -> ' . l:func_name . '()'
	endif
endfunction
function! LastPosMoveDown()
	call SetCursorPlaceMoveArg('last18', 'last18_pos', 'last18_col', 'last18_top',
				\'last19', 'last19_pos', 'last19_col', 'last19_top')
	call SetCursorPlaceMoveArg('last17', 'last17_pos', 'last17_col', 'last17_top',
				\'last18', 'last18_pos', 'last18_col', 'last18_top')
	call SetCursorPlaceMoveArg('last16', 'last16_pos', 'last16_col', 'last16_top',
				\'last17', 'last17_pos', 'last17_col', 'last17_top')
	call SetCursorPlaceMoveArg('last15', 'last15_pos', 'last15_col', 'last15_top',
				\'last16', 'last16_pos', 'last16_col', 'last16_top')
	call SetCursorPlaceMoveArg('last14', 'last14_pos', 'last14_col', 'last14_top',
				\'last15', 'last15_pos', 'last15_col', 'last15_top')
	call SetCursorPlaceMoveArg('last13', 'last13_pos', 'last13_col', 'last13_top',
				\'last14', 'last14_pos', 'last14_col', 'last14_top')
	call SetCursorPlaceMoveArg('last12', 'last12_pos', 'last12_col', 'last12_top',
				\'last13', 'last13_pos', 'last13_col', 'last13_top')
	call SetCursorPlaceMoveArg('last11', 'last11_pos', 'last11_col', 'last11_top',
				\'last12', 'last12_pos', 'last12_col', 'last12_top')
	call SetCursorPlaceMoveArg('last10', 'last10_pos', 'last10_col', 'last10_top',
				\'last11', 'last11_pos', 'last11_col', 'last11_top')
	call SetCursorPlaceMoveArg('last9', 'last9_pos', 'last9_col', 'last9_top',
				\'last10', 'last10_pos', 'last10_col', 'last10_top')
	call SetCursorPlaceMoveArg('last8', 'last8_pos', 'last8_col', 'last8_top',
				\'last9', 'last9_pos', 'last9_col', 'last9_top')
	call SetCursorPlaceMoveArg('last7', 'last7_pos', 'last7_col', 'last7_top',
				\'last8', 'last8_pos', 'last8_col', 'last8_top')
	call SetCursorPlaceMoveArg('last6', 'last6_pos', 'last6_col', 'last6_top',
				\'last7', 'last7_pos', 'last7_col', 'last7_top')
	call SetCursorPlaceMoveArg('last5', 'last5_pos', 'last5_col', 'last5_top',
				\'last6', 'last6_pos', 'last6_col', 'last6_top')
	call SetCursorPlaceMoveArg('last4', 'last4_pos', 'last4_col', 'last4_top',
				\'last5', 'last5_pos', 'last5_col', 'last5_top')
	call SetCursorPlaceMoveArg('last3', 'last3_pos', 'last3_col', 'last3_top',
				\'last4', 'last4_pos', 'last4_col', 'last4_top')
	call SetCursorPlaceMoveArg('last2', 'last2_pos', 'last2_col', 'last2_top',
				\'last3', 'last3_pos', 'last3_col', 'last3_top')
	call SetCursorPlaceMoveArg('last1', 'last1_pos', 'last1_col', 'last1_top',
				\'last2', 'last2_pos', 'last2_col', 'last2_top')
endfunction
"""""""""""""""""""""""""""""""""""""ctrlO""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""ctrlP""""""""""""""""""""""""""""""""""""""
function! TryOpenFileUnderCursorNameLast()
	if g:last1 != 'no_file'
		call SetCursorPlaceGoArg(g:last1, g:last1_pos, g:last1_col, g:last1_top)
		call LastPosMoveUp()
	else
		echo "no last file"
	endif
endfunction
function! LastPosMoveUp()
		call SetCursorPlaceMoveArg('last2', 'last2_pos', 'last2_col', 'last2_top',
					\'last1', 'last1_pos', 'last1_col', 'last1_top')
		call SetCursorPlaceMoveArg('last3', 'last3_pos', 'last3_col', 'last3_top',
					\'last2', 'last2_pos', 'last2_col', 'last2_top')
		call SetCursorPlaceMoveArg('last4', 'last4_pos', 'last4_col', 'last4_top',
					\'last3', 'last3_pos', 'last3_col', 'last3_top')
		call SetCursorPlaceMoveArg('last5', 'last5_pos', 'last5_col', 'last5_top',
					\'last4', 'last4_pos', 'last4_col', 'last4_top')
		call SetCursorPlaceMoveArg('last6', 'last6_pos', 'last6_col', 'last6_top',
					\'last5', 'last5_pos', 'last5_col', 'last5_top')
		call SetCursorPlaceMoveArg('last7', 'last7_pos', 'last7_col', 'last7_top',
					\'last6', 'last6_pos', 'last6_col', 'last6_top')
		call SetCursorPlaceMoveArg('last8', 'last8_pos', 'last8_col', 'last8_top',
					\'last7', 'last7_pos', 'last7_col', 'last7_top')
		call SetCursorPlaceMoveArg('last9', 'last9_pos', 'last9_col', 'last9_top',
					\'last8', 'last8_pos', 'last8_col', 'last8_top')
		call SetCursorPlaceMoveArg('last10', 'last10_pos', 'last10_col', 'last10_top',
					\'last9', 'last9_pos', 'last9_col', 'last9_top')
		call SetCursorPlaceMoveArg('last11', 'last11_pos', 'last11_col', 'last11_top',
					\'last10', 'last10_pos', 'last10_col', 'last10_top')
		call SetCursorPlaceMoveArg('last12', 'last12_pos', 'last12_col', 'last12_top',
					\'last11', 'last11_pos', 'last11_col', 'last11_top')
		call SetCursorPlaceMoveArg('last13', 'last13_pos', 'last13_col', 'last13_top',
					\'last12', 'last12_pos', 'last12_col', 'last12_top')
		call SetCursorPlaceMoveArg('last14', 'last14_pos', 'last14_col', 'last14_top',
					\'last13', 'last13_pos', 'last13_col', 'last13_top')
		call SetCursorPlaceMoveArg('last15', 'last15_pos', 'last15_col', 'last15_top',
					\'last14', 'last14_pos', 'last14_col', 'last14_top')
		call SetCursorPlaceMoveArg('last16', 'last16_pos', 'last16_col', 'last16_top',
					\'last15', 'last15_pos', 'last15_col', 'last15_top')
		call SetCursorPlaceMoveArg('last17', 'last17_pos', 'last17_col', 'last17_top',
					\'last16', 'last16_pos', 'last16_col', 'last16_top')
		call SetCursorPlaceMoveArg('last18', 'last18_pos', 'last18_col', 'last18_top',
					\'last17', 'last17_pos', 'last17_col', 'last17_top')
		call SetCursorPlaceMoveArg('last19', 'last19_pos', 'last19_col', 'last19_top',
					\'last18', 'last18_pos', 'last18_col', 'last18_top')
		let g:last19 = 'no_file'
		let g:last19_pos = 'no_file'
		let g:last19_col = 'no_file'
		let g:last19_top = 'no_file'
endfunction
"""""""""""""""""""""""""""""""""""""ctrlP""""""""""""""""""""""""""""""""""""""
