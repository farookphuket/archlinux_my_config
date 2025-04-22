#!/bin/bash

sudo pacman -Syu pavucontrol pulseaudio-bluetooth pulseaudio --needed --noconfirm

sudo systemctl start pulseaudio

yay -Sy pa-applet-git pamixer-git --needed --noconfirm

sudo pacman -Syu blueberry blueman bluez-utils bluez bluez-tools --needed --noconfirm

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
