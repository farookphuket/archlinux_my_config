#!/bin/bash 


pacman -Syu --noconfirm

pacman -S gvim neovim ranger powerline tmux vim-clap nodejs  --noconfirm
pacman -S python-pynvim  vim-ultisnips npm --noconfirm


npm install -g prettier
