#!/bin/sh

# Keep it simple so it's easy to comment out parts.
sudo apt-get -y install git
sudo apt-get -y install meld
sudo apt-get -y install gitg
sudo apt-get -y install ipython
sudo apt-get -y install chromium-browser
sudo apt-get -y install kodos
sudo apt-get -y install tmux
sudo apt-get -y install vim
sudo apt-get -y install ubuntu-restricted-addons
sudo apt-get -y install ubuntu-restricted-extras
sudo apt-get -y install coffeescript
sudo apt-get -y install python-django
sudo apt-get -y install sqlite3
sudo apt-get -y install python-pudb
sudo apt-get -y install openssh-server
sudo apt-get -y install samba

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
git config --global diff.external meld
git config --global diff.external ~/Source/vimrc/meld_diff.py
git config --global core.editor "vim"
