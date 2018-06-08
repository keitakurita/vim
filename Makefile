GC = git clone --recursive
bundle_dir = $(shell pwd)/bundle
env: vimrc
test: packages

packages:
	./download Vundle.vim Vundle

vimrc:
	./link.sh

