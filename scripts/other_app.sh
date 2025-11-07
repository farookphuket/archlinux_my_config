#!/bin/bash

sudo pacman -Syu --needed --noconfirm inkscape

sudo pacman -Syu --needed --noconfirm vlc thunderbird

# last added 23 Apr 2022
sudo pacman -Syu --needed --noconfirm sushi nautilus-image-converter

# to fix vlc cannot play .h264 file
sudo pacman -S vlc-plugins-all --needed

# fake background webcam and webcam program 25 Jul 2022
#sudo yay -S fswebcam fake-background-webcam-git

# screen zoom in 10 Feb 2022
sudo pacman -Syu --needed --noconfirm kmag

popd

#sleep 5s
