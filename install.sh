#!/bin/sh

set -e
set -x

BASENAME=$(dirname $0)
OS=$(uname)

install_vim() {
    if [ $OS="OpenBSD" ]; then
	sudo pkg_add vim vim-spell-de
    fi
}

install_vundle() {
    if [ ! -d $BASENAME/bundle/Vundle.vim ]; then
	echo "Installing Vundle and all Vundle plugins"
	git clone https://github.com/gmarik/Vundle.vim.git $BASENAME/bundle/Vundle.vim
	vim +PluginInstall +qall
    else
	echo "Updating Vundle and all Vundle plugins"
	vim +PluginUpdate +qall
    fi
}

compile_ycm() {
    # install pkg's for YouCompleteMe
    echo "Installing YouCompleteMe dependencies"
    if [ $OS="OpenBSD" ]; then
	sudo pkg_add llvm boost cmake
    elif [ $OS="Linux" ]; then
	sudo apt-get install build-essential cmake python-dev
    fi



    local YCMOPTIONS="--clang-completer --omnisharp-completer --gocode-completer"
    if [ $OS="OpenBSD" ]; then
	YCMOPTIONS="--system-boost --system-libclang $YCMOPTIONS"
    fi

    cd $BASENAME/bundle/YouCompleteMe
    ./install.sh $YCMOPTIONS
}


# create symblic link for .vimrc
ln -fs $BASENAME/vimrc $HOME/.vimrc

install_vim
install_vundle
compile_ycm
