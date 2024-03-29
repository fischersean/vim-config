" Stuff from learn x in y minutes
" Required for vim to be iMproved
set nocompatible

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Determines filetype from name to allow intelligent auto-indenting, etc.
filetype indent plugin on

" Enable syntax highlighting
"syntax on

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

" Number of visual spaces per TAB
set tabstop=4

" Number of spaces in TAB when editing
set softtabstop=4

" Number of spaces indented when reindent operations (>> and <<) are used
set shiftwidth=4

" Stop showing scrollbars
set guioptions-=L
set guioptions-=r

" Convert TABs to spaces
set expandtab

" Enable intelligent tabbing and spacing for indentation and alignment
set smarttab

" Highlight entire line
set cursorline

"Plugin manager
call plug#begin('~/.vim/plugged')

" Nerd tree plugins
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Searching and misc.
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

" Code compatability
Plug 'sheerun/vim-polyglot'

" Themse
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" Plugins for airline bar
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

" Supertab
Plug 'ervandew/supertab'

" Auto complete the obvious stuff
Plug 'tpope/vim-surround'

Plug 'tpope/vim-ragtag'

"better sessions
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" Linters
Plug 'dense-analysis/ale'

" Python code folding
Plug 'tmhedberg/SimpylFold'

call plug#end()

" Fix pwd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" folding
set foldmethod=syntax

" Control p configuration
let g:ctrlp_working_path_mode = 'ra'
"ctrlp_working_path_mode = 1
"
" VIM configuration
set relativenumber
set encoding=UTF-8

" Plugin Configuration
" Begin my changes
syntax on

"set termguicolors
syntax enable
set background=dark
colorscheme gruvbox
"colorscheme onedark

set guifont=HackNerdFontComplete-Regular:h13

" Nerd Tree configuration
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeVCS | endif

"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTreeVCS' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>
"map <C-n> :Lexplore<CR>

"let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
map <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden = 0
let NERDTreeShowLineNumbers = 1
let NERDTReeShowBookmarks = 1

"Get rid of annoying autosave messages
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Ragtag for vue
autocmd FileType vue call g:RagtagInit()
autocmd FileType md call g:RagtagInit()

"JS formating
autocmd FileType javascript setlocal shiftwidth=2 tabstop=4 softtabstop=2 expandtab
autocmd FileType vue setlocal shiftwidth=2 tabstop=4 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=4 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=4 softtabstop=2 expandtab
autocmd FileType toml setlocal shiftwidth=2 tabstop=4 softtabstop=2 expandtab

" ALE
let g:ale_lint_on_save = 0

let g:ale_fixers = {
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'vue': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'go': ['gofmt'],
\   'c': ['clang-format'],
\   'swift': ['swifformat'],
\   'json': ['jq'],
\   'dart': ['dartfmt'],
\}

let g:ale_linters = {
\   'vue': ['eslint'],
\   'javascript': ['eslint'],
\   'go': ['gopls'],
\   'python': ['pyls'],
\   'c': ['clang'],
\   'swift': ['sourcekitlsp'],
\   'yaml': ['yamllint'],
\   'dart': ['analysis_server'],
\}

let g:vue_pre_processors = []

let g:ale_python_black_options = '--line-length 79'
let g:ale_go_gofmt_options = '-s'

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 0

noremap <leader>d :ALEGoToDefinition<CR>
noremap <leader>r :ALERename<CR>
nnoremap <F6> :ALEFix<CR>
nnoremap <F5> :ALELint<CR>

noremap ; :

autocmd FileType go exe "normal zR"
autocmd FileType python exe "normal zR"

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Autoclose
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Better escap sequence
inoremap jk <Esc>
inoremap kj <Esc>
