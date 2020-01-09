
" Stuff from learn x in y minutes
" Required for vim to be iMproved
set nocompatible

" Determines filetype from name to allow intelligent auto-indenting, etc.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmode=longest,list,full
set wildmenu

" Use case insensitive search except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no file-specific indenting is enabled,
" keep same indent as the line you're currently on
set autoindent

" Display line numbers on the left
set number

" Indentation options, change according to personal preference

" Number of visual spaces per TAB
set tabstop=4

" Number of spaces in TAB when editing
set softtabstop=4

" Number of spaces indented when reindent operations (>> and <<) are used
set shiftwidth=4

" Convert TABs to spaces
set expandtab

" Enable intelligent tabbing and spacing for indentation and alignment
set smarttab


"Plugin manager
call plug#begin('~/.vim/plugged')

" Nerd tree plugins
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" Python plugins
Plug 'davidhalter/jedi-vim' 
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'psf/black'

" Searching and misc.
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

" Code compatability
Plug 'sheerun/vim-polyglot'

" Themse
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'

" Start menu
Plug 'mhinz/vim-startify'

" Plugins for airline bar
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Supertab
Plug 'ervandew/supertab'

" Auto complete the obvious stuff
Plug 'vim-scripts/AutoClose'

call plug#end()

" Control p configuration
let g:ctrlp_working_path_mode = 'ra'
"ctrlp_working_path_mode = 1
" VIM configuration
set relativenumber
set encoding=UTF-8

let g:startify_bookmarks = ["~/Documents/local-repo", "~/Documents/local-repo/jabberwocky"]
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   wincmd w
            \ | endif

" Plugin Configuration
" Begin my changes
syntax on
let g:airline_theme='one'
set termguicolors
colorscheme onedark
set background=dark

autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>
let g:black_linelength=79

set guifont=HackNerdFontComplete-Regular:h13

" Nerd Tree configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeVCS | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTreeVCS' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
" End my changes
" Pyhon specific coniguration
"
"g:pymode_folding = 1
