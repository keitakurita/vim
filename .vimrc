set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-unimpaired'
Plugin 'Shougo/unite.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'ryanoasis/vim-devicons'
call vundle#end()            " required

filetype plugin indent on
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
set foldmethod=indent
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
noremap <space> za

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
nnoremap <leader>u :Unite 

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

" for plugins
" syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

