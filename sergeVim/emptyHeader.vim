" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    emptyHeader.vim                                    :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 22:43:54 by tnicolas          #+#    #+#              "
"    Updated: 2017/11/26 22:45:03 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""emptyHeader""""""""""""""""""""""""""""""""
"create a empty header :EmptyHeader
command EmptyHeader exe ':call CreateEmptyHeader()'
function! CreateEmptyHeader()
	let first_line_visible = line('w0') + g:min_number_line_ar_cur
	let line_before = line('.')
	let col_before = col('.')
	let user = $USER
	let mail = $MAIL
	let begin = '# '
	let end = ' #'
	let size_c = 1
	if expand('%:e') == 'c' || expand('%:e') == 'h' || expand('%:e') == 'cpp'
		let begin = '\/\*'
		let end = '\*\/'
		let size_c = 2
	elseif expand('%:e') == 'vim' || expand('%:t') == '.vimrc'
		let begin = '" '
		let end = ' "'
		let size_c = 1
	elseif expand('%:t') == '.emacs'
		let begin = '; '
		let end = ' ;'
		let size_c = 1
	endif
	"expand for srcs/main.c
	"	%:t main.c
	"	%:e c
	"	%:r srcs/main.c
	"	%:r:t srcs/main
	let filename = expand('%:t')
	let time_act = strftime('%Y\/%m\/%d %H:%M:%S')
	if user == '' || user == 'tim'
		let user = g:username42
	endif
	if mail == ''
		let mail = g:mail42
	endif
	exe ': 1 s/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r'
	exe ':2 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':3 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':4 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':5 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':6 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':7 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':8 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':9 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':10 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':11 s/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r\r'
	let line_before += 12
	exe ':' . first_line_visible
	:normal zt
	exe ':' . line_before
	exe ':normal ' . col_before . '|'
endfunction
"""""""""""""""""""""""""""""""""""""emptyHeader""""""""""""""""""""""""""""""""
