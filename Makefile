.PHONY: all vim vim-update nvim nvim-update tmux tmux-update zsh zsh-update git git-update editorconfig editorconfig-update czrc czrc-update coc coc-update global global-update hyper hyper-update ideavim ideavim-update

all: vim nvim tmux zsh git editorconfig czrc coc global hyper ideavim

update: vim-update nvim-update tmux-update zsh-update git-update editorconfig-update czrc-update coc-update global-update hyper-update ideavim-update

vim:
	@cp ./vimrc ~/.vimrc

vim-update:
	@cp ~/.vimrc ./vimrc

nvim: vim
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

coc:
	@cp ./coc-settings.json ~/.config/nvim/coc-settings.json

coc-update:
	@cp ~/.config/nvim/coc-settings.json ./coc-settings.json

global:
	@cp ./globalrc ~/.globalrc

global-update:
	@cp ~/.globalrc ./globalrc

hyper:
	@cp ./hyper.js ~/.hyper.js

hyper-update:
	@cp ~/.hyper.js ./hyper.js

ideavim:
	@cp ./ideavimrc ~/.ideavimrc

ideavim-update:
	@cp ~/.ideavimrc ./ideavimrc
