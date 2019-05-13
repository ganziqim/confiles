.PHONY: all vim vim-update nvim nvim-update tmux tmux-update zsh zsh-update git git-update

all:
	make vim
	make nvim
	make tmux
	make zsh
	make git
	make editorconfig
	make czrc

update:
	make vim-update
	make nvim-update
	make tmux-update
	make zsh-update
	make git-update
	make editorconfig-update
	make czrc-update

vim:
	@cp ./vimrc ~/.vimrc

vim-update:
	@cp ~/.vimrc ./vimrc

nvim:
	make vim
	@cp ./init.vim ~/.config/nvim/init.vim

nvim-update:
	@cp ~/.config/nvim/init.vim ./init.vim

tmux:
	@cp ./tmux.conf ~/.tmux.conf

tmux-update:
	@cp ~/.tmux.conf ./tmux.conf

zsh:
	@cp ./zshrc ~/.zshrc

zsh-update:
	@cp ~/.zshrc ./zshrc

git:
	@cp ./gitconfig ~/.gitconfig

git-update:
	@cp ~/.gitconfig ./gitconfig

editorconfig:
	@cp ./editorconfig ~/.editorconfig

editorconfig-update:
	@cp ~/.editorconfig ./editorconfig

czrc:
	@cp ./czrc ~/.czrc

czrc-update:
	@cp ~/.czrc ./czrc
