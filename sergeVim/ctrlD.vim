" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    ctrlD.vim                                          :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: tnicolas <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/12/09 20:13:15 by tnicolas          #+#    #+#              "
"    Updated: 2017/12/10 00:33:44 by tnicolas         ###   ########.fr        "
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
		if char_act =~# '\d'
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
		let i = 0
		while char_act =~# '\d'
			let i += 1
			:silent normal h
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if col('.') == 1
				break
			endif
		endwhile
		if char_act =~# '\s'
			:normal l
			:normal i-
		elseif char_act == '-'
			:normal x
			:normal h
			if col('.') == 1
				let i -= 1
			endif
		elseif col('.') == 1
			:normal h
			:normal i-
			:normal l
		endif
		while i > 0
			let i -= 1
			:normal l
		endwhile
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
			else
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
				else
					:normal l
					:normal r^
				endif
			endif
		endif
	elseif char_act == '^'
		:normal r|
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
		:normal r%
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
		echo "ok"
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
		else
			:normal h
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
	elseif char_act =~# '[unsigedtloghrca]'
		let word = expand("<cword>")
		if word == 'unsigned'
			:normal diwx
		elseif word == 'int' || word == 'char' || word == 'short' ||
					\word == 'long'
			:normal lb
			:normal b
			let char_act = matchstr(getline('.'), '\%' . col('.') . 'c.')
			if char_act =~# '\w'
				let word = expand("<cword>")
				if word == 'long'
					:normal b
					let word = expand("<cword>")
				endif
			endif
			if word == "unsigned"
				:normal diwx
			else
				:normal w
				exe ':normal iunsigned '
				:normal l
			endif
		endif
	endif
endfunction
"""""""""""""""""""""""""""""""""""""ctrlD""""""""""""""""""""""""""""""""""""""
