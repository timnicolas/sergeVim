" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    alias.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/14 22:41:53 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/18 10:51:52 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""alias""""""""""""""""""""""""""""""""""""""
command! SergeAlias call SergeUpdateAlias()
function! SergeUpdateAlias()
	if g:enable_alias == 1
		exe ':e ' . g:alias_file
		if g:enable_alias1 == 1
			call SergeUpdateAliasName(g:alias1_name, g:alias1)
		endif
		if g:enable_alias2 == 1
			call SergeUpdateAliasName(g:alias2_name, g:alias2)
		endif
		if g:enable_alias3 == 1
			call SergeUpdateAliasName(g:alias3_name, g:alias3)
		endif
		if g:enable_alias4 == 1
			call SergeUpdateAliasName(g:alias4_name, g:alias4)
		endif
		if g:enable_alias5 == 1
			call SergeUpdateAliasName(g:alias5_name, g:alias5)
		endif
		if g:enable_alias6 == 1
			call SergeUpdateAliasName(g:alias6_name, g:alias6)
		endif
		if g:enable_alias7 == 1
			call SergeUpdateAliasName(g:alias7_name, g:alias7)
		endif
		if g:enable_alias8 == 1
			call SergeUpdateAliasName(g:alias8_name, g:alias8)
		endif
		if g:enable_alias9 == 1
			call SergeUpdateAliasName(g:alias9_name, g:alias9)
		endif
		if g:enable_alias10 == 1
			call SergeUpdateAliasName(g:alias10_name, g:alias10)
		endif
		if g:enable_alias11 == 1
			call SergeUpdateAliasName(g:alias11_name, g:alias11)
		endif
		if g:enable_alias12 == 1
			call SergeUpdateAliasName(g:alias12_name, g:alias12)
		endif
		if g:enable_alias13 == 1
			call SergeUpdateAliasName(g:alias13_name, g:alias13)
		endif
		if g:enable_alias14 == 1
			call SergeUpdateAliasName(g:alias14_name, g:alias14)
		endif
		if g:enable_alias15 == 1
			call SergeUpdateAliasName(g:alias15_name, g:alias15)
		endif
		if g:enable_alias16 == 1
			call SergeUpdateAliasName(g:alias16_name, g:alias16)
		endif
		if g:enable_alias17 == 1
			call SergeUpdateAliasName(g:alias17_name, g:alias17)
		endif
		if g:enable_alias18 == 1
			call SergeUpdateAliasName(g:alias18_name, g:alias18)
		endif
		if g:enable_alias19 == 1
			call SergeUpdateAliasName(g:alias19_name, g:alias19)
		endif
		if g:enable_alias20 == 1
			call SergeUpdateAliasName(g:alias20_name, g:alias20)
		endif
		:w
"		exe ':bd ' . g:alias_file
	endif
endfunction
function! SergeUpdateAliasName(name, text)
	if search('^alias.\+' . a:name . '\s*=.*', 'c') > 1
		:normal dd
	elseif search('#\+alias.\+' . a:name . '\s*=.*', 'b') > 0
		return
	endif
	:normal G
	exe ':normal o' . a:text
endfunction
"""""""""""""""""""""""""""""""""""""alias""""""""""""""""""""""""""""""""""""""
