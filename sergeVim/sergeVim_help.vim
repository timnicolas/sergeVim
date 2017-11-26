" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    sergeVim_help.vim                                  :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 12:07:06 by tnicolas          #+#    #+#              "
"    Updated: 2017/11/26 12:38:08 by tnicolas         ###   ########.fr        "
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

"<F[x]> command:
"<F1>				42header
"<F3>				enable/disable relative number
"<F4>				show actual line
"<F5>				create session (mksession)
"<leader><F5>		create session (mksession) and quit

"abreviate:
"- mainn			create a main
"testt				create a test file
"{{					open and close { }

"command:
"- :Plugin			install and update plugin
"- :WW				check the norm in the file (only on 42 imac)
"- :Norm			norm the file

"<leader> + ...
"h					open help
"<tab>				move tab to the right
"<S-tab>			move tab to the left

"v					reload vimrc
"g					open/close file navigator
"z					open zsh in the current buffer
"b					open bash in the current buffer
"mm					disable mouse
"ma					enable mouse
"y					copy from vim
"p					paste in vim

";					put the ';' at the end of prototypes in .h files
"				!!! add check type of the file
"ff					highlight function prototypes (not static function)
"yff				copy all prototypes (not static) in buffer a ("ap to paste)
"/					comment region (visual only)
"\					uncomment region (visual only)
"d/d				remove comment (not with ///)
"dld				remove all lines with //dd
"d[x]d				remove between the 2 balise <d5> ... </d5>
"<[x]				create block //<d[x]> (visual mode only)
"				!!! add mode to remove all balise of the same type
"[([{'"]			create block (ex (test)) (visual mode only exept for '{')
"nn					make norm in the file

"<C-w><right>		move to buffer right
"<C-w><left>		move to buffer left
"<C-w><up>			move to buffer up
"<C-w><down>		move to buffer down

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
"split:
":vs
"""""""""""""""""""""""""""""""""""""defaut_shortcut""""""""""""""""""""""""""""
