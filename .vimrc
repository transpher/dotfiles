set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-clang_complete'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/TwitVim'
NeoBundle 'lambdalisue/platex.vim'
"NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'vim-scripts/CSApprox'
"NeoBundle 'Lokaltog/vim-powerline'

filetype plugin indent on
filetype on

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"set encoding=utf8
"set fileencodings=iso-2022-jp,sjis,euc-jp
syntax on
set t_Co=256
"set background=dark
colorscheme less
set backspace=indent,eol,start
set nu
set wildmenu
set laststatus=2
set statusline=%<%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[ROW=%l/%L]
set textwidth=0
set cursorline cursorcolumn
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter,BufRead * set cursorline cursorcolumn
augroup END
highlight CursorColumn term=reverse cterm=none ctermbg=darkblue
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wrapscan
set autoindent smartindent
set whichwrap=b,s,<,>,[,]
set nobackup
set noswapfile
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

let g:sonictemplate_vim_template_dir='~/.vim/after/template'
let g:platex_suite_main_file="%:r"
let g:platex_suite_pdf_viewer="open"

"if has('gui_macvim')
"	set showtabline=2
"	set guioptions-=e
"	set imdisable
"	set transparency=10
"	set antialias
"	colorscheme morning
"endif

let twitvim_enable_perl=1
let twitvim_api_root="https://api.twitter.com/1"
let twitvim_count=30

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_snippets_dir = '~/.vim/after/snippets'
let g:acp_enableAtStartup=0
