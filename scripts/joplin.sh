#!/bin/bash 


# go to home dir
cd ~/ 

# clone the app
git clone https://aur.archlinux.org/joplin-appimage.git

# go to the folder
cd ~/joplin-appimage

# run install 
makepkg -si
