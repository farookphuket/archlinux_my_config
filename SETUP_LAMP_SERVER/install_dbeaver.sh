#!/bin/bash 


echo "================ Installing DBeaver ====================================="
echo " install java runtime for dbeaver if you see any Error message during "
echo "installation you may have to re-run this installer script again."
echo " "
echo "========================================================================="

sudo pacman -Syyu 

# =========== you have to install java to using dbeaver =======================
sudo pacman --needed --noconfirm -S jre-openjdk dbeaver 







