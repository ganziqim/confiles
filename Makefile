.PHONY: all vim tmux

all:
	make vim
	make tmux

vim:
	cp vimrc ../.vimrc

tmux:
	cp tmux.conf ../.tmux.conf
