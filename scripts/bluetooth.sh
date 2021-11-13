#!/bin/bash 


sudo pacman -S pavucontrol pulseaudio-bluetooth pulseaudio  

sudo systemctl start pulseaudio



yay -S pa-applet-git pamixer-git

sudo pacman -S --needed blueberry blueman bluez-utils bluez bluez-tools

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service


