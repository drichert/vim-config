" Load pathogen
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

" Auto-indent
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" set cinkeys=0{,0},:,0#
set cinkeys=0{,0},0#
" set mapleader to , instead of \
let mapleader = "," 

" swap ` and '; makes ' jump to line *and* column
nnoremap ' `
nnoremap ` '

set history=2000

" Active NERDTree @ startup dr04212010
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Set pasttoggle so as not to screw up
" indents on text pasted from another app
set pastetoggle=<F2>

" Filetype highlighting and config.
syntax on
filetype on
filetype plugin on
filetype indent on

" shwo cursor position
set ruler

" display title
set title

" Start scrolling before reaching bottom
set scrolloff=3

" Toggle NERDTree with ,d
map ,d :execute 'NERDTreeToggle ' .getcwd()<CR>

" solarzied color scheme
syntax enable
set background=dark
colorscheme solarized
