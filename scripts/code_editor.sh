#!/bin/bash 


ex_cps=/usr/share/zsh/site-functions/_composer
if [ -f "$ex_cps" ] ; then 
    sudo rm -rf $ex_cps
fi

ex_alc=/usr/share/zsh/site-functions/_alacritty 
if [ -f "$ex_alc" ] ; then 
    sudo rm -rf $ex_alc
fi 

# gvim will be conflick with vim so you have to remove vim 

sudo pacman -S --needed gvim 

sudo pacman -S --needed --noconfirm tmux neovim powerline code atom ranger 


sudo pacman -S --needed --noconfirm tree  nodejs npm composer rsync rxvt-unicode alacritty
