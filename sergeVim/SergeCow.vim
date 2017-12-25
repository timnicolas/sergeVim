" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    SergeCow.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/21 00:47:59 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/21 00:47:59 by tnicolas         ###   ########.fr        "
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

"   ________________________
"   |:sergeCow cow-mentaire|
"   ------------------------
"           __n__n__  /
"    .------`-\00/-'/
"   /  ##  ## (oo)
"  / \## __   ./
"     |//YY \|/
"     |||   |||

"""""""""""""""""""""""""""""""""""""cow""""""""""""""""""""""""""""""""""""""""
command! -nargs=* SergeCow call SergeAddCow(<f-args>)
command! SergeCowHeader silent! call SergeCowAddHeader()

function! SergeCowAddHeader()
	let begin = '#'
	let middle = '#'
	let end = '#'
	let size_c = 1
	if expand('%:e') == 'c' || expand('%:e') == 'h' || expand('%:e') == 'cpp'
		let begin = '/*'
		let middle = '**'
		let end = '*/'
		let size_c = 2
	elseif expand('%:e') == 'vim' || expand('%:t') == '.vimrc'
		let begin = ''
		let middle = '"'
		let end = ''
		let size_c = 1
	elseif expand('%:t') == '.emacs'
		let begin = ''
		let middle = ';'
		let end = ''
		let size_c = 1
	endif
	if l:end != ''
		silent! call append(line('.'), l:end)
	endif
	silent! call append(line('.'), l:middle . repeat(' ', 5) . '|||' .
				\repeat(' ', 3) . '|||')
	silent! call append(line('.'), l:middle . repeat(' ', 5) . '|//YY \|/')
	silent! call append(line('.'), l:middle . repeat(' ', 2) . '/ \## __   ./')
	silent! call append(line('.'), l:middle . repeat(' ', 3) . '/  ##  ## (oo)')
	silent! call append(line('.'), l:middle . repeat(' ', 4) .
				\".------`-\\00/-'/")
	silent! call append(line('.'), l:middle . repeat(' ', 11) . '__n__n__  /')
	silent! call append(line('.'), l:middle . repeat(' ', 3) .
				\repeat('-', 60))
	let line_act = line('.')
	let line_name = line('.')
	if expand('%:e') == 'c' &&  search('^\(static\s\+\)\=\w\+[\t ]*\**\w\+(.*\(\n.*\)*)\n', 'b') > 0
		:silent! vimgrep /^\(static\s\+\)\=\w\+[\t ]*\**\w\+(.*\(\n.*\)*)\n/ %
		let nb_func = 0
		while 1
			let nb_func += 1
			:normal f(h
			let func_name = expand('<cword>')
			let nb_line = line('.')
			:silent! /^}
			let nb_line = line('.') - l:nb_line - 2
			exe ':' . l:line_act
			let l:line_act += 1
			if l:nb_line > 25
				let l:line_act += 1
				silent! call append(line('.'), '**' . repeat(' ', 3) . '|' .
							\repeat(' ', 9) . 'MEUUUU to many lines' .
							\repeat(' ', 29) . '|')
			endif
			silent! call append(line('.'), l:middle . repeat(' ', 3) . '|' .
						\repeat(' ', 5) . l:func_name . '(' . l:nb_line	.
						\' lines)' . repeat(' ', 45 - strlen(l:func_name) -
						\strlen(l:nb_line)) . '|')
			try
				:cn
			catch
				break
			endtry
		endwhile
		exe ':' . l:line_act
		if nb_func > 5
			silent! call append(line('.'), '**' . repeat(' ', 3) . '|' .
						\repeat(' ', 1) . 'MEUUUU to many function' .
						\repeat(' ', 34) . '|')
		endif
	endif
	exe ':' . l:line_name
	let line_txt = expand('%:t')
	silent! call append(line('.'), l:middle . repeat(' ', 3) . '|' .
				\repeat(' ', 1) . l:line_txt . repeat(' ', 57 -
				\strlen(l:line_txt)) . '|')
	silent! call append(line('.'), l:middle . repeat(' ', 3) .
				\repeat('_', 60))
	if l:begin != ''
		silent! call append(line('.'), l:begin)
	endif
endfunction

function! SergeAddCow(...)
	let begin = '#'
	let middle = '#'
	let end = '#'
	let size_c = 1
	if expand('%:e') == 'c' || expand('%:e') == 'h' || expand('%:e') == 'cpp'
		let begin = '/*'
		let middle = '**'
		let end = '*/'
		let size_c = 2
	elseif expand('%:e') == 'vim' || expand('%:t') == '.vimrc'
		let begin = ''
		let middle = '"'
		let end = ''
		let size_c = 1
	elseif expand('%:t') == '.emacs'
		let begin = ''
		let middle = ';'
		let end = ''
		let size_c = 1
	endif
	echo a:0
	if a:0 >= 1
		let line_txt = ""
		let i = 1
		while l:i <= a:0
			let line_txt = l:line_txt . eval('a:' . l:i)
			let i += 1
			if l:i <= a:0
				let line_txt = l:line_txt . ' '
			endif
		endwhile
	else
		let line_txt = 'vous pouvez mettre un cow-mentaire ici'
	endif
	let size_line = strlen(l:line_txt)
	if l:end != ''
		silent! call append(line('.'), l:end)
	endif
	silent! call append(line('.'), l:middle . repeat(' ', 5) . '|||' .
				\repeat(' ', 3) . '|||')
	silent! call append(line('.'), l:middle . repeat(' ', 5) . '|//YY \|/')
	silent! call append(line('.'), l:middle . repeat(' ', 2) . '/ \## __   ./')
	silent! call append(line('.'), l:middle . repeat(' ', 3) . '/  ##  ## (oo)')
	silent! call append(line('.'), l:middle . repeat(' ', 4) .
				\".------`-\\00/-'/")
	silent! call append(line('.'), l:middle . repeat(' ', 11) . '__n__n__  /')
	silent! call append(line('.'), l:middle . repeat(' ', 3) .
				\repeat('-', size_line) . '--')
	silent! call append(line('.'), l:middle . repeat(' ', 3) .
				\'|' . l:line_txt . '|')
	silent! call append(line('.'), l:middle . repeat(' ', 3) .
				\repeat('_', l:size_line) . '__')
	if l:begin != ''
		silent! call append(line('.'), l:begin)
	endif
endfunction
"""""""""""""""""""""""""""""""""""""cow""""""""""""""""""""""""""""""""""""""""
