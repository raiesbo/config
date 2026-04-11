install_vim:
	cp -i -v .vimrc ~/
install_nvim:
	cp -i -v -r nvim ~/.config/
pull_nvim:
	cp -r ~/.config/nvim .
install: install_vim install_nvim

