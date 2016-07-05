
# Dotfiles => Computer

# bash
cp ./.bashrc ~/.bashrc
cp ./.bash_profile ~/.bash_profile
source ~/.bashrc

# vim
cp ./.vimrc ~/.vimrc

# atom
mkdir -p ~/.atom
cp -R ./.atom ~/.atom
apm install --packages-file ./.atom/packages.txt

mkdir -p ~/.vim/colors
cp ./.vim/colors/yule.vim ~/.vim/colors/yule.vim
cp ./.vim/colors/256-grayvim.vim ~/.vim/colors/256-grayvim.vim

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
cd -

# git
cp ./.gitconfig ~/.gitconfig
