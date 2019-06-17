all: vim nvim tmux zsh git editorconfig czrc

update: vim-update nvim-update tmux-update zsh-update git-update editorconfig-update czrc-update

vim:
    @cp ./vimrc ~/.vimrc

vim-update:
    @cp ~/.vimrc ./vimrc

nvim:
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
