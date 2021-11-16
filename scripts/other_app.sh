#!/bin/bash 



sudo pacman -S --needed --noconfirm tree htop feh nitrogen rsync nautilus krusader rofi sxhkd conky

sleep 5s

# copy config folder 
cp -r ~/archlinux_my_config/CONFIG_FILES/.dwm/ ~/

