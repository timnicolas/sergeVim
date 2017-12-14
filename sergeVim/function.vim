" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    function.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:57:34 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/14 11:20:30 by tnicolas         ###   ########.fr        "
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
	call SetCursorPlaceSave()
	let line_before = line('.')
	if expand('%:e') == 'h'
		:% s/)\n/);\r/g
	elseif search(';\s*\n', 'n', line('.')) == line_before
		exe ':' . line_before . 's/;\s*\n/\r'
	else
		exe ':' . line_before . 's/\s*\n/;\r'
	endif
	:silent! /cgvhadgfhadgfjksahfjkdhfjkdshfHL
	call SetCursorPlaceGo()
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
	call SetCursorPlaceSave()
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
	call SetCursorPlaceGo()
	:echo nb_func " func yanked in buffer A"@a
endfunction

"create block <leader>[([{'"]
vmap <leader>( <Esc>`<i(<Esc>`>a<right>)<Esc>
vmap <leader>[ <Esc>`<i[<Esc>`>a<right>]<Esc>
vmap <leader>' <Esc>`<i'<Esc>`>a<right>'<Esc>
vmap <leader>" <Esc>`<i"<Esc>`>a<right>"<Esc>
nmap <leader>{ o}<Esc><up>O{<Esc>=2<down><down>
"vmap <leader>{ <Esc>`<O{<Esc>==`>o}<Esc>==<up>
vmap <leader>{ :call PutAcolade()<CR>
function! PutAcolade() range
	exe ':' . a:firstline
	:normal O
	exe ':' . line('.') . 's/^\s*/{'
	let line_plus1 = a:lastline + 1
	exe ':' . l:line_plus1
	:normal o
	let line_plus1 = line('.') + 1
	exe ':' . line('.') . 's/^\s*/}'
	let rangeIndent = a:lastline - a:firstline + 2
	exe ':normal =' . l:rangeIndent . 'k'
endfunction
vmap <leader>* <Esc>`>a*/<Esc>`<i/*<Esc>
nmap <leader>* o*/<Esc><up>O/*<Esc>=2<down><down>

"open file under cursor <C-o> <C-p>
nmap <C-o> :call TryOpenFileUnderCursorName()<CR>
nmap <C-p> :call TryOpenFileUnderCursorNameLast()<CR>
let g:last1 = 'no_file'
let g:last1_pos = 'no_file'
let g:last1_top = 'no_file'
let g:last2 = 'no_file'
let g:last2_pos = 'no_file'
let g:last2_top = 'no_file'
let g:last3 = 'no_file'
let g:last3_pos = 'no_file'
let g:last3_top = 'no_file'
let g:last4 = 'no_file'
let g:last4_pos = 'no_file'
let g:last4_top = 'no_file'
let g:last5 = 'no_file'
let g:last5_pos = 'no_file'
let g:last5_top = 'no_file'
let g:last6 = 'no_file'
let g:last6_pos = 'no_file'
let g:last6_top = 'no_file'
let g:last7 = 'no_file'
let g:last7_pos = 'no_file'
let g:last7_top = 'no_file'
let g:last8 = 'no_file'
let g:last8_pos = 'no_file'
let g:last8_top = 'no_file'
let g:last9 = 'no_file'
let g:last9_pos = 'no_file'
let g:last9_top = 'no_file'
let g:last10 = 'no_file'
let g:last10_pos = 'no_file'
let g:last10_top = 'no_file'
let g:last11 = 'no_file'
let g:last11_pos = 'no_file'
let g:last11_top = 'no_file'
let g:last12 = 'no_file'
let g:last12_pos = 'no_file'
let g:last12_top = 'no_file'
let g:last13 = 'no_file'
let g:last13_pos = 'no_file'
let g:last13_top = 'no_file'
let g:last14 = 'no_file'
let g:last14_pos = 'no_file'
let g:last14_top = 'no_file'
let g:last15 = 'no_file'
let g:last15_pos = 'no_file'
let g:last15_top = 'no_file'
let g:last16 = 'no_file'
let g:last16_pos = 'no_file'
let g:last16_top = 'no_file'
let g:last17 = 'no_file'
let g:last17_pos = 'no_file'
let g:last17_top = 'no_file'
let g:last18 = 'no_file'
let g:last18_pos = 'no_file'
let g:last18_top = 'no_file'
let g:last19 = 'no_file'
let g:last19_pos = 'no_file'
let g:last19_top = 'no_file'
function! TryOpenFileUnderCursorName()
	call SetCursorPlaceMoveArg('last18', 'last18_pos', 'last18_top',
				\'last19', 'last19_pos', 'last19_top')
	call SetCursorPlaceMoveArg('last17', 'last17_pos', 'last17_top',
				\'last18', 'last18_pos', 'last18_top')
	call SetCursorPlaceMoveArg('last16', 'last16_pos', 'last16_top',
				\'last17', 'last17_pos', 'last17_top')
	call SetCursorPlaceMoveArg('last15', 'last15_pos', 'last15_top',
				\'last16', 'last16_pos', 'last16_top')
	call SetCursorPlaceMoveArg('last14', 'last14_pos', 'last14_top',
				\'last15', 'last15_pos', 'last15_top')
	call SetCursorPlaceMoveArg('last13', 'last13_pos', 'last13_top',
				\'last14', 'last14_pos', 'last14_top')
	call SetCursorPlaceMoveArg('last12', 'last12_pos', 'last12_top',
				\'last13', 'last13_pos', 'last13_top')
	call SetCursorPlaceMoveArg('last11', 'last11_pos', 'last11_top',
				\'last12', 'last12_pos', 'last12_top')
	call SetCursorPlaceMoveArg('last10', 'last10_pos', 'last10_top',
				\'last11', 'last11_pos', 'last11_top')
	call SetCursorPlaceMoveArg('last9', 'last9_pos', 'last9_top',
				\'last10', 'last10_pos', 'last10_top')
	call SetCursorPlaceMoveArg('last8', 'last8_pos', 'last8_top',
				\'last9', 'last9_pos', 'last9_top')
	call SetCursorPlaceMoveArg('last7', 'last7_pos', 'last7_top',
				\'last8', 'last8_pos', 'last8_top')
	call SetCursorPlaceMoveArg('last6', 'last6_pos', 'last6_top',
				\'last7', 'last7_pos', 'last7_top')
	call SetCursorPlaceMoveArg('last5', 'last5_pos', 'last5_top',
				\'last6', 'last6_pos', 'last6_top')
	call SetCursorPlaceMoveArg('last4', 'last4_pos', 'last4_top',
				\'last5', 'last5_pos', 'last5_top')
	call SetCursorPlaceMoveArg('last3', 'last3_pos', 'last3_top',
				\'last4', 'last4_pos', 'last4_top')
	call SetCursorPlaceMoveArg('last2', 'last2_pos', 'last2_top',
				\'last3', 'last3_pos', 'last3_top')
	call SetCursorPlaceMoveArg('last1', 'last1_pos', 'last1_top',
				\'last2', 'last2_pos', 'last2_top')
	call SetCursorPlaceSaveArg('last1', 'last1_pos', 'last1_top')
	let func_name = expand('<cword>')
	echo g:last1 . ' ' . g:last1_top
	if search('^\(static\s\+\)\=\w\+[\t ]\+\**' . l:func_name . '[\t ]*(.*\(\n.*\)*)', 'b') > 0
		:normal zt
"		echo '"' . expand('%') . '" -> ' . l:func_name . '()'
	else
		exe ':silent! vimgrep /^\(static\s\+\)\=\w\+[\t ]\+\**' . l:func_name . '[\t ]*(.*\(\n.*\)*)/ **/*.c'
		if search('^\(static\s\+\)\=\w\+[\t ]\+\**' . l:func_name . '[\t ]*(.*\(\n.*\)*)', 'b') > 0
			:normal zt
		endif
"		echo '"' . expand('%') . '" -> ' . l:func_name . '()'
	endif
endfunction
function! TryOpenFileUnderCursorNameLast()
	if g:last1 != 'no_file'
		call SetCursorPlaceGoArg(g:last1, g:last1_pos, g:last1_top)
		call SetCursorPlaceMoveArg('last2', 'last2_pos', 'last2_top',
					\'last1', 'last1_pos', 'last1_top')
		call SetCursorPlaceMoveArg('last3', 'last3_pos', 'last3_top',
					\'last2', 'last2_pos', 'last2_top')
		call SetCursorPlaceMoveArg('last4', 'last4_pos', 'last4_top',
					\'last3', 'last3_pos', 'last3_top')
		call SetCursorPlaceMoveArg('last5', 'last5_pos', 'last5_top',
					\'last4', 'last4_pos', 'last4_top')
		call SetCursorPlaceMoveArg('last6', 'last6_pos', 'last6_top',
					\'last5', 'last5_pos', 'last5_top')
		call SetCursorPlaceMoveArg('last7', 'last7_pos', 'last7_top',
					\'last6', 'last6_pos', 'last6_top')
		call SetCursorPlaceMoveArg('last8', 'last8_pos', 'last8_top',
					\'last7', 'last7_pos', 'last7_top')
		call SetCursorPlaceMoveArg('last9', 'last9_pos', 'last9_top',
					\'last8', 'last8_pos', 'last8_top')
		call SetCursorPlaceMoveArg('last10', 'last10_pos', 'last10_top',
					\'last9', 'last9_pos', 'last9_top')
		call SetCursorPlaceMoveArg('last11', 'last11_pos', 'last11_top',
					\'last10', 'last10_pos', 'last10_top')
		call SetCursorPlaceMoveArg('last12', 'last12_pos', 'last12_top',
					\'last11', 'last11_pos', 'last11_top')
		call SetCursorPlaceMoveArg('last13', 'last13_pos', 'last13_top',
					\'last12', 'last12_pos', 'last12_top')
		call SetCursorPlaceMoveArg('last14', 'last14_pos', 'last14_top',
					\'last13', 'last13_pos', 'last13_top')
		call SetCursorPlaceMoveArg('last15', 'last15_pos', 'last15_top',
					\'last14', 'last14_pos', 'last14_top')
		call SetCursorPlaceMoveArg('last16', 'last16_pos', 'last16_top',
					\'last15', 'last15_pos', 'last15_top')
		call SetCursorPlaceMoveArg('last17', 'last17_pos', 'last17_top',
					\'last16', 'last16_pos', 'last16_top')
		call SetCursorPlaceMoveArg('last18', 'last18_pos', 'last18_top',
					\'last17', 'last17_pos', 'last17_top')
		call SetCursorPlaceMoveArg('last19', 'last19_pos', 'last19_top',
					\'last18', 'last18_pos', 'last18_top')
		let g:last19 = 'no_file'
		let g:last19_pos = 'no_file'
		let g:last19_top = 'no_file'
	else
		echo "no last file"
	endif
endfunction
"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
