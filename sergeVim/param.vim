" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    param.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 11:57:59 by tnicolas          #+#    #+#              "
"    Updated: 2017/11/28 17:03:57 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""param""""""""""""""""""""""""""""""""""""""
"defaut username and mail for the header
let g:username42='tnicolas'
let g:mail42='marvin@42.fr'

"min number of line around cursor
let g:min_number_line_ar_cur = 4
"enable or diable mouse
let g:enable_mouse=1
"highlight search
let g:highlight_search=1
"enable 42header (<F1> or :Header)
let g:enable_42_header=1
"""""""""""""""""""""""""""""""""""""param""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""plugin"""""""""""""""""""""""""""""""""""""
"activer ou desactiver un plugin
"	NERDTree (navigateur de fichier)
let g:_enableNERDTree=1
"	lightline (barre colore en bas de l'ecran)
let g:_enablelightline=1
"	colorizer (les couleurs se colorent #FF00FF #120499)
let g:_enablecolorizer=1
"	syntastic (correction code)
let g:_enablesyntastic=1
"	conque (utilisation du terminale dans un buffer)
let g:_enableconque=1

"taille de la fenetre nerdtree
let g:NERDTreeWinSize=27
"pour supprimer les erreurs syntastic preciser tout les dossiers a header
let g:syntastic_c_include_dirs = [
			\'../includes',
			\'includes',
			\'../lib/includes',
			\'lib/includes',
			\'includes',
			\'libft/includes/',
			\'../libft/includes/'
			\'../../includes'
			\'../../libft/includes'
			\'../../libft'
			\]
"""""""""""""""""""""""""""""""""""""plugin"""""""""""""""""""""""""""""""""""""
