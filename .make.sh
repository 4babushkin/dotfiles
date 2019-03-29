#!/bin/bash
# .make.sh 
# This script creates symlinks from ~/ to dotfiles dir

echo "Установка vim..."
apt-get --assume-yes install vim exuberant-ctags zsh git

# Установка oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


echo "Установка Vundle for vim..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

dir=~/dotfiles
olddir=~/dotfiles_old
files=".bashrc .vimrc .zshrc .gitconfig"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...complete."

echo "Changing to the $dir directory"
cd $dir
echo "...complete."

for file in $files; do
    echo "Moving existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
