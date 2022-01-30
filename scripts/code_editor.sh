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

sudo pacman -S --needed --noconfirm tmux neovim powerline code atom 

sudo pacman -S --needed --noconfirm ranger ueberzug

sudo pacman -S --needed --noconfirm tree rsync rxvt-unicode alacritty

sudo pacman -S --needed --noconfirm yarn nodejs npm composer


# only to set composer for using laravel installer global 
# last edit 21 Nov 21
# this way you can just type laravel new to create new laravel project
composer global require laravel/installer
