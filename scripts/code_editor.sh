#!/bin/bash
# =============================================================================
#  Development Environment & Code Editors Stack
# =============================================================================
set -e

printf "\n[*] Resolving Zsh site-functions conflict overlays for builders...\n"
for conf_file in _composer _alacritty; do
    if [ -f "/usr/share/zsh/site-functions/$conf_file" ]; then
        sudo rm -rf "/usr/share/zsh/site-functions/$conf_file"
    fi
done

printf "\n[*] Deploying Modern Text Editors and System Multiplexers...\n"
# code: Open-source VS Code binary for Arch Linux
sudo pacman -S --needed --noconfirm tmux neovim helix code

printf "\n[*] Deploying Shell Utilities & Environment Essentials...\n"
# ตัด ueberzug เก่าออกชั่วคราวเพราะ Yazi/Ranger ยุคใหม่ดึงผ่าน Engine อื่นที่เบากว่าได้
sudo pacman -S --needed --noconfirm ranger tree rsync

printf "\n[*] Engineering Web Development Runtime Stack (NodeJS & PHP tools)...\n"
sudo pacman -S --needed --noconfirm yarn nodejs npm composer

printf "\n[*] Bootstrapping Global Laravel Installer Framework...\n"
# 💡 ป้องกันสคริปต์หา Path ไม่เจอด้วยการระบุ Directory ชัดเจน ป้อนทีเดียวจบ
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
composer global require --dev laravel/installer --quiet

printf "[SUCCESS] Code editors and Full-Stack web development engines are ready.\n"
