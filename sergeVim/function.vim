" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    function.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:57:34 by tnicolas          #+#    #+#              "
"    Updated: 2017/11/26 19:47:01 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
"';' auto in header width <leader>;
nmap <leader>; :call PointVirgule()<CR>
function! PointVirgule()
	let first_line_visible = line('w0') + 4
	let line_before = line('.')
	let col_before = col('.')
	if expand('%.e') == 'h'
		:% s/)\n/);\r/g
	elseif search(';\s*\n', 'n', line('.')) == line_before
		exe ':' . line_before . 's/;\s*\n/\r'
	else
		exe ':' . line_before . 's/\s*\n/;\r'
	endif
	:silent! /cgvhadgfhadgfjksahfjkdhfjkdshfHL
	exe ':' . first_line_visible
	:normal zt
	exe ':' . line_before
	exe ':normal ' . col_before . '|'
endfunction
"imap <leader>; <C-o>:% s/)\n/);\r/g<CR>

"highlight prototypes <leader>ff
nmap <leader>ff /^\w\+[\t ]*\**\w\+(.*)\n<CR>

"select prototypes <leader>yf[x]
nmap <leader>yf1 /^\w\+[\t ]*\**\w\+(.*)\n<CR>"ayyn:silent!
			\/kjdhkjdhakfdf<CR>:echo "1 function yanked in buffer A"<CR>
nmap <leader>yf2 /^\w\+[\t ]*\**\w\+(.*)\n<CR>"ayyn"Ayyn":silent!
			\/kjdhkjdhakfdf<CR>:echo "2 function yanked in buffer A"<CR>
nmap <leader>yf3 /^\w\+[\t ]*\**\w\+(.*)\n<CR>"ayyn"Ayyn"Ayyn:silent!
			\/kjdhkjdhakfdf<CR>:echo "3 function yanked in buffer A"<CR>
nmap <leader>yf4 /^\w\+[\t ]*\**\w\+(.*)\n<CR>"ayyn"Ayyn"Ayyn"Ayyn:silent!
			\/kjdhkjdhakfdf<CR>:echo "4 function yanked in buffer A"<CR>
nmap <leader>yf5 /^\w\+[\t ]*\**\w\+(.*)\n<CR>"ayyn"Ayyn"Ayyn"Ayyn"Ayy:silent!
			\/kjdhkjdhakfdf<CR>:echo "5 function yanked in buffer A"<CR>

"select function <leader>fc[yYdD]
"nmap <leader>fcy ?^\w\+[\t ]*\**\w\+(.*)\n<CR><down>zf%"ay2<up><down>i<esc>
"			\:silent! /dksjhgdkl<CR>
"nmap <leader>fcd ?^\w\+[\t ]*\**\w\+(.*)\n<CR><down>zf%"ad2<up><down>i<esc>
"			\:silent! /dksjhgdkl<CR>
"nmap <leader>fcY ?^\w\+[\t ]*\**\w\+(.*)\n<CR><down>zf%"Ay2<up><down>i<esc>
"			\:silent! /dksjhgdkl<CR>
"nmap <leader>fcD ?^\w\+[\t ]*\**\w\+(.*)\n<CR><down>zf%"Ad2<up><down>i<esc>
"			\:silent! /dksjhgdkl<CR>

"select all function prototypes <leader>yff
nmap <leader>yff :call FunctionSelect()<CR>
function! FunctionSelect()
	let nb_func=-1
	let anc_line=0
	let line_act=1
	let i=0
	:1
	while anc_line < line_act
		let anc_line = line_act
		:silent! /^\w\+[\t ]*\**\w\+(.*)\n
		:+2
		let line_act = line('.')
		let nb_func += 1
	endwhile
	:1
	:normal qaq
	:silent! g/^\w\+[\t ]*\**\w\+(.*)\n/y A
	:silent! /hsdkflhgslkdjghlsfhgdskg
	:echo nb_func " func yanked in buffer A"@a
endfunction

