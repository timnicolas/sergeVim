" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    42header.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:55:07 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/19 23:57:01 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""42header"""""""""""""""""""""""""""""""""""
if g:enable_42_header == 0
	finish
endif
"create 42 header <F1> or :Header
nmap <F1> :call Create42Header()<CR>
imap <F1> <esc>:call Create42Header()<CR>
command! Header exe ':call Create42Header()'
"update date if the file is modified
if g:auto_update_42_header == 1
	augroup headerUpdate
		autocmd!
		autocmd BufWriteCmd * if &modified && Create42Header_if_exist() == 1
		autocmd BufWriteCmd *	call Create42Header_update()
		autocmd BufWriteCmd *	:write
		autocmd BufWriteCmd * elseif &modified
		autocmd BufWriteCmd *	:write
		autocmd BufWriteCmd * endif
		autocmd BufWriteCmd * :doautoall BufWritePost
	augroup END
endif

"create a header if we need it
function! Create42Header()
	let is_header = Create42Header_if_exist()
	if is_header == 0
		call Create42Header_create()
	else
		echo 'you already have a header'
	endif
endfunction

"check if the header exist
function! Create42Header_if_exist()
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
	let is_header =  search(l:begin . '\s*\*\{' . (78 - 2 * l:size_c) . '}\s*'
				\. l:end . '\n
				\' . l:begin . '\s\+' . l:end . '\n
				\' . l:begin . '\s\+:::\s\+:\{8}\s\+' . l:end . '\n
				\' . l:begin . '\s\+\w\+.\w* \+:+:\s\+:+:\s\+:+:\s\+' . l:end
				\. '\n
				\' . l:begin . '\s\++:+ +:+\s\++:+\s\+' . l:end . '\n
				\' . l:begin . '\s\+By: \w\+ <.\+> \++#+  +:+ \{7}+#+ \{8}' .
				\l:end . '\n
				\' . l:begin . '\s\++#+#+#+#+#+\s\++#+\s\+' . l:end . '\n
				\' . l:begin . '\s\+Created: 20\d\d\/\d\d\/\d\d \d\d:\d\d:\d\d
				\ by \w\+\s\+#+#\s\+#+#\s\+' . l:end . '\n
				\' . l:begin . '\s\+Updated: 20\d\d\/\d\d\/\d\d \d\d:\d\d:\d\d
				\ by \w\+\s\+###\s\+#\{8}\.fr\s\+' . l:end . '\n
				\' . l:begin . '\s\+' . l:end . '\n
				\' . l:begin . '\s*\*\{' . (78 - 2 * l:size_c) . '}\s*'
				\. l:end . '\n', 'c', line('0'))
	if line('.') > 1
		let linedown = line('.') - 1
		if search('^' . repeat('\n', linedown) . '\/\* *', 'c', line('0')) == 1
			:normal gg
			exe ':normal! d'. linedown . 'd'
		else
			echo 'header not a the top of the file'
		endif
	endif
	call SetCursorPlaceGo()
	return is_header
endfunction

"create a header
function! Create42Header_create()
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
	:normal gg
	exe ':1 s/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r'
	exe ':2 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	let line42 = ':::' . repeat(' ', 6) . '::::::::' . repeat(' ', 3)
	exe ':3 s/^/' . l:begin . repeat(' ', 56) . line42 . l:end . '\r'
	let line42 = ':+:' . repeat(' ', 6) . ':+:' . repeat(' ', 4) . ':+:' .
				\repeat(' ', 3)
	exe ':4 s/^/' . l:begin . repeat(' ', 3) . filename .
				\repeat(' ', 51 - strlen(filename)) .  line42 . l:end . '\r'
	let line42 = '+:+ +:+' . repeat(' ', 9) . '+:+' . repeat(' ', 5)
	exe ':5 s/^/' . l:begin . repeat(' ', 52) . line42 . l:end . '\r'
	let line42 = '+#+  +:+' . repeat(' ', 7) . '+#+' . repeat(' ', 8)
	exe ':6 s/^/' . l:begin . repeat(' ', 3) . 'By: ' . user . ' <' . mail . '>'
				\. repeat(' ', 40 - strlen(user) - strlen(mail)) .
				\line42 . l:end . '\r'
	let line42 = '+#+#+#+#+#+' . repeat(' ', 3) . '+#+' . repeat(' ', 11)
	exe ':7 s/^/' . l:begin . repeat(' ', 48) . line42 . l:end . '\r'
	let line42 = '#+#' . repeat(' ', 4) . '#+#' . repeat(' ', 13)
	exe ':8 s/^/' . l:begin . repeat(' ', 3) . 'Created: ' . time_act . ' by '
				\. user . repeat(' ', 39 - strlen(time_act) - strlen(user)) .
				\line42 . l:end . '\r'
	let line42 = '###' . repeat(' ', 3) . '########.fr' . repeat(' ', 7)
	exe ':9 s/^/' . l:begin . repeat(' ', 3) . 'Updated: ' . time_act . ' by '
				\. user .  repeat(' ', 38 - strlen(time_act) - strlen(user)) .
				\line42 . l:end . '\r'
	exe ':10 s/^/' . l:begin . repeat(' ', 76) . l:end . '\r'
	exe ':11 s/^/' . l:begin . repeat(' ', size_c - 1) .
				\repeat('*', 78 - 2 * size_c) . repeat(' ', size_c - 1) .
				\l:end . '\r\r'
endfunction

"update date in header
function! Create42Header_update()
	call SetCursorPlaceSave()
	let user = $USER
	if user == '' || user == 'tim'
		let user = g:username42
	endif
	:normal gg
	let time_act = strftime('%Y\/%m\/%d %H:%M:%S')
	exe ':9 s/\d\d\d\d\/\d\d\/\d\d \d\d:\d\d:\d\d/' . time_act
	exe ':9 s/by \zs\w\+\s\+\ze/' . l:user . repeat(' ', 17 - strlen(l:user))
	call SetCursorPlaceGo()
endfunction
"""""""""""""""""""""""""""""""""""""42header"""""""""""""""""""""""""""""""""""
