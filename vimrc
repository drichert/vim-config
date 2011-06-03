" Load pathogen
call pathogen#runtime_append_all_bundles()

" Filetype highlighting and config.
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

" Set pasttoggle so as not to screw up
" indents on text pasted from another app
set pastetoggle=<F2>

" show cursor position
set ruler

" display title
set title

" Start scrolling before reaching bottom
set scrolloff=3

" Toggle NERDTree
map <Leader>d :execute 'NERDTreeToggle ' .getcwd()<CR>

" Alignment shortcuts (via tabular.vim)
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Ack search
map <Leader>f :Ack<space>

" Remap code completion to Ctrl+Space and use j/k to scroll down/up.
inoremap <Nul> <C-x><C-o>
inoremap <expr> j    pumvisible() ? "\<C-n>" : "j"
inoremap <expr> k    pumvisible() ? "\<C-p>" : "k"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" solarzied color scheme
syntax on
set background=dark
colorscheme solarized
