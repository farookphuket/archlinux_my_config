#!/bin/bash 



# shutter will only work if install from snap store
# this file was create on 30 Oct 2021 

cd ~ 
git clone https://aur.archlinux.org/photofilmstrip.git 
cd ~/photofilmstrip 
makepkg -si
