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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim' " zen mode
Plug 'junegunn/limelight.vim' " highlight paragraphs
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'

Plug 'itchyny/lightline.vim' " status bar
Plug 'chriskempson/base16-vim' " base16 themes
Plug 'daviesjamie/vim-base16-lightline' " base16 for statusbar
Plug 'junegunn/vim-emoji'

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
    set softtabstop=4
    set tabstop=4
    set lbr
    set tw=500
    set wrap
    set cindent cinkeys-=0#
    " status line
    set noshowmode
    " define control characters
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
    " display control characters
    " set list
    " code folding
    set foldmethod=indent
    set foldlevel=99
    nnoremap <Space><Space> za
    " undo, after quit even
    silent !mkdir -p $HOME/.vim/undo
    set undodir=$HOME/.vim/undo
    set undofile
    set undolevels=1000 undoreload=10000

" Color scheme
    set background=dark
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    endif

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
    iab <expr> dts strftime("%FT%T%z") " expand to ISO8601 datetime string

" Auto Commands
    autocmd BufWritePre * %s/\s\+$//e " remove trailing whitespace
    autocmd BufWritePre ~/.zshrc "source ~/.zshrc"

" Plugins
    " FZF
    " Control-F (normal mode): searhc for a file
    map <C-f> <Esc><Esc>:Files!<CR>
    " Control-F (insert mode): search inside open file
    inoremap <C-f> <Esc><Esc>:BLines!<CR>
    " Control-G: show commits
    map <C-g> <Esc><Esc>:BCommits!<CR>
    " Alt-F: to search within files
    execute "set <M-f>=\ef"
    nnoremap <M-f> <Esc><Esc>:Ag<CR>
    " Override Files command to use bat preview
    command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    " Git Gutter
    let g:gitgutter_max_signs = 500  " default value
    " let g:gitgutter_sign_added = emoji#for('gem')
    " let g:gitgutter_sign_modified = emoji#for('large_blue_diamond')
    " let g:gitgutter_sign_removed = emoji#for('small_red_triangle_down')
    " let g:gitgutter_sign_modified_removed = emoji#for('large_orange_diamond')

    " Lightline
    let g:lightline = {
      \ 'colorscheme': 'base16',
      \ }

    " vim-commentary
    map <C-_> gcc " toggle commen, this is C-/ on linux

    " vimwiki
    let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}] " use markdown and md extension
    let g:vimwiki_global_ext = 0 " use vimwiki only for vimwiki markdown files
    let g:vimwiki_markdown_link_ext = 1 " add markdown extension to generated links

function! s:writing_mode()
    setlocal formatoptions=1
    setlocal noexpandtab
    setlocal spell spelllang=en_us,de
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
