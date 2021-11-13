#!/bin/bash 


# delete _cmus other whise install error
ex_cmus=/usr/share/zsh/site-functions/_cmus

if [ -f "$ex_cmus" ] ; 
then
sudo rm -rf /usr/share/zsh/site-functions/_cmus 
fi

sudo pacman -S --needed --noconfirm cmus audacious



# install vlc
pamac install vlc


# sound player 
sudo pacman -S  --needed --noconfirm audacious amarok clementine
