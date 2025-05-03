#!/bin/bash

yay -Sy brave-bin --needed --noconfirm

sudo pacman -Sy firefox chromium vivaldi --needed --noconfirm

# last update 4 May 2025
cd ~/

# clone google-chrome repo
git clone https://aur.archlinux.org/google-chrome.git
cd ~/google-chrome

# run setup google-chrome script
makepkg -si

cd ~/

# remove google-chrome directory after install
rm -rf ~/google-chrome

# install vivaldi on 8 aug 2022
# the shortcut key is Super+F5
# call in shortcut vivaldi-stable
