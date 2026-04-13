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
install_tmux:
	cp -v -i .tmux.conf ~/
	cp -r .tmux ~/
pull_tmux:
	cp -v ~/.tmux.conf .
	cp -r ~/.tmux .
install: install_vim install_nvim install_tmux

