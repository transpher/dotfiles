set encoding=utf8
set fileencodings=iso-2022-jp,sjis,euc-jp
syntax on
set t_Co=256
colorscheme wombat
set nu
set laststatus=2
set statusline=%F%m%r%h%w\=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set tabstop=4

if has('gui_macvim')
	set showtabline=2
	set imdisable
	set transparency=10
	set antialias
	colorscheme morning
endif

