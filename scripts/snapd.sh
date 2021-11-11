#!/bin/bash 


pushd ~/ 
git clone https://aur.archlinux.org/snapd.git 
cd snapd 
makepkg -si
sudo systemctl enable --now snapd.socket

# make a symbolic link 
sudo ln -s /var/lib/snapd/snap /snap 

popd 


yay -Syu

pamac update

 
sudo pacman -Syyu 
