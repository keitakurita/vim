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
noremap ; :
vnoremap ; :

" for practicing moving
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
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
autocmd BufEnter * lcd %:p:h

