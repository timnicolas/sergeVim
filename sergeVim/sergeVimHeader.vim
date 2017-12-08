" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    sergeVimHeader.vim                                 :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 19:08:21 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/08 23:27:26 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""SergeHeader""""""""""""""""""""""""""""""""
"create sergeVim header <F2> or :SergeHeader
nmap <F2> :call CreateSergeHeader()<CR>
imap <F2> <esc>:calc CreateSergeHeader()<CR>
command! SergeHeader exe ':call CreateSergeHeader()'

"create a header if we need it
function! CreateSergeHeader()
	let is_header = CreateSergeHeader_if_exist()
	if is_header == 0
		let is42_header = Create42Header_if_exist()
		if is42_header == 0
			call CreateSergeHeader_create(1)
		else
			:11s/\n/\r\r
			call CreateSergeHeader_create(13)
		endif
	else
		echo 'you already have a sergeVim header'
	endif
endfunction

"check if the header exist
function! CreateSergeHeader_if_exist()
	call SetCursorPlaceSave()
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
	:normal gg
	let is_header =  search('\/\* \*\{74} \*\/\n\/\* \s\+__\s\+___\s\+\*\/\n
				\\/\*\s\+\\ \\\s\+\/ (_)\s\+\*\/\n
				\\/\*\s\+___  ___ _ __ __ _  __\\ \\  \/ \/ _ _ __ ___\s\+\*\/\n
				\\/\*\s\+\/ __|\/ _ \\ .__\/ _\` |\/ _ \\ \\\/ \/ | | .
				\_ ` _ \\\s\+\*\/\n\/\*\s\+\\__ \\  __\/ | | (_| |  __\/\\  \/
				\  | | | | | | |\s\+\*\/\n\/\*\s\+|___\/\\___|_|  \\__, |\\___
				\| \\\/   |_|_| |_| |_|\s\+\*\/\n\/\*\s\+__\/ |\s\+\*\/\n
				\\/\*\s\+|___\/\s\+\*\/\n\/\*\s\+\*\/\n\/\* \*\{74} \*\/\n',
				\'c', line('0'))
") "this line is here to debug color in vim
	call SetCursorPlaceGo()
	return is_header
endfunction

"create a header
function! CreateSergeHeader_create(line_size)
	let line_s = a:line_size
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
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 37) . '__' . repeat(' ', 6) . '___' .
				\repeat(' ', 28)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 37) . '\\ \\' . repeat(' ', 4) . '\/ (_)' .
				\repeat(' ', 27)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 16) . '___  ___ _ __ __ _  __\\ \\  \/ \/ _ _ _
				\_ ___' . repeat(' ', 19)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 15) . '\/ __|\/ _ \\ ' . "'" . '__\/ _` |
				\\/ _ \\ \\\/ \/ | | ' . "'" . '_ ` _ \\' . repeat(' ', 18)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 15) . '\\__ \\  __\/ | | (_| |  __\/\\  \/  |
				\ | | | | | |' . repeat(' ', 17)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 15) . '|___\/\\___|_|  \\__, |\\___| \\\/' .
				\repeat(' ', 3) . '|_|_| |_| |_|' . repeat(' ', 17)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 30) . '__\/ |' . repeat(' ', 41)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	let l:lineH = repeat(' ', 29) . '|___\/' . repeat(' ', 42)
	exe ':' . l:line_s . 's/^/' . l:begin . l:lineH . l:end . '\r'
	let l:line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let l:line_s += 1
	exe ':' . l:line_s . 's/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r'
endfunction
"""""""""""""""""""""""""""""""""""""SergeHeader""""""""""""""""""""""""""""""""
