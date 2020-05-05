"             _
"      _   __(_)___ ___  __________
"     | | / / / __ `__ \/ ___/ ___/
"    _| |/ / / / / / / / /  / /__
"   (_)___/_/_/ /_/ /_/_/   \___/
"

" This .vimrc uses Vim Plug. Install new plugins by :PlugInstall

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'mboughaba/i3config.vim'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-sensible'

call plug#end()

" Basic configuration
    let mapleader =" "
	set ffs=unix,dos,mac
	set number relativenumber
	set wildmode=longest,list,full
	set splitbelow splitright
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
	set shiftwidth=4
	set tabstop=4
	set lbr
	set tw=500
	set si
	set wrap
    " status line
    set noshowmode

" Color scheme
	try
		colorscheme seoul256
	catch
	endtry
    "" seoul256 (dark):
    "   Range:   233 (darkest) ~ 239 (lightest)
    "   Default: 237
    let g:seoul256_background = 235
    let g:seoul256_srgb = 1
    set background=dark

" Disable autocommenting on newline
	autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Shortcuts
	map <leader>f :Goyo \| set linebreak<CR>
	" navigation in split view
	map <leader>s :w!<CR>

    " move lines in normal, insert and visual mode
    nnoremap <C-j> :m .+1<CR>==
    nnoremap <C-k> :m .-2<CR>==
    inoremap <C-j> <Esc>:m .+1<CR>==gi
    inoremap <C-k> <Esc>:m .-2<CR>==gi
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv

" Auto Commands
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre ~/.zshrc "source ~/.zshrc"

" Plugins
    " Git Gutter
    let g:gitgutter_max_signs = 500  " default value

    " Lightline
    let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

function! s:writing_mode()
    setlocal formatoptions=1
    setlocal noexpandtab
    setlocal spell spelllang=en_us
    setlocal spell spellfile=$HOME/.vim/spellfile.utf-8.add
    set formatprg=par
    setlocal textwidth=100
    setlocal wrap
    setlocal linebreak
    map j gj
    map k gk
endfunction

function! s:goyo_enter()
    " quit with Goyo active
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

    " activate Limelight
    Limelight

    " display mode
    set showmode

    call s:writing_mode()
endfunction

function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
      if b:quitting_bang
        qa!
      else
        qa
      endif
    endif

    " Deactivate Limelight
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
