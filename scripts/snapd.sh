#!/bin/bash
set -e

printf "\n[*] Resolving Zsh function layout overlays for Snapd...\n"
EX_SNP="/usr/share/zsh/site-functions/_snap"
if [ -f "$EX_SNP" ]; then
    sudo rm -rf "$EX_SNP"
fi

printf "\n[*] Fetching and compiling Snap Engine framework...\n"
cd "$HOME"

# Flush old staging directory paths
[ -d "$HOME/snapd" ] && rm -rf "$HOME/snapd"

git clone https://aur.archlinux.org/snapd.git "$HOME/snapd"
cd "$HOME/snapd"
makepkg -si --noconfirm --needed

printf "\n[*] Registering Core Sockets with the Linux Init System...\n"
sudo systemctl enable --now snapd.socket

printf "\n[*] Binding symbolic links for classic app deployment compatibilities...\n"
if [ ! -L /snap ]; then
    sudo ln -s /var/lib/snapd/snap /snap
fi

cd "$HOME"
printf "[SUCCESS] Snap Core Engine deployed successfully.\n"
