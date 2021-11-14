#!/bin/bash 


CONFIG_FILE_DIR=~/archlinux_my_config/CONFIG_FILES 
sudo pacman -S dmidecode edk2-ovmf --needed

     
sudo pacman -S --needed virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat 


sudo cp -r $CONFIG_FILE_DIR/networks /usr/share/libvirt/ 

# enable libvirt on boot
sudo systemctl enable libvirtd

# start libvirt now
sudo systemctl start libvirtd


# add user to group
sudo usermod -aG libvirt $USER
    
