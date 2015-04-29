#!/bin/sh

BASENAME=$(dirname $0)



# create symblic link for .vimrc
ln -fs $BASENAME/vimrc $HOME/.vimrc

# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git $BASENAME/bundle/Vundle.vim

# install Vundle plugins
vim +PluginInstall +qall

# install pkg's for YouCompleteMe
# FIXME: support at least OpenBSD & Linux (apt-get)
sudo apt-get install build-essential cmake python-dev

# compile YouCompleteMe
cd $BASENAME/bundle/YouCompleteMe
./install.sh --clang-completer --omnisharp-completer
