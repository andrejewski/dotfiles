
# Grab's the current dotfiles and puts them in this repo

# bash
cp ~/.bashrc ./.bashrc
cp ~/.bash_profile ./.bash_profile

# vim
cp ~/.vimrc ./.vimrc
mkdir -p ./.vim/colors
cp ~/.vim/colors/yule.vim ./.vim/colors/yule.vim
cp ~/.vim/colors/256-grayvim.vim ./.vim/colors/256-grayvim.vim

# git
cp ~/.gitconfig ./.gitconfig

