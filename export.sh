
# Computer => Dotfiles

# bash
cp ~/.bashrc ./.bashrc
cp ~/.bash_profile ./.bash_profile

# vim
cp ~/.vimrc ./.vimrc
mkdir -p ./.vim/colors
cp ~/.vim/colors/yule.vim ./.vim/colors/yule.vim
cp ~/.vim/colors/256-grayvim.vim ./.vim/colors/256-grayvim.vim

# atom
mkdir -p ./.atom
cp ~/.atom/keymap.cson ./.atom/
apm list --installed --bare > ./.atom/packages.txt

# git
cp ~/.gitconfig ./.gitconfig
