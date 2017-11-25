" **************************************************************************** "
"																			   "
"														  :::	   ::::::::    "
"	 42header.vim										:+:		 :+:	:+:    "
"													  +:+ +:+		  +:+	   "
"	 By: tnicolas <marvin@42.fr>					+#+  +:+	   +#+		   "
"												  +#+#+#+#+#+	+#+			   "
"	 Created: 2017/09/05 16:54:52 by tnicolas		   #+#	  #+#			   "
"	 Updated: 2017/09/05 16:54:52 by tnicolas		  ###	########.fr		   "
"																			   "
" **************************************************************************** "

"""""""""""""""""""""""""""""""""""""42header"""""""""""""""""""""""""""""""""""
nmap <C-c><C-h> :call Create42Header()<CR>
function! Create42Header()
	let is_header = Create42Header_if_exist()
	if is_header == 0
		call Create42Header_create()
	else
		echo 'you already have a header'
	endif
endfunction

function! Create42Header_if_exist()
	let first_line_visible = line('w0') "+ g:visible_line_around_cursor
	let line_before = line('.')
	let col_before = col('.')
	:normal gg
	let is_header =  search('\/\* \*\{74} \*\/\n
				\\/\*\s\+\*\/\n
				\\/\*\s\+:::\s\+:\{8}   \*\/\n
				\\/\*   \w\+.\w* \+:+:\s\+:+:\s\+:+:   \*\/\n
				\\/\*\s\++:+ +:+\s\++:+\s\+\*\/\n
				\\/\*   By: \w\+ <.\+> \++#+  +:+ \{7}+#+ \{8}\*\/\n
				\\/\*\s\++#+#+#+#+#+   +#+\s\+\*\/\n
				\\/\*   Created: 20\d\d\/\d\d\/\d\d \d\d:\d\d:\d\d
				\ by \w\+\s\+#+#\s\+#+#\s\+\*\/\n
				\\/\*   Updated: 20\d\d\/\d\d\/\d\d \d\d:\d\d:\d\d
				\ by \w\+\s\+###   #\{8}\.fr\s\+\*\/\n
				\\/\*\s\+\*\/\n
				\\/\* \*\{74} \*\/\n', 'c', line('0'))
	exe ':' . first_line_visible
	:normal zt
	exe ':' . line_before
	exe ':normal ' . col_before . '|'
	return is_header
endfunction

function! Create42Header_create()
	let first_line_visible = line('w0') "+ g:visible_line_around_cursor
	let line_before = line('.')
	let col_before = col('.')
	let user = $USER
	let mail = $MAIL
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
	exe ':1 s/^/\/\* ' . repeat('*', 74) . ' \*\/\r'
	exe ':2 s/^/\/\* ' . repeat(' ', 74) . ' \*\/\r'
	let line42 = ':::      ::::::::   '
	exe ':3 s/^/\/\* ' . repeat(' ', 55) . line42 . '\*\/\r'
	let line42 = ':+:      :+:    :+:   '
	exe ':4 s/^/\/\*   ' . filename . repeat(' ', 51 - strlen(filename)) .
				\line42 . '\*\/\r'
	let line42 = '+:+ +:+         +:+     '
	exe ':5 s/^/\/\*' . repeat(' ', 52) . line42 . '\*\/\r'
	let line42 = '+#+  +:+       +#+' . repeat(' ', 8)
	exe ':6 s/^/\/\*   By: ' . user . ' <' . mail . '>' .
				\repeat(' ', 40 - strlen(user) - strlen(mail)) .
				\line42 . '\*\/\r'
	let line42 = '+#+#+#+#+#+   +#+' . repeat(' ', 11)
	exe ':7 s/^/\/\*' . repeat(' ', 48) . line42 . '\*\/\r'
	let line42 = '#+#    #+#' . repeat(' ', 13)
	exe ':8 s/^/\/\*   Created: ' . time_act . ' by ' . user .
				\repeat(' ', 39 - strlen(time_act) - strlen(user)) .
				\line42 . '\*\/\r'
	let line42 = '###   ########.fr' . repeat(' ', 7)
	exe ':9 s/^/\/\*   Updated: ' . time_act . ' by ' . user .
				\repeat(' ', 38 - strlen(time_act) - strlen(user)) .
				\line42 . '\*\/\r'
	exe ':10 s/^/\/\* ' . repeat(' ', 74) . ' \*\/\r'
	exe ':11 s/^/\/\* ' . repeat('*', 74) . ' \*\/\r\r'
	"echo '\/\* \*\*\* \*\/\n'
	let line_before += 12
	exe ':' . first_line_visible
	:normal zt
	exe ':' . line_before
	exe ':normal ' . col_before . '|'
endfunction

autocmd BufWriteCmd * if &modified && Create42Header_if_exist() == 1
autocmd BufWriteCmd *	call Create42Header_update()
autocmd BufWriteCmd *	:write
autocmd BufWriteCmd * elseif &modified
autocmd BufWriteCmd * 	:write
function! Create42Header_update()
	let first_line_visible = line('w0') "+ g:visible_line_around_cursor
	let line_before = line('.')
	let col_before = col('.')
	:normal gg
	let time_act = strftime('%Y\/%m\/%d %H:%M:%S')
	exe ':9 s/\d\d\d\d\/\d\d\/\d\d \d\d:\d\d:\d\d/' . time_act
	exe ':' . first_line_visible
	:normal zt
	exe ':' . line_before
	exe ':normal ' . col_before . '|'
endfunction
"""""""""""""""""""""""""""""""""""""42header"""""""""""""""""""""""""""""""""""
