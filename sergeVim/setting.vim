" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    setting.vim                                        :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/05 12:11:26 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/21 19:53:57 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""setting""""""""""""""""""""""""""""""""""""
"defaut username and mail for the header
let g:username42='tnicolas'
let g:mail42='marvin@42.fr'
"enable 42header (<F1> or :Header)
let g:enable_42_header=1
"enable auto update in 42 header
let g:auto_update_42_header=1

"min number of line around cursor
let g:min_number_line_ar_cur = 4
"enable or diable mouse
let g:enable_mouse=1
"highlight search
let g:highlight_search=1
"highlight line
let g:setHighlightLine=0
"""""""""""""""""""""""""""""""""""""setting""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""color""""""""""""""""""""""""""""""""""""""
"enable more color
let g:_enable_color_all = 1
"""""""""""""""""""""""""""""""""""""color""""""""""""""""""""""""""""""""""""""

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
			\'../libft/includes/',
			\'../../includes',
			\'../../libft/includes',
			\'../../libft',
			\'../../../includes',
			\'../../../libft/includes',
			\'../../../libft'
			\]
"""""""""""""""""""""""""""""""""""""plugin"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""alias""""""""""""""""""""""""""""""""""""""
"enable SergeVim shell alias
let g:enable_alias=1
"alias file
let g:alias_file='~/.zshrc'
"enable syntax color (advanced)
let g:_enable_color_all=1

let g:enable_alias1 = 1
let g:alias1_name = 'valg'
let g:alias1 = 'alias valg="valgrind --leak-check=full --track-origins=yes
			\ --show-reachable=no"'

let g:enable_alias2 = 1
let g:alias2_name = 'gpush'
let g:alias2 = "alias gpush='echo -n \"commit message : \" && read msg &&
			\ git add -A && git commit -m \"$msg\" && git push origin
			\ `git branch | grep \"*\" | cut -c 3-`'"

let g:enable_alias3 = 1
let g:alias3_name = 'bim'
let g:alias3 = 'alias bim="vim +Line"'

let g:enable_alias4 = 1
let g:alias4_name = 'vimrc'
let g:alias4 = 'alias vimrc="vim +12 +Line ~/.vimrc ~/.vim/sergevim/*"'

let g:enable_alias5 = 1
let g:alias5_name = 'serge'
let g:alias5 = "alias serge='cd ~/sergeVim'"

let g:enable_alias6 = 1
let g:alias6_name = 'cleanstars'
let g:alias6 = "alias cleanstars='clear'"

let g:enable_alias6 = 1
let g:alias6_name = 'goinfre'
let g:alias6 = "alias goinfre='exit'"

let g:enable_alias7 = 1
let g:alias7_name = 'serge'
let g:alias7 = "alias serge='cd " . g:pwdGitSergeVim . "'"

let g:enable_alias8 = 1
let g:alias8_name = 'wgcc'
let g:alias8 = "alias wgcc='gcc -Wall -Wextra'"

let g:enable_alias9 = 1
let g:alias9_name = 'cwgcc'
let g:alias9 = "alias cwgcc='clear && gcc -Wall -Wextra'"

let g:enable_alias10 = 1
let g:alias10_name = 'cgcc'
let g:alias10 = "alias cgcc='clear && gcc'"

let g:enable_alias11 = 1
let g:alias11_name = 'mx'
let g:alias11 = "alias mx='make -j3 exec'"

let g:enable_alias12 = 1
let g:alias12_name = 'vim_init_ctrlO'
let g:alias12 = "alias vim_init_ctrlO='vim +SergeInitCtrlO +q'"

let g:enable_alias13 = 1
let g:alias13_name = 'vim_serge_update'
let g:alias13 = "alias vim_serge_update='vim +SergeUpdate +q'"

let g:enable_alias14 = 1
let g:alias14_name = 'git_vim_update'
let g:alias14 = "alias git_vim_update='vim +GitSergeUpdate +q'"

let g:enable_alias15 = 1
let g:alias15_name = 'a'
let g:alias15 = "alias -g a='&& ./a.out'"

let g:enable_alias16 = 1
let g:alias16_name = 'g'
let g:alias16 = "alias g='gcc -Wall -Wextra'"

let g:enable_alias17 = 0
let g:alias17_name = ''
let g:alias17 = ""

let g:enable_alias18 = 0
let g:alias18_name = ''
let g:alias18 = ""

let g:enable_alias19 = 0
let g:alias19_name = ''
let g:alias19 = ""

let g:enable_alias20 = 0
let g:alias20_name = ''
let g:alias20 = ""
"""""""""""""""""""""""""""""""""""""alias""""""""""""""""""""""""""""""""""""""
