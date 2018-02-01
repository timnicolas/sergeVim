" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    comment.vim                                        :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/08 23:31:03 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/08 23:31:27 by tnicolas         ###   ########.fr        "
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
	exe ':silent!' . a:firstline . ',' . a:lastline . 's/^\s\+\zs' . l:comment .
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
	:silent! % g/^\s*\/\/.*/d
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

"	comment line with //dd comment <leader>dl/
nmap <leader>dl/ :call NormCommentDeleteLineComment('d')<CR>
function! NormCommentDeleteLineComment(n)
	call SetCursorPlaceSave()
	exe 'silent! % s/^\zs\s*\/\/\ze.\+\/\/d' . a:n . '/'
	exe 'silent! % s/^\zs\ze.\+\/\/d' . a:n . '/\/\/'
	call SetCursorPlaceGo()
endfunction

"	decomment line with //dd comment <leader>dl\
nmap <leader>dl\ :call NormDecommentDeleteLineComment('d')<CR>
function! NormDecommentDeleteLineComment(n)
	call SetCursorPlaceSave()
	exe 'silent! % s/^\s*\zs\/\/\ze.\+\/\/d' . a:n . '/'
	call SetCursorPlaceGo()
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

"comment <d[x]> <leader></[x]
nmap <leader></0 :call CommentBalisePart(0)<CR>
nmap <leader></1 :call CommentBalisePart(1)<CR>
nmap <leader></2 :call CommentBalisePart(2)<CR>
nmap <leader></3 :call CommentBalisePart(3)<CR>
nmap <leader></4 :call CommentBalisePart(4)<CR>
nmap <leader></5 :call CommentBalisePart(5)<CR>
nmap <leader></6 :call CommentBalisePart(6)<CR>
nmap <leader></7 :call CommentBalisePart(7)<CR>
nmap <leader></8 :call CommentBalisePart(8)<CR>
nmap <leader></9 :call CommentBalisePart(9)<CR>
function! CommentBalisePart(n_part)
	call SetCursorPlaceSave()
	exe 'silent! % s/^\zs\s*\/\/\ze.\+\/\/d' . a:n_part . '/'
	exe 'silent! % s/^\zs\ze.\+\/\/d' . a:n_part . '/\/\/'
	call SetCursorPlaceGo()
endfunction

"decomment <d[x]> <leader><\[x]
nmap <leader><\0 :call DecommentBalisePart(0)<CR>
nmap <leader><\1 :call DecommentBalisePart(1)<CR>
nmap <leader><\2 :call DecommentBalisePart(2)<CR>
nmap <leader><\3 :call DecommentBalisePart(3)<CR>
nmap <leader><\4 :call DecommentBalisePart(4)<CR>
nmap <leader><\5 :call DecommentBalisePart(5)<CR>
nmap <leader><\6 :call DecommentBalisePart(6)<CR>
nmap <leader><\7 :call DecommentBalisePart(7)<CR>
nmap <leader><\8 :call DecommentBalisePart(8)<CR>
nmap <leader><\9 :call DecommentBalisePart(9)<CR>
function! DecommentBalisePart(n_part)
	call SetCursorPlaceSave()
	exe 'silent! % s/^\s*\zs\/\/\ze.\+\/\/d' . a:n_part . '/'
	call SetCursorPlaceGo()
endfunction

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
	call SetCursorPlaceSave()
	call NormRemoveDeleteLineComment(a:n_part)
	while search('\/\/<d' . a:n_part . '>', 'c', line('0')) != 0 "&&
				\search('\/\/<\/d' . a:n_part . '>', 'c', line('0')) != 0
		exe '/\/\/<d' . a:n_part . '>'
		let first_line = line('.')
		exe '/\/\/<\/d' . a:n_part . '>'
		let end_line = line('.')
		exe first_line
		while first_line <= end_line
			:normal! dd
			let first_line += 1
		endwhile
	endwhile
	call SetCursorPlaceGo()
endfunction
"""""""""""""""""""""""""""""""""""""comment""""""""""""""""""""""""""""""""""""
