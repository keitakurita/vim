GC = git clone --recursive
bundle_dir = $(shell pwd)/bundle
env: packages vimrc
test: packages

packages:
	mkdir -p bundle
	./download Vundle.vim VundleVim
	# Download external packages necessary to make everything work
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
	mkdir -p ~/bin
	curl https://beyondgrep.com/ack-v3.2.0 > ~/bin/ack && chmod 0755 ~/bin/ack
	echo "Run `cd ~/.vim/bundle/YouCompleteMe && python install.py --clang-completer to compile YouCompleteMe"

vimrc:
	./link.sh

reset:
	cd bundle; ls | grep -v Vundle.vim | xargs rm -rf

