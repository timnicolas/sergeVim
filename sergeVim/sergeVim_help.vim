" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    sergeVim_help.vim                                  :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 12:07:06 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/14 23:52:03 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""shortcut"""""""""""""""""""""""""""""""""""
"leader key:		,

"<leader>h			open help
":SergeHelp			open help
"<leader>s			open setting
":SergeSetting		open setting

":SergeAlias		update alias

"<F[x]> command:
"<F3>				enable/disable relative number
"<F4>				show actual line
"<F5>				create session (mksession)
"<leader><F5>		create session (mksession) and quit

"header
"<F1>				42header
":Header			create the 42header
"<F2>				sergaVim header
":SergeHeader		create the sergeHeader
":EmptyHeader		create a empty header

"abreviate:
"mainn				create a main
"testt				create a test file
"{{					open and close { }

"norm
":WW				check the norm in the file (only on 42 imac)
":Norm				make norm in the file
"<leader>nn			make norm in the file

"Makefile
"<F6>				make exec
"<leader><F6>		make reexec
":Make				make
":MakeEx			make exec
":MakeRe			make re
":MakeCl			make clean
":MakeFc			make fclean
":MakeNo			make norm


"<C-d>				invert sign (+ -, * /, ...)
"<leader>v			reload vimrc
"<leader>g			open/close file navigator
"<leader>mm			disable mouse
"<leader>ma			enable mouse
"<leader>y			copy from vim
"<leader>p			paste in vim

"<leader>;			put the ';' at the end of prototypes in .h files
"<leader>ff			highlight function prototypes (not static function)
"<leader>yff		copy all prototypes (not static) in buffer a ("ap to paste)

"comment
"<leader>/			comment region (visual only)
"<leader>\			uncomment region (visual only)
"<leader>d/d		remove comment (not with ///)
"<leader>dld		remove all lines with //dd
"<leader>dl/		comment all lines with //dd
"<leader>dl\		decomment all lines with //dd
"<leader>*			 create multiline comment

"balise //<d[x]> //</d[x]>
"<leader>d[x]d		remove between the 2 balise <d5> ... </d5>
"<leader><[x]		create block //<d[x]> (visual mode only)
"<leader>[([{'"*]	create block (ex (test)) (visual mode only exept for '{')

"tab/buffer
"<C-o>				go to function declaration (name under cursor)
"<C-p>				go to last <C-o>
"<leader><tab>		move tab to the right
"<leader><S-tab>	move tab to the left
"<C-l>				move to buffer right
"<C-h>				move to buffer left
"<C-k>				move to buffer up
"<C-j>				move to buffer down

"<S-right>			fast move of 5 char right
"<S-left>			fast move of 5 char left
"<S-up>				fast move of 5 char up
"<S-down>			fast move of 5 char down
"""""""""""""""""""""""""""""""""""""shortcut"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""info"""""""""""""""""""""""""""""""""""""""
"comment
"	ignore delete comment (<leader>nc) with ///
"	delete all lines of comment (<leader>ndd) //dd

"delete rank
"	//<d[x]> start
"	//</d[x]> end
"	//d[x] line
"""""""""""""""""""""""""""""""""""""info"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""defaut_shortcut""""""""""""""""""""""""""""
"split: (splits are usefull if you open many files in vim)
":vs				vertical split
":sp				horizontal split
":bn				buffer next
":bp				buffer previous
":b [name]			buffer [name]
":tabnew			new tab
":tabclose			close tab
":bd				close buffer

":bufdo[command]	make command in all buffer (ex :bufdo Header)
"""""""""""""""""""""""""""""""""""""defaut_shortcut""""""""""""""""""""""""""""
