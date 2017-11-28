" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    plugin.vim                                         :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:58:30 by tnicolas          #+#    #+#              "
"    Updated: 2017/11/28 09:42:17 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""plugin"""""""""""""""""""""""""""""""""""""
"plugin
"Vundle
"	:source ~/.vimrc
"	:PluginInstall
":plugin to install plugin
command! Plugin call Plugin_install_()
function! PLugin_install_()
	:source ~/.vimrc
	:PluginInstall
endfunction
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Le plugin est hébergé à https://github.com/itchyny/lightline.vim
"pour la barre en bas de couleur
if g:_enablelightline == 1
	Plugin 'itchyny/lightline.vim'
endif

"gestionaire de fichier
if g:_enableNERDTree == 1
	Plugin 'scrooloose/nerdtree'
endif

"pour colorer les nom de couleur ex #FFFFFF #00FF00
if g:_enablecolorizer == 1
	Plugin 'vim-scripts/colorizer'
endif

"correction des erreurs de code
if g:_enablesyntastic == 1
	Plugin 'vim-syntastic/syntastic'
endif

"pour avoir des info sur le prog (variable, import...)
"Plugin 'majutsushi/tagbar'

"pour ouvrir un terminal ds un buffer vim
if g:_enableconque == 1
	Plugin 'wkentaro/conque.vim'
endif

"autocompletion
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'marcweber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'othree/vim-autocomplpop'

call vundle#end()

"	nerdtree
"		open/close nerdtree <leader>g
if g:_enableNERDTree == 1
	let g:state_NerdTree = 0
	nmap <leader>g :call NavFichier()<CR><C-w>=
	function! NavFichier()
		if (g:state_NerdTree == 0)
			:NERDTree
			let g:state_NerdTree = 1
		else
			:NERDTreeClose
			let g:state_NerdTree = 0
		endif
	endfunction
endif

"	Conque
"		open zsh <leader>z
if g:_enableconque == 1
	nmap <leader>z :ConqueTerm zsh<CR><up><down>
	"		open bash <leader>b
	nmap <leader>b :ConqueTerm bash<CR><up><down>
endif
"""""""""""""""""""""""""""""""""""""plugin"""""""""""""""""""""""""""""""""""""
