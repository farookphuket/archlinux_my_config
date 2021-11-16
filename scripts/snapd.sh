#!/bin/bash 


ex_snp=/usr/share/zsh/site-functions/_snap
if [ -f "$ex_snp" ] ;
then
    sudo rm -rf $ex_snp 
    echo "deleted file"
fi

pushd ~/ 
git clone https://aur.archlinux.org/snapd.git 
cd snapd 
makepkg -si
sudo systemctl enable --now snapd.socket

# make a symbolic link 
sudo ln -s /var/lib/snapd/snap /snap 

popd 


yay -Syu

# pamac not has install yet at this point 
# last edit 17 Nov 2021
# pamac update

 
sudo pacman -Syyu 
