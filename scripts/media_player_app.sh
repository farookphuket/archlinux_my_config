#!/bin/bash

# delete _cmus other whise install error
ex_cmus=/usr/share/zsh/site-functions/_cmus

if [ -f "$ex_cmus" ]; then
  sudo rm -rf /usr/share/zsh/site-functions/_cmus
fi

sudo pacman -Syu --needed --noconfirm cmus audacious clementine audacity

# install vlc
pamac install vlc
