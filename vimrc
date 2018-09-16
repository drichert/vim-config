" No vi compat
set nocompatible

" Load pathogen
call pathogen#infect()

syntax enable

filetype plugin indent on

" Auto-indent
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2

" set mapleader to , instead of \
let mapleader = ","

" Folding
set foldmethod=indent
autocmd Syntax * normal zR

" Turn off PEP-8
let g:python_recommended_style = 0
let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'
"autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2

" Add .god for syntax highlighting
autocmd BufNewFile,BufRead *.god set filetype=ruby

" Window movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Window movement (insert mode)
inoremap <c-h> <esc><c-w>hi
inoremap <c-j> <esc><c-w>ji
inoremap <c-k> <esc><c-w>ki
inoremap <c-l> <esc><c-w>li

" Line movement
nnoremap J j10
nnoremap K k10

" Ctags
"map <Leader>ct :!/usr/bin/ctags -R .<CR>
"
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_WinWidth = 50
"map <Leader>g :TlistToggle<CR>

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
" inoremap <Nul> <C-x><C-o>
" inoremap <expr> j    pumvisible() ? "\<C-n>" : "j"
" inoremap <expr> k    pumvisible() ? "\<C-p>" : "k"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" solarzied color scheme
set background=dark
set t_Co=16
colorscheme solarized

" Strip trailing whitespace
let g:StripperNoStripOnSave = 1
nmap <Leader>w :Stripper<CR>

nmap <Leader>u :%s/[“”]/"/g<CR>

" Tabz
nmap <Leader>t  :tabnew<CR>
nmap <Leader>tn :tabn<CR>
nmap <Leader>tp :tabp<CR>

" Toggle line numbers
nmap <Leader>n :set invnumber<CR>

" Toggle ZoomWin
nmap <Leader><Leader> :ZoomWin<CR>

" Run specs with Rake
nnoremap <leader>rs :!rake spec<cr>

" Run `cake build`
nnoremap <leader>cb :!cake build<cr>

" Hexdump
nnoremap <leader>x :%!xxd<cr>

" Togle tab expansion
nmap <Leader>h :call ExpandTabToggle()<cr>
function! ExpandTabToggle()
  if &expandtab
    setlocal noexpandtab
  else
    setlocal expandtab
  endif
  echom &expandtab
endfunction

" Disable tab expansion for HLM projects
autocmd BufNewFile,BufRead ~/work/hlm/* set noexpandtab
