vim:
	cp -i -v .vimrc ~/
nvim:
	cp i -v nvim ~/.config/nvim
pull_nvim:
	cp -r ~/.config/nvim .
install: vim nvim

