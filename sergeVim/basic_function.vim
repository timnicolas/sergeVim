" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    basic_function.vim                                 :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:57:09 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/01 15:16:45 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""basic function"""""""""""""""""""""""""""""
colorscheme ron
set nocompatible "more vim function
filetype off
set noautoindent "indent gestion with plugin
filetype indent plugin on
set cindent "indent for c files
set smartindent "autoindent
syn on "coloration syntax
set number "number of line
"min line visible around cursor
exe 'set so=' . g:min_number_line_ar_cur
if g:enable_mouse == 1
	set mouse=a "mouse on
	if has("mouse_sgr")
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	endif
else
	set mouse=
endif
set tabstop=4 "tab size
set shiftwidth=4 "tab size
set noexpandtab "no replace tab to space
set omnifunc=syntaxcomplete#Complete "autocompletion (<C-n>)
set showcmd "see command
"set rulerformat=%27(%{strftime('%a\ %e\ %b\ %I:%M\ %p')}\ %2l,%-2(%c%V%)\ %P%)
set showmode "mode in status bar
set shm=a "intelligent print of avertissement
set laststatus=2 "show always status bar (not only on split mode
set cmdheight=1 "size of command bar
set colorcolumn=81 "column 81 in red
set autowrite "auto save when change buffer
set clipboard=unnamed "to copy and paste
if g:highlight_search == 1
	set hlsearch "highlight search
else
	set nohlsearch
endif
set incsearch "highlight when typing command (not only after)

"help <leader>h
nmap <leader>h :execute "tabnew ".g:help_vim_file<CR>
nmap <leader><C-h> :execute "tabnew ".g:help_vim_file<CR>
"""""""""""""""""""""""""""""""""""""basic function"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""copy/paste"""""""""""""""""""""""""""""""""
"copy
"	paste <leader>p
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"imap <leader>p <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>a
"	copy <leader>y
nmap <leader>y :.w !pbcopy<CR><CR>
vmap <leader>y :'<, '>w !pbcopy<CR><CR>
nmap <leader>d :. !pbcopy<CR><CR>
vmap <leader>d :'<, '> !pbcopy<CR><CR>
"	enable copy <leader>c
nmap <leader>c :!cat %<CR>
"""""""""""""""""""""""""""""""""""""copy/paste"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""save/quit""""""""""""""""""""""""""""""""""
"save and quit option
"create session <F5>
nmap <F5> :wa<CR>:mksession!<CR>
"create session and quit <leader><F5>
nmap <leader><F5> :wa<CR>:mksession!<CR>:wqa<CR>
"easy save
command! W w
command! WQ wq
command! Wq wq
command! WA wa
command! Wa wa
command! WQA wqa
command! WQa wqa
command! Wqa wqa
command! WqA wqa
command! XA xa
command! Xa xa
"""""""""""""""""""""""""""""""""""""save/quit""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""tab buffer"""""""""""""""""""""""""""""""""
"gest tab
"	tabmove next <leader> <tab>
nmap <leader><tab> :tabmove +1<CR>
nmap <leader><C-tab> :tabmove +1<CR>
"	tabmove last <leader> <S-tab>
nmap <leader><S-tab> :tabmove -1<CR>
nmap <leader><C-S-tab> :tabmove -1<CR>

"change buffer (<C-w> + up/down/right/left || hjkl)
"	right <C-w> l
nmap <C-w><C-right> <C-w>l
nmap <C-w><right> <C-w>l
nmap <C-w><C-l> <C-w>l
"	left <C-w> h
nmap <C-w><C-left> <C-w>h
nmap <C-w><left> <C-w>h
nmap <C-w><C-h> <C-w>h
"	up <C-w> k
nmap <C-w><C-up> <C-w>k
nmap <C-w><up> <C-w>k
nmap <C-w><C-k> <C-w>k
"	down <C-w> j
nmap <C-w><C-down> <C-w>j
nmap <C-w><down> <C-w>j
nmap <C-w><C-j> <C-w>j

"auto open in vertical split (left) <leader> f
"nmap <leader>f <C-w>f<C-w>L
"imap <leader>f <esc><C-w>f<C-w>Li
"""""""""""""""""""""""""""""""""""""tab buffer"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""other""""""""""""""""""""""""""""""""""""""
"mouse <leader>m m/a
"	disable <leader>mm
nmap <leader>mm :set mouse=<CR>
"	enable <leader>ma
nmap <leader>ma :set mouse=a<CR>
"enter in normal mode : go to insert mode then enter <CR>
"nmap <CR> i<CR>

"relative number : <F3>
nmap <F3> :set invrelativenumber<CR>
imap <F3> <esc>:set invrelativenumber<CR>a

"cursor line <F4>
nmap <F4> :set invcursorline<CR>
imap <F4> <esc>:set invcursorline<CR>a

"reload vimrc <leader>v
nmap <leader>v :so $MYVIMRC<CR>
nmap <leader><C-v> :so $MYVIMRC<CR>
nmap <leader>V <C-o>:so $MYVIMRC<CR>

"fast move of 5 char <S + dir>
"	fast move of 5 char right <S-right>
nmap <S-right> <right><right><right><right><right>
imap <S-right> <right><right><right><right><right>
"	fast move of 5 char left <S-left>
nmap <S-left> <left><left><left><left><left>
imap <S-left> <left><left><left><left><left>
"	fast move of 5 char up <S-up>
nmap <S-up> :-5<CR>
imap <S-up> <C-o>:-5<CR>
"	fast move of 5 char down <S-down>
nmap <S-down> :+5<CR>
imap <S-down> <C-o>:+5<CR>
"""""""""""""""""""""""""""""""""""""other""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""Ugo""""""""""""""""""""""""""""""""""""""""
command! Ugo echo 'pas normal'
command! Goinfre normal ggdG
command! Cleanstars %s/*//g
"""""""""""""""""""""""""""""""""""""Ugo""""""""""""""""""""""""""""""""""""""""
