" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    ctrlD.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/09 20:13:15 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/09 20:14:17 by tnicolas         ###   ########.fr        "
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

"""""""""""""""""""""""""""""""""""""ctrlD""""""""""""""""""""""""""""""""""""""
"invert sign (+ -, * /, ...) <C-d>
imap <C-d> <C-o>:call SergeInvertSign()<CR>
nmap <C-d> :call SergeInvertSign()<CR>
function! SergeInvertSign()
	let line = getline('.')
	let col = col('.')
	"	exe ':normal 6|'
	let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
	if char_act == '+'
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act == '='
			:normal h
			:normal r-
		elseif char_act == '+'
			:normal r-
			:normal h
			:normal r-
		else
			:silent normal hh
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act == '+'
				:normal r-
				:normal l
				:normal r-
			else
				:normal l
				:normal r-
			endif
		endif
	elseif char_act == '-'
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act =~# '\d' || char_act =~# '\w'
			:normal h
			:normal x
		elseif char_act == '='
			:normal h
			:normal r+
		elseif char_act == '>'
			:normal h
			:normal xx
			:normal i.
		elseif char_act == '-'
			:normal r+
			:normal h
			:normal r+
		else
			:silent normal hh
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act == '-'
				:normal r+
				:normal l
				:normal r+
			else
				:normal l
				:normal r+
			endif
		endif
	elseif char_act =~# '\d'
		:silent normal h
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act =~# '\s'
			:normal l
			:normal i-
		endif
	elseif char_act == '|'
		:normal r&
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act == '|'
			:normal r&
			:normal h
		else
			:silent normal hh
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act == '|'
				:normal r&
				:normal l
			endif
		endif
	elseif char_act == '&'
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act =~# '\w'
			:normal h
			:normal r*
		else
			:normal h
			:normal r|
			:silent normal l
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act == '&'
				:normal r|
				:normal h
			else
				:silent normal hh
				let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
				if char_act == '&'
					:normal r|
					:normal l
				endif
			endif
		endif
	elseif char_act == '*'
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act =~# '\w'
			:normal h
			:normal r&
		elseif char_act == '*'
			:normal x
			:normal h
		elseif char_act == ')'
			:normal h
		elseif char_act == '='
			:normal h
			:normal r/
		else
			:normal h
			:normal r/
		endif
	elseif char_act == '/'
		:normal r*
	elseif char_act == '%'
		:normal r*
	elseif char_act == '<'
		:normal r>
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act == '<'
			:normal r>
			:normal h
		else
			:silent normal hh
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act == '<'
				:normal r>
				:normal l
			else
				:normal l
			endif
		endif
	elseif char_act == '>'
		:normal r<
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act == '>'
			:normal r<
			:normal h
		else
			:silent normal hh
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act == '>'
				:normal r<
				:normal l
			elseif char_act == '-'
				:normal xx
				:normal i.
			else
				:normal l
			endif
		endif
	elseif char_act == '.'
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act =~# '\w'
			:normal h
			:normal x
			:normal i->
			:normal h
		else
			:normal h
		endif
	elseif char_act == '='
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act == '='
			:normal h
			:normal r!
		else
			:silent normal hh
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act == '='
				:normal r!
				:normal l
			elseif char_act == '!'
				:normal r=
				:normal l
			elseif char_act == '+'
				:normal r-
				:normal l
			elseif char_act == '-'
				:normal r+
				:normal l
			elseif char_act == '*'
				:normal r/
				:normal l
			elseif char_act == '/'
				:normal r*
				:normal l
			elseif char_act == '>'
				:normal r<
				:normal l
			elseif char_act == '<'
				:normal r>
				:normal l
			else
				:normal l
			endif
		endif
	elseif char_act == '!'
		:silent normal l
		let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
		if char_act == '='
			:normal h
			:normal r=
		endif
	elseif char_act == "'"
		:normal r"
	elseif char_act == '"'
		:normal r'
	elseif char_act =~# '[EROSUC]'
		let word = expand("<cword>")
		if word == 'ERROR'
			:normal diw
			:normal iSUCCESS
		elseif word == 'SUCCESS'
			:normal diw
			:normal iERROR
		endif
	endif
endfunction
"""""""""""""""""""""""""""""""""""""ctrlD""""""""""""""""""""""""""""""""""""""
