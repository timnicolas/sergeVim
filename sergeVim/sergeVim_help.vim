" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    sergeVim_help.vim                                  :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 12:07:06 by tnicolas          #+#    #+#              "
"    Updated: 2018/02/02 14:30:26 by tnicolas         ###   ########.fr        "
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
":SergeUpdate		update sergeVim opt setting ignore setting file
":SergeInitRepo		init git repository
"						:SergeUpdate setting
"SergeReload		reload sergeVim (update/install plugin and update alias)
":GitSergeUpdate	update git repository (ADMIN ONLY)
":SergeCow <arg>	create a cow-mentaire

"<F[x]> command:
"<F3>				enable/disable relative number
"<F4>				show actual line
"<F5>				show git diff
"<F7>				create session (mksession)
"<leader><F7>		create session (mksession) and quit

"<F8>				hide all python functions
"						zo - opens folds
"						zc - closes fold
"						zm - increases auto fold depth
"						zr - reduces auto fold depth
"						zR - show all

"<C-L>				termwinkey
"Vterm				open terminal in vertical split

"header
"<F1>				42header
":Serge42Header		create the 42header
"<F2>				sergaVim header
":SergeHeader		create the sergeHeader
":SergeEmptyHeader	create a empty header
"<leader><F2>		create a cow header
":SergeCowHeader	create a cow header
"<leader><F1>		update header
"SergeUpdateHeader	update header

"abreviate:
"mainn				create a main
"testt				create a test file
"{{					open and close { }

"norm
":WW				check the norm in the file (only on 42 imac)
":SergeNorm			make norm in the file
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
"<leader>b			show text in binary mode

"<leader>;			put the ';' at the end of prototypes in .h files
"<leader>ff			highlight function prototypes (not static function)
"<leader>yff		copy all prototypes (not static) in buffer a ("ap to paste)

"<leader>z			to quickly call a SergeFunction

"comment
"<leader>/			comment region (visual only)
"<leader>\			uncomment region (visual only)
"<leader>d/d		remove comment (not with ///)
"<leader>dld		remove all lines with //dd
"<leader>dl/		comment all lines with //dd
"<leader>dl\		decomment all lines with //dd
"<leader>*			create multiline comment

"balise //<d[x]> //</d[x]>
"<leader>d[x]d		remove between the 2 balise <d5> ... </d5>
"<leader><[x]		create block //<d[x]> (visual mode only)
"<leader>[([{'"*]	create block (ex (test)) (visual mode only exept for '{')

"tab/buffer
":SergeInitCtrlO	create a file where vim is open and set ctrlO faster
"<C-o>				go to function declaration (name under cursor)
":SergeCtrlO n [s]	search a function whith name n (search static and no static
"						with arg static ex :SergeCtrlO ft_search static)
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


"plugin vimagit
"	:Magit			to open vimagit in split
"	:MagitOnly		to open vimagit
"	R				to reload vimagit
"	<C-n>			go to next change
"	S				to add or remove change to commit
"	CC				to set commit message
"	CC				to commit
"	:SergeGit		to open vimagit in new tab (the first tab)
"	:Push			to push
"""""""""""""""""""""""""""""""""""""shortcut"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""cscope"""""""""""""""""""""""""""""""""""""
"cscope (database to search function, includes, ... in C)
"	init (in terminal):
"		cscope add **/*.[ch]
"
":cs add cscope.out		add default database
"cscope commands: (:cs <add|find|...> [args])
"add  : Add a new database             (Usage: add file|dir [pre-path] [flags])
"find : Query for a pattern            (Usage: find a|c|d|e|f|g|i|s|t name)
"       a: Find assignments to this symbol
"       c: Find functions calling this function
"       d: Find functions called by this function
"       e: Find this egrep pattern
"       f: Find this file
"       g: Find this definition
"       i: Find files #including this file
"       s: Find this C symbol
"       t: Find this text string
"help : Show this message              (Usage: help)
"kill : Kill a connection              (Usage: kill #)
"reset: Reinit all connections         (Usage: reset)
"show : Show connections               (Usage: show)
"""""""""""""""""""""""""""""""""""""cscope"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""info"""""""""""""""""""""""""""""""""""""""
"comment
" the auto indent of vim has been modified to keep comment in norm (and set
"   multiple line comment in norm)
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

":term				open term in horizontal split
":term ++curwin		open term in current split
"<C-L>:				run command in term

":bufdo[command]	make command in all buffer (ex :bufdo Header)
"""""""""""""""""""""""""""""""""""""defaut_shortcut""""""""""""""""""""""""""""
