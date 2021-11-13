#!/bin/bash 


ex_ya=/usr/share/zsh/site-functions/_yay 
if [ -f "$ex_ya" ] ; 
then 
    sudo rm -rf $ex_ya
fi


pushd ~/ 

git clone https://aur.archlinux.org/yay-git.git ~/yay 

cd yay 

makepkg -si 

popd 
