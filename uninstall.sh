#!/bin/bash
rm -f ~/.vimrc
rm -rf ~/.vim
if [ -e "~/.vimrc_old" ]; then
    mv -f ~/.vimrc_old ~/.vimrc
fi
if [ -e "~/.vim_old.tar.gz" ]; then
    tar -zxPf ~/.vim_old.tar.gz ~/.vim
fi
