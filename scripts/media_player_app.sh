#!/bin/bash
# =============================================================================
#  Core Media Player and Frameworks Stack
# =============================================================================
set -e

printf "\n[*] Purging Zsh auto-completion conflicts for cmus...\n"
if [ -f "/usr/share/zsh/site-functions/_cmus" ]; then
    sudo rm -rf "/usr/share/zsh/site-functions/_cmus"
fi

printf "\n[*] Deploying Core Audio & Video Players Stack...\n"
# clementine: โปรแกรมฟังเพลงจัดการคลังเพลงขนาดใหญ่
# cmus: โปรแกรมฟังเพลงระดับ Lightweight บน Terminal
# vlc & vlc-plugin-ffmpeg: ตัวเล่นวิดีโอสากลและปลั๊กอินถอดรหัสความละเอียดสูง
sudo pacman -S --needed --noconfirm \
    clementine \
    cmus \
    vlc \
    vlc-plugin-ffmpeg

printf "[SUCCESS] Core Media Playback engines integrated flawlessly.\n"
