#!/bin/bash 



echo " ===================== Install HP 3830 Printer Driver ================="
echo " please wait...."
echo " ======================================================================"



sudo pacman -S cups --needed --noconfirm

yay -S hplip
