#!/bin/bash 

sudo pacman -Syyu --disable-download-timeout

# install code editor package
sudo pacman -S --needed code atom tmux powerline  --noconfirm
sudo pacman -S --needed gvim neovim python-pynvim  tree --noconfirm

sudo pacman -Sy --needed php-intl  --noconfirm 

sudo pacman -S  --needed --noconfirm apache php php-apache php-sqlite filezilla composer 
sudo pacman -S  sqlitebrowser --needed --noconfirm
sudo pacman -S  nodejs npm --needed --noconfirm



