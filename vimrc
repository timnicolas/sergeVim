" **************************************************************************** "
"																			   "
"														  :::	   ::::::::    "
"	 .vimrc												:+:		 :+:	:+:    "
"													  +:+ +:+		  +:+	   "
"	 By: tnicolas <marvin@42.fr>					+#+  +:+	   +#+		   "
"												  +#+#+#+#+#+	+#+			   "
"	 Created: 2017/09/05 16:54:52 by tnicolas		   #+#	  #+#			   "
"	 Updated: 2017/09/05 16:54:52 by tnicolas		  ###	########.fr		   "
"																			   "
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

"""""""""""""""""""""""""""""""""""""key""""""""""""""""""""""""""""""""""""""""
"notation in vimrc
"C					Control : <C-w>
"S					Shift : <S-k>
"A / M				Alt : <A-tab>
"<BS>				Backspace
"<Tab>				Tab
"<CR>				Enter
"<Enter>			Enter
"<Return>			Enter
"<Esc>				Escape
"<Space>			Space
"<Up>				Up arrow
"<Down>				Down arrow
"<Left>				Left arrow
"<Right>			Right arrow
"<F1> - <F12>		Function keys 1 to 12
"#1, #2..#9,#0		Function keys F1 to F9, F10
"<Insert>			Insert
"<Del>				Delete
"<Home>				Home
"<End>				End
"<PageUp>			Page-Up
"<PageDown>			Page-Down
"<bar>				the '|' character, which otherwise needs to be escaped '\|'
"""""""""""""""""""""""""""""""""""""key""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""Source"""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:help_vim_file='~/.vim/vim_help_file'
source ~/.vim/sergeVim/param.vim
source ~/.vim/sergeVim/basic_function.vim
source ~/.vim/sergeVim/plugin.vim
source ~/.vim/sergeVim/abreviate.vim
source ~/.vim/sergeVim/function.vim
source ~/.vim/sergeVim/42header.vim
source ~/.vim/sergeVim/norm.vim
"""""""""""""""""""""""""""""""""""""Source"""""""""""""""""""""""""""""""""""""
