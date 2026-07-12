#!/bin/bash
# =============================================================================
#  Web Browser Environments Deployment Suite
# =============================================================================
set -e

printf "\n[*] Deploying Core Web Browsers from official repositories...\n"
sudo pacman -S --needed --noconfirm firefox chromium vivaldi

printf "\n[*] Compiling Binary Web Browsers via AUR Context...\n"
# ดึงแพ็กเกจตรงรวดเร็ว ไม่ค้างหน้ารอการกดยืนยัน
yay -S --needed --noconfirm brave-bin google-chrome

printf "[SUCCESS] All selected browsing environments deployed successfully.\n"
