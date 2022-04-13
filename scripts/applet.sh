#!/bin/bash 



# network-manager-applet
yay -S network-manager-applet 




# pamac-tray 
yay -S pamac-tray-icon-plasma



# thunderbird tray icon 13 Apr 2022
pushd ~/ 
git clone https://aur.archlinux.org/birdtray.git 
cd birdtray 
makepkg -si 
