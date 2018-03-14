.PHONY: all vim nvim tmux

all:
	make vim
	make nvim
	make tmux

vim:
	cp vimrc ~/.vimrc

nvim:
	cp init.vim ~/.config/nvim/init.vim

tmux:
	cp tmux.conf ~/.tmux.conf
