" vim-plug {{{
call plug#begin()

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'noahfrederick/vim-hemisu'
Plug 'djjcast/mirodark'

" Clojure Environment
Plug 'guns/vim-clojure-static'  " Language Support
Plug 'guns/vim-sexp'            " Precision Editing for S-expressions
Plug 'tpope/vim-fireplace'      " REPL integration

" Longform Writing & Literate Programming
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vimwiki/vimwiki'
Plug 'zyedidia/literate.vim'
call plug#end()
" }}} vim-plug

" colors and cursors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set background=dark
syntax on 
colorscheme hemisu 

" Spaces & Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=4
set expandtab
set autoindent
set copyindent

" Clipboard
set clipboard+=unnamedplus

" UI Config {{{
set hidden
set number
set showcmd
set cursorline
set wildmenu
set showmatch
set laststatus=2
set nobackup
set noswapfile
" }}} UI Config

" Search {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
" }}} Search

" Leader & Mappings
let mapleader=" " "leader is space
" edit/reload vimrc
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" better ESC
inoremap fd <esc>

" fast save and close
nmap <leader>fs :w<CR>
nmap <leader>x  :x<CR>
nmap <leader>q  :q<CR>
