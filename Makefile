GC = git clone --recursive
bundle_dir = $(shell pwd)/bundle
env: vimrc
test: packages

packages:
	mkdir -p bundle
	./download Vundle.vim Vundle

vimrc:
	./link.sh

reset:
	cd bundle
	ls | grep -v Vundle.vim | xargs rm -rf

