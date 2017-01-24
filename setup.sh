#!/bin/bash

dotfiles=(zshrc bashrc vimrc tmux.conf)

for file in ${dotfiles[@]}
do
    #check existing file
    ln -sf $HOME/dotfiles/$file $HOME/.$file
done

