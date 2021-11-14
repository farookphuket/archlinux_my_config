#!/bin/bash 


CONFIG_FILE_DIR=~/archlinux_my_config/CONFIG_FILES 

# to enable efi boot
sudo pacman -S dmidecode edk2-ovmf --needed

     
sudo pacman -S --needed virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat 


# fix network default not define 14 Nov 2021 from :
# https://blog.programster.org/kvm-missing-default-network
sudo cp -r $CONFIG_FILE_DIR/networks /usr/share/libvirt/ 

sudo virsh net-define /usr/share/libvirt/networks/default.xml

sudo virsh net-autostart --network default

sleep 5s

# enable libvirt on boot
sudo systemctl enable libvirtd

# start libvirt now
sudo systemctl start libvirtd


# add user to group
sudo usermod -aG libvirt $USER


msg_title="Success! : config virt manager"
msg_back="please Restart your machine!"
msg_body="your virt-manager has been install successfully but some service maybe not set yet! 
please restart your machine in order to use this program"


dialog --title $msg_title --backtitle $msg_back --msgbox $msg_body 14 65
    
