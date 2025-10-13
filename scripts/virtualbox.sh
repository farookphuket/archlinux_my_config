#!/bin/bash

# install virtualbox
# 13 Nov. 2025 need to install linux-headers or cannot run `sudo /sbin/vboxconfig` otherwise
sudo pacman -S virtualbox linux-headers --needed --noconfirm

sleep 5s

modprobe vboxdrv
