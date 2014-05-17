#!/bin/sh

# Keep a clean system.
sudo apt-get -y update
sudo apt-get -y upgrade

# Keep it single line so it's easy to comment out things.
sudo apt-get -y install \
  git \
  ipython \
  openssh-server \
  python-pudb \
  sqlite3 \
  tmux \
  vim

mkdir -p ~/Source/github
cd Source/github
git clone git://github.com/dashawn888/vimrc.git

rm -i ~/.bashrc
ln -s ~/Source/vimrc/bashrc ~/.bashrc
ln -s ~/Source/vimrc/vim ~/.vim
ln -s ~/Source/vimrc/vimrc ~/.vimrc
ln -s ~/Source/vimrc/tmux.conf ~/.tmux.conf
