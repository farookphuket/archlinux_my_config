#!/bin/bash 



pushd ~/ 

git clone https://aur.archlinux.org/yay-git.git ~/yay 

cd yay 

makepkg -si 

popd 