"create block <leader>[([{'"]
vmap <leader>( <Esc>`<i(<Esc>`>a<right>)<Esc>
vmap <leader>[ <Esc>`<i[<Esc>`>a<right>]<Esc>
vmap <leader>' <Esc>`<i'<Esc>`>a<right>'<Esc>
vmap <leader>" <Esc>`<i"<Esc>`>a<right>"<Esc>
vmap <leader>{ <Esc>`<O{<Esc>==`>o}<Esc>==<up>
nmap <leader>{ o}<Esc><up>O{<Esc>=2<down><down>
"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""comment""""""""""""""""""""""""""""""""""""
"<leader>/			comment region
vmap <leader>/ :call SergeCommentRegion()<CR>
nmap <leader>/ :call SergeCommentRegion()<CR>
function! SergeCommentRegion() range
	let comment = '#'
	if expand('%:e') == 'c' || expand('%:e') == 'h' || expand('%:e') == 'cpp'
		let comment = '\/\/'
	elseif expand('%:e') == 'vim' || expand('%:t') == '.vimrc'
		let comment = '"'
	elseif expand('%:t') == '.emacs'
		let comment = ';'
	endif
	exe ':silent!' . a:firstline . ',' . a:lastline . 's/^\(\s*' .
				\l:comment . '\)\@!/' . l:comment . '/g'
	:silent!/dsfahfdkljhfklahsflahsf
endfunction

"<leader>\			uncomment region
vmap <leader>\ :call SergeDecommentRegion()<CR>
nmap <leader>\ :call SergeDecommentRegion()<CR>
function! SergeDecommentRegion() range
	let comment = '#'
	if expand('%:e') == 'c' || expand('%:e') == 'h' || expand('%:e') == 'cpp'
		let comment = '\/\/'
	elseif expand('%:e') == 'vim' || expand('%:t') == '.vimrc'
		let comment = '"'
	elseif expand('%:t') == '.emacs'
		let comment = ';'
	endif
	exe ':silent!' . a:firstline . ',' . a:lastline . 's/^' . l:comment . '//g'
	exe ':silent!' . a:firstline . ',' . a:lastline . 's/\s\+\zs' . l:comment .
				\'\ze//g'
	:silent!/dsfahfdkljhfklahsflahsf
endfunction

"	remove comment (not with ///) <leader>d/d
nmap <leader>d/d :call NormRemoveComment()<CR>
function! NormRemoveComment()
	"remove comment
	:silent! % s/\/\/\/\+/___triple_comment___/g
	:silent! % s/\/\/d/___del_comment___/g
	:silent! % s/\/\/</___balise_comment___/g
	:silent! % s/\/\/.*//g
	:silent! % s/___triple_comment___/\/\/\//g
	:silent! % s/___del_comment___/\/\/d/g
	:silent! % s/___balise_comment___/\/\/</g
	"remove extra whitespaces (end of lines)
	:silent! % s/\s\+\n/\r/g
endfunction
"	remove line with //dd comment <leader>dld
nmap <leader>dld :call NormRemoveDeleteLineComment('d')<CR>
function! NormRemoveDeleteLineComment(n)
	"remove comment
	exe ':silent! % g/\/\/d' . a:n . '/d'
	"remove extra whitespaces (end of lines)
	:silent! % s/\s\+\n/\r/g
endfunction

"create <d[x]> block <leader><[x]
vmap <leader><0 <Esc>`<O//<d0><Esc>==`>o//</d0><Esc>==<up>
vmap <leader><1 <Esc>`<O//<d1><Esc>==`>o//</d1><Esc>==<up>
vmap <leader><2 <Esc>`<O//<d2><Esc>==`>o//</d2><Esc>==<up>
vmap <leader><3 <Esc>`<O//<d3><Esc>==`>o//</d3><Esc>==<up>
vmap <leader><4 <Esc>`<O//<d4><Esc>==`>o//</d4><Esc>==<up>
vmap <leader><5 <Esc>`<O//<d5><Esc>==`>o//</d5><Esc>==<up>
vmap <leader><6 <Esc>`<O//<d6><Esc>==`>o//</d6><Esc>==<up>
vmap <leader><7 <Esc>`<O//<d7><Esc>==`>o//</d7><Esc>==<up>
vmap <leader><8 <Esc>`<O//<d8><Esc>==`>o//</d8><Esc>==<up>
vmap <leader><9 <Esc>`<O//<d9><Esc>==`>o//</d9><Esc>==<up>

"remove <d[x]> <leader>d[x]d
nmap <leader>d0d :call RemoveBalisePart(0)<CR>
nmap <leader>d1d :call RemoveBalisePart(1)<CR>
nmap <leader>d2d :call RemoveBalisePart(2)<CR>
nmap <leader>d3d :call RemoveBalisePart(3)<CR>
nmap <leader>d4d :call RemoveBalisePart(4)<CR>
nmap <leader>d5d :call RemoveBalisePart(5)<CR>
nmap <leader>d6d :call RemoveBalisePart(6)<CR>
nmap <leader>d7d :call RemoveBalisePart(7)<CR>
nmap <leader>d8d :call RemoveBalisePart(8)<CR>
nmap <leader>d9d :call RemoveBalisePart(9)<CR>
function! RemoveBalisePart(n_part)
	call NormRemoveDeleteLineComment(a:n_part)
	exe '/\/\/<d' . a:n_part . '>'
	let first_line = line('.')
	exe '/\/\/<\/d' . a:n_part . '>'
	let end_line = line('.')
	exe first_line
	while first_line <= end_line
		:normal! dd
		let first_line += 1
	endwhile
endfunction
"""""""""""""""""""""""""""""""""""""comment""""""""""""""""""""""""""""""""""""
