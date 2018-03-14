.PHONY: all vim nvim tmux zsh

all:
	make vim
	make nvim
	make tmux
	make zsh

vim:
	cp vimrc ~/.vimrc

nvim:
	cp init.vim ~/.config/nvim/init.vim

tmux:
	cp tmux.conf ~/.tmux.conf
	echo "make sure that you configured the powerline correctly"

zsh:
	cp zshrc ~/.zshrc
	echo "make sure that you configured the powerline correctly"
