#!/bin/sh

cd $HOME
wget https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
mv dircolors.ansi-dark .dircolors
eval `dircolors ~/.dircolors`

git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git \
    $HOME/.gnome-terminal-colors-solarized.git
cd $HOME/.gnome-terminal-colors-solarized
./set_dark.sh


