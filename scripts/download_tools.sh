#!/bin/bash
# =============================================================================
#  Modern Network Download Tools Stack
# =============================================================================
set -e

printf "\n[*] Purging outdated legacy download scripts from Zsh logs...\n"
if [ -f "/usr/share/zsh/site-functions/_youtube-dl" ]; then
    sudo rm -rf "/usr/share/zsh/site-functions/_youtube-dl"
fi

printf "\n[*] Deploying High-Speed Network Media Downloader Engine...\n"
# yt-dlp: ตัวแทนที่ทรงพลังที่สุดของ youtube-dl โหลดวิดีโอและไฟล์ได้ทุกแพลตฟอร์ม
sudo pacman -S --needed --noconfirm yt-dlp aria2 curl wget

printf "[SUCCESS] Modern download suite engines are fully integrated.\n"
