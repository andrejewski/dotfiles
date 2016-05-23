
# Loads the dotfiles in their proper places.

# bash
cp ./.bashrc ~/.bashrc
cp ./.bash_profile ~/.bash_profile
source ~/.bashrc

# vim
cp ./.vimrc ~/.vimrc

mkdir -p ~/.vim/colors
cp ./.vim/colors/yule.vim ~/.vim/colors/yule.vim

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

brew install cmake
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
cd -

