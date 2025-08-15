#!/usr/bin/env bash

echo " ============ Install Pinta ========="
echo "pinta is the simple image manipulation"

snap install pinta

# the below code is NOT WORKING 16 May 2025
# change back to home folder
#cd ~/
#pinta_dir=~/pinta
#function getPinta() {
#
#  if [ -d "$pinta_dir" ]; then
#    echo "found the dir " && ls -la --color=auto $pinta_dir
#    rm -rf $pinta_dir
#
#  fi
#
#  # run git to clone the pinta repo
#  # git clone https://aur.archlinux.org/pinta-git.git
#  git clone https://aur.archlinux.org/pinta.git
#
#  cd $pinta_dir
#  makepkg -si
#}
#
#function delPinta() {
#  echo "====== Delete the install directory now"
#
#  if [ -d "$pinta_dir" ]; then
#    echo "found the dir " && ls -la --color=auto $pinta_dir && echo "delete from function!"
#    rm -rf $pinta_dir
#
#  fi
#}
#
#getPinta && delPinta || echo "Sorry script has Error!" && sleep 10s
#echo "the script is done!"
