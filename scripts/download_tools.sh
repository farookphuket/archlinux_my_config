#!/bin/bash

ex_yd=/usr/share/zsh/site-functions/_youtube-dl

if [ -f "$ex_yd" ]; then
  sudo rm -rf $ex_yd
fi

# install youtube-dl
# sudo  pacman -S --needed --noconfirm rsync
