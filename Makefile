.PHONY: all vim nvim tmux zsh git

all:
	make vim
	make nvim
	make tmux
	make zsh
	make git

vim:
	@cp vimrc ~/.vimrc

nvim:
	make vim
	@cp init.vim ~/.config/nvim/init.vim

tmux:
	@cp tmux.conf ~/.tmux.conf
	@echo "make sure that you configured the powerline correctly"

zsh:
	@cp zshrc ~/.zshrc
	@echo "make sure that you configured the powerline correctly"

git:
	@cp gitconfig ~/.gitconfig
