GC = git clone --recursive
bundle_dir = $(shell pwd)/bundle
env: packages vimrc
test: packages

packages:
	./download nerdtree scrooloose
	./download nerdcommenter scrooloose
	./download vim-surround tpope
	./download vim-repeat tpope
	./download python-mode python-mode
	./download jedi-vim davidhalter
	./download ack.vim mileszs
	./download supertab ervandew
	./download command-t wincent
	./download vim-airline vim-airline
	./download vim-airline-themes vim-airline
	./download vim-unimpaired tpope

vimrc:
	./link.sh

