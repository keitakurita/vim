filetype plugin indent on
execute pathogen#infect()
execute pathogen#helptags()
set encoding=utf-8
syntax on

set wrap
set linebreak
set nolist

set hlsearch
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed

color molokai
let g:molokai_original = 1
let mapleader = ","

inoremap jj <ESC>
noremap / /\v
vnoremap / /\v
noremap <leader><space> :noh<cr>
noremap <tab> %
vnoremap <tab> %
noremap <leader>w <C-w><C-w>l
noremap \ ,

" for practicing moving
nnoremap <up> <C-u>
nnoremap <down> <C-d>
nnoremap <left> <C-o>
nnoremap <right> <C-i>
inoremap <up> <C-u>
inoremap <down> <C-d>
nnoremap j gj
nnoremap k gk

" leader commands
noremap <leader>a :Ack 
noremap <leader>T :tabe 
map <C-n> :NERDTreeToggle<cr>
noremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au FocusLost * :wa

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
autocmd FileType cc setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2

" custom status line
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" syntax checking
let g:syntastic_python_checkers=['flake8']
left g:syntastic_python_flake8_args='--ignore=E502'

" custom functionality
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

