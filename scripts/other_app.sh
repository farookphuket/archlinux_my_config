#!/bin/bash

sudo pacman -Syu --needed --noconfirm inkscape

## to prevent vlc cannot play .h264 file should install vlc-plugins-all
## last update 12 Nov. 2025
sudo pacman -Syu --needed --noconfirm vlc vlc-plugins-all thunderbird

# last added 23 Apr 2022
sudo pacman -Syu --needed --noconfirm sushi nautilus-image-converter

# fake background webcam and webcam program 25 Jul 2022
#sudo yay -S fswebcam fake-background-webcam-git

# screen zoom in 10 Feb 2022
sudo pacman -Syu --needed --noconfirm kmag
