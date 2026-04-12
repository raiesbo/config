install_vim:
	cp -i -v .vimrc ~/
	cp -i -v -r .vim ~/
pull_vim:
	cp -v ~/.vimrc_org .
	cp -v ~/.vimrc .
	cp -v -r ~/.vim .
install_nvim:
	cp -i -v -r nvim ~/.config/
pull_nvim:
	cp -r ~/.config/nvim .
install: install_vim install_nvim

