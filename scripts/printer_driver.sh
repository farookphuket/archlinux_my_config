#!/bin/bash

echo " ===================== Install HP 3830 Printer Driver ================="
echo " please wait...."
echo " ======================================================================"

# Install cups for arch linux
sudo pacman -Syu cups system-config-printer cups-browsed --needed --noconfirm
sudo pacman -Sy bluez-cups --needed --noconfirm

# start deamon  after install
sudo systemctl enable cups
sudo systemctl start cups

yay -S hplip
