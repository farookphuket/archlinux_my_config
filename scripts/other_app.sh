#!/bin/bash 



sudo pacman -S --needed --noconfirm tree htop feh nitrogen  rofi sxhkd conky
sudo pacman -S --needed --noconfirm inkscape rsync nautilus krusader picom

sudo pacman -S --needed --noconfirm vlc thunderbird usbutils

sudo pacman -S --needed --noconfirm arandr

# 15 Jan 2022 i3exit install 
pushd ~/
git clone https://aur.archlinux.org/i3exit.git
cd ~/i3exit 
makepkg -si 

sleep 5s 
rm -rf ~/i3exit

popd


#sleep 5s

# =============================================================================
# the folder `.dwm` is will call by `dwm` script for the auto load program like 
# slstatus(to draw the status line) nitrogen(draw wall paper) etc,
# copy config folder 
cp -r ~/archlinux_my_config/CONFIG_FILES/.dwm/ ~/

