#!/bin/bash 



sudo pacman -S --needed --noconfirm tree htop feh nitrogen  rofi sxhkd conky
sudo pacman -S --needed --noconfirm inkscape rsync nautilus krusader picom
<<<<<<< HEAD
sudo pacman -S --needed --noconfirm vlc thunderbird usbutils
=======
sudo pacman -S --needed --noconfirm i3exit
>>>>>>> 477515e (install i3exit on 31 Dec 2021)

sleep 5s

# =============================================================================
# the folder `.dwm` is will call by `dwm` script for the auto load program like 
# slstatus(to draw the status line) nitrogen(draw wall paper) etc,
# copy config folder 
cp -r ~/archlinux_my_config/CONFIG_FILES/.dwm/ ~/

