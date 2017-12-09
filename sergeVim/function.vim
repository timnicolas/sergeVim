" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    function.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:57:34 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/10 00:14:04 by tnicolas         ###   ########.fr        "
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
"""""""""""""""""""""""""""""""""""""function"""""""""""""""""""""""""""""""""""
