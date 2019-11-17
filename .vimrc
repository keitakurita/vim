"cheat sheet
" fzf: search through files fuzzily
" ack: search for strings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=/usr/local/opt/fzf " uncomment for Mac
set rtp+=~/.fzf " uncomment for linux
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" YouCompleteMe is better but it causes lots of problems
" Leaving this install decision to future self according to environment
" Plugin 'davidhalter/jedi-vim'
" Plugin 'Valloric/YouCompleteMe'
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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nelstrom/vim-markdown-folding' 
Plugin 'scrooloose/nerdcommenter'
Plugin 'hashivim/vim-terraform'
Plugin 'keith/swift.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
call vundle#end()            " required

filetype plugin indent on
set encoding=utf-8
syntax on

set ai "Auto indent
set autoindent
set backspace=eol,start,indent
set clipboard=unnamed
set expandtab
set foldcolumn=1
set foldmethod=indent
set gdefault
set hlsearch
set ignorecase
set incsearch
set linebreak
set list
set magic
set nolist
set nobackup
set nowb
set noswapfile
set number
set ruler
set shiftwidth=4
set showcmd
set showmatch
set si "Smart indent
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set whichwrap+=<,>,h,l
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore=*.o,*~,*.pyc
set wildmenu
set wrap

" choose color scheme according to feeling
color molokai
let g:molokai_original = 1
" color solarized
let mapleader = ","
set guifont=DejaVuSansMono\ Nerd\ Font:h13

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
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l
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
nnoremap <C-u> :Unite file<cr>
noremap <C-p> :Files<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>ss :setlocal spell!<cr>
map <leader>pp :setlocal paste!<cr>

au FocusLost * :wa

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
autocmd FileType cc setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2

" searching
let g:ackprg = 'ag --nogroup --nocolor --column'

" custom status line
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" syntax checking
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_python_pyflakes_exe = 'python -m pyflakes'
let g:syntastic_python_flake8_args='--ignore=E502,E302,W0401'
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" custom functionality
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" for plugins
" syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" vim fugitive
set diffopt+=vertical

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:pymode_python = 'python3'

" ctags
set autochdir
set tags=./tags;,tags
