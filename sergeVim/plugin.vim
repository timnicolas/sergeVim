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

"""""""""""""""""""""""""""""""""""""plugin"""""""""""""""""""""""""""""""""""""
"plugin
"Vundle
"	:source ~/.vimrc
"	:PluginInstall
":plugin to install plugin
command Plugin call Plugin_install_()
function! PLugin_install_()
	:source ~/.vimrc
	:PluginInstall
endfunction
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Le plugin est hébergé à https://github.com/itchyny/lightline.vim
"pour la barre en bas de couleur
Plugin 'itchyny/lightline.vim'

"gestionaire de fichier
Plugin 'scrooloose/nerdtree'

"pour colorer les nom de couleur ex #FFFFFF #00FF00
Plugin 'vim-scripts/colorizer'

"correction des erreurs de code
Plugin 'vim-syntastic/syntastic'

"pour avoir des info sur le prog (variable, import...)
"Plugin 'majutsushi/tagbar'

"pour ouvrir un terminal ds un buffer vim
Plugin 'wkentaro/conque.vim'

"autocompletion
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'marcweber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'othree/vim-autocomplpop'

call vundle#end()

"taille de la fenetre nerdtree
let g:NERDTreeWinSize=27

"plugin shortcut
"	nerdtree
"		open/close nerdtree <leader>g
nmap <leader>g :call NavFichier()<CR><C-w>=
let g:state_NerdTree = 0
function! NavFichier()
	if (g:state_NerdTree == 0)
		:NERDTree
		let g:state_NerdTree = 1
	else
		:NERDTreeClose
		let g:state_NerdTree = 0
	endif
endfunction

"	Conque
"		open zsh <leader>z
nmap <leader>z :ConqueTerm zsh<CR><up><down>
"		open bash <leader>b
nmap <leader>b :ConqueTerm bash<CR><up><down>
"""""""""""""""""""""""""""""""""""""plugin"""""""""""""""""""""""""""""""""""""
