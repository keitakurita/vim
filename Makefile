GC = git clone --recursive
bundle_dir = $(shell pwd)/bundle
env:
	$(GC) https://github.com/scrooloose/nerdtree.git $(bundle_dir)/nerdtree
	$(GC) https://github.com/scrooloose/nerdcommenter.git $(bundle_dir)/nerdcommenter
	$(GC) https://github.com/tpope/vim-surround.git $(bundle_dir)/vim-surround
	$(GC) https://github.com/tpope/vim-repeat.git $(bundle_dir)/vim-repeat
	$(GC) --recursive https://github.com/python-mode/python-mode.git $(bundle_dir)/python-mode
	$(GC) --recursive https://github.com/davidhalter/jedi-vim.git $(bundle_dir)/jedi-vim
	./link.sh

