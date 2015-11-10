set background=dark
colorscheme solarized
let g:solarized_termtrans=1
" Enable syntax highlighting
syntax on

set nocompatible
set backspace=indent,eol,start
set fileformats=unix,dos
set iskeyword+=_,$,@,%,#
" Disable error bells
set noerrorbells
set novisualbell
set incsearch
set laststatus=2
set hlsearch
set nostartofline
set number
set ruler
set scrolloff=10
set shortmess=atI
set showcmd
set showmatch
set sidescrolloff=10
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set ignorecase
set nowrap
set shiftround
set smartcase
set tabstop=2
" Enable mouse in all modes
set mouse=a
" Highlight current line
set cursorline
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Don’t add empty newlines at the end of files
set binary
set noeol
