#!/bin/bash

# install virtualbox
sudo pacman -S virtualbox --needed --noconfirm

sleep 5s

modprobe vboxdrv
