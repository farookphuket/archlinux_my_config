#!/bin/bash 
 
## go to home folder 
#pushd ~/ 
#
## create dir for puddletag 
#mkdir -p ~/pdtag 
#
## change working dir to pdtag 
#cd ~/pdtag 
#
## clone puddletag script from the repo
#git clone https://aur.archlinux.org/puddletag.git .
#
#
## then run script
#makepkg -si 
#
#
## hold 5 sec
#sleep 5s 
#
#popd 
#
## delete the run script dir 
#rm -rf ~/pdtag
#
#
#echo "######################### Puddletag has been installed! #################"
 
# last update 8 Mar 2022 
yay -S puddletag-git 
