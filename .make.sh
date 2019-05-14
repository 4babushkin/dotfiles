#!/bin/bash
# .make.sh 
# This script creates symlinks from ~/ to dotfiles dir

echo "Установка vim..."
apt-get --assume-yes install vim exuberant-ctags zsh git

# Установка oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# тема
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

#плагин 256
sh -c "$(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/chrissicool/zsh-256color)"

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


echo -n "Install Docker and docker components? (y/n) "

read item
case "$item" in
    y|Y) echo "Ввели «y», продолжаем..."

    ### установка docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh

    ### docker machine install 
    base=https://github.com/docker/machine/releases/download/v0.16.0 &&
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
    sudo install /tmp/docker-machine /usr/local/bin/docker-machine

    ### установка docker-compose
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        ;;
    n|N) echo "Ввели «n», завершаем..."
        exit 0
        ;;
    *) echo "Ничего не ввели. Выполняем действие по умолчанию..."
        ;;
esac


