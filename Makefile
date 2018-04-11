.PHONY: all vim vim-update nvim nvim-update tmux tmux-update zsh zsh-update git git-update

all:
	make vim
	make vim-update
	make nvim
	make nvim-update
	make tmux
	make tmux-update
	make zsh
	make zsh-update
	make git
	make git-update

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
