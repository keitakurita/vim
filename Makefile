GC = git clone --recursive
bundle_dir = $(shell pwd)/bundle
env: packages vimrc
test: packages

packages:
	mkdir -p bundle
	./download Vundle.vim VundleVim

vimrc:
	./link.sh

reset:
	cd bundle; ls | grep -v Vundle.vim | xargs rm -rf

