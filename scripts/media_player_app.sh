#!/bin/bash

# delete _cmus other whise install error
ex_cmus=/usr/share/zsh/site-functions/_cmus

if [ -f "$ex_cmus" ]; then
  sudo rm -rf /usr/share/zsh/site-functions/_cmus
fi

sudo pacman -Syu --needed --noconfirm cmus audacious clementine audacity vlc-plugin-ffmpeg

# install vlc
pamac install vlc

# update ffmpeg plugin for vlc 16 Aug 2025
