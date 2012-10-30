" No vi compat
set nocompatible

" Load pathogen
call pathogen#infect()

syntax on

filetype plugin indent on

" Auto-indent
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2

" 4 space indents for PHP
autocmd FileType php set shiftwidth=4 tabstop=4

" Add .god for syntax highlighting
autocmd BufNewFile,BufRead *.god set filetype=ruby

" Reindent triggering keys
set cinkeys=0{,0},0#

" set mapleader to , instead of \
let mapleader = ","

" Ctags
map <Leader>ct :!/usr/bin/ctags -R .<CR>

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <Leader>g :TlistToggle<CR>

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
set background=dark
set t_Co=16
colorscheme solarized

" Strip trailing whitespace
let g:StripperNoStripOnSave = 1
nmap <Leader>w :Stripper<CR>

" Tabz
nmap <Leader>t  :tabnew<CR>
nmap <Leader>tn :tabn<CR>
nmap <Leader>tp :tabp<CR>

" Toggle line numbers
nmap <Leader>n :set invnumber<CR>

" Toggle ZoomWin
nmap <Leader><Leader> :ZoomWin<CR>
