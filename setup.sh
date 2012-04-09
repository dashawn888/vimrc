#!/bin/sh

# Keep a clean system.
sudo apt-get -y update
sudo apt-get -y upgrade

# Keep it single line so it's easy to comment out things.
sudo apt-get -y install \
  bless \
  chromium-browser \
  coffeescript \
  git \
  gitg \
  ipython \
  kodos \
  meld \
  openssh-server \
  python-django \
  python-pudb \
  sqlite3 \
  tmux \
  ubuntu-restricted-addons \
  ubuntu-restricted-extras \
  vim \
  wmii

mkdir ~/Source
cd Source
git clone git://github.com/dashawn888/vimrc.git

# For solarized gnome theme.
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized
cd gnome-terminal-colors-solarized
sh set_dark.sh

rm -i ~/.bashrc
ln -s ~/Source/vimrc/bashrc ~/.bashrc
ln -s ~/Source/vimrc/vim ~/.vim
ln -s ~/Source/vimrc/vimrc ~/.vimrc
ln -s ~/Source/vimrc/tmux.conf ~/.tmux.conf

echo -n "Enter your first and last name: "
read name

echo -n "Enter your email: "
read email

git config --global user.name "${name}"
git config --global user.email "${email}"
git config --global diff.external ~/Source/vimrc/meld_diff.py
git config --global core.editor "vim"
