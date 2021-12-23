#!/bin/bash 


# delete _cmus other whise install error
ex_cmus=/usr/share/zsh/site-functions/_cmus

if [ -f "$ex_cmus" ] ; 
then
sudo rm -rf /usr/share/zsh/site-functions/_cmus 
fi

sudo pacman -S --needed --noconfirm cmus 



# install vlc
pamac install vlc


# sound player , editor
sudo pacman -S  --needed --noconfirm audacious  clementine audacity

# amarok is take too much time to install so I just disabled here
# yay -S amarok-git --needed 
