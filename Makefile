env:
	git clone https://github.com/scrooloose/nerdtree.git $(shell pwd)/bundle/nerdtree
	git clone https://github.com/scrooloose/nerdcommenter.git $(shell pwd)/bundle/nerdcommenter
	git clone https://github.com/tpope/vim-surround.git $(shell pwd)/bundle/vim-surround
	git clone https://github.com/tpope/vim-repeat.git $(shell pwd)/bundle/vim-repeat
	git clone --recursive https://github.com/python-mode/python-mode.git $(shell pwd)/bundle/python-mode
	./link.sh

