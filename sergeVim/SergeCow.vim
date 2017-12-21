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


"	 _(__)_        V
"	'-e e -'__,--.__)
"	 (o_o)        ) 
"	    \. /___.  |
"	    ||| _)/_)/
"	   //_(/_(/_(


"	__________________________
"	|comment here            |
"	--------------------------
"           __n__n__  /
"    .------`-\00/-'/
"   /  ##  ## (oo)
"  / \## __   ./
"     |//YY \|/
"     |||   |||

"""""""""""""""""""""""""""""""""""""cow""""""""""""""""""""""""""""""""""""""""
command! -nargs=* SergeCow call SergeAddCow(<f-args>)
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
		let begin = '"'
		let middle = '"'
		let end = '"'
		let size_c = 1
	elseif expand('%:t') == '.emacs'
		let begin = ';'
		let middle = ';'
		let end = ';'
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
	silent! call append(line('.'), l:end)
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
	silent! call append(line('.'), l:begin)
endfunction
"""""""""""""""""""""""""""""""""""""cow""""""""""""""""""""""""""""""""""""""""
