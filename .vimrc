execute pathogen#infect()
set nocompatible
set hidden
filetype plugin on

colorscheme pencil
set background=light
set number
syntax on

" Ignorecase when searching with /, keep case when searching with *
set ignorecase
set smartcase

"Enable Word Processing Mode
func! WordProcessorMode()
	setlocal formatoptions=1
	setlocal noexpandtab
	map j gj
	map k gk
	setlocal spell spelllang=en_us
	set thesaurus+=/Users/elais/.vim/thesaurus/mthesaur.txt
	set complete+=s
	set formatprg=par
	setlocal wrap
	setlocal linebreak
	set guifont=Cousine:h16
endfu
com! WP call WordProcessorMode()

" Goyo settings

