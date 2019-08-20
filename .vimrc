"             _                    
"      _   __(_)___ ___  __________
"     | | / / / __ `__ \/ ___/ ___/
"    _| |/ / / / / / / / /  / /__  
"   (_)___/_/_/ /_/ /_/_/   \___/  
"                               

let mapleader =" "

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'mboughaba/i3config.vim'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()


" Basic configuration
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set ffs=unix,dos,mac
	set number relativenumber
	set wildmode=longest,list,full
	set splitbelow splitright
	set autoread
    set updatetime=100
	" search
	set hlsearch
	set showmatch
    " bells and whistles
	set noerrorbells
	set novisualbell
	set nobackup
	set nowb
	set noswapfile
	" tabs / indent
	set expandtab
	set smarttab
	set shiftwidth=4
	set tabstop=4
	set lbr
	set tw=500
	set ai
	set si
	set wrap
    " status line
	set laststatus=2
    set noshowmode

" Color scheme
	try
		colorscheme ron 
	catch
	endtry
	set background=dark

" Disable autocommenting on newline
	autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Shortcuts
	map <leader>f :Goyo \| set linebreak<CR>
	" navigation in split view
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	map <leader>s :w!<CR>

" Plugins
    " Git Gutter
    let g:gitgutter_max_signs = 500  " default value
