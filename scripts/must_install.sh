#!/bin/bash

# the must have install app
echo "################################################"
echo "######  the must install app on the system!! ###"
echo "################################################"

sudo pacman -S eza bat

sudo pacman -Sy --needed docker docker-compose docker-buildx

## ---- enable docker now 
sudo systemctl enable --now docker

# --- give a permission this user
sudo usermod -aG docker $USER
newgrp docker

# rofi power-menu last install 18 feb 2026
yay -S rofi-power-menu
