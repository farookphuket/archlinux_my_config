#!/bin/bash
set -e

printf "\n[*] Cleaning Zsh auto-completion conflicts for yay...\n"
EX_YA="/usr/share/zsh/site-functions/_yay"
if [ -f "$EX_YA" ]; then 
    sudo rm -rf "$EX_YA"
fi

printf "\n[*] Compiling AUR Helper (yay-git) from source...\n"
cd "$HOME"

# Prevent duplicate repository build errors
[ -d "$HOME/yay" ] && rm -rf "$HOME/yay"

git clone https://aur.archlinux.org/yay-git.git "$HOME/yay"
cd "$HOME/yay"

# --noconfirm: Auto accept layout questions
# --needed: Do not rebuild if already existing inside system
makepkg -si --noconfirm --needed

cd "$HOME"
printf "[SUCCESS] AUR Build Helper (yay) configured perfectly.\n"
