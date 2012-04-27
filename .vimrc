set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/clang_complete'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/TwitVim'

filetype plugin indent on
filetype on

set encoding=utf8
set fileencodings=iso-2022-jp,sjis,euc-jp
syntax on
set t_Co=256
colorscheme wombat
set nu
set laststatus=2
set statusline=%F%m%r%h%w\=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set tabstop=4
set wrapscan
set autoindent

if has('gui_macvim')
	set showtabline=2
	set guioptions-=e
	set imdisable
	set transparency=10
	set antialias
	colorscheme morning
endif

