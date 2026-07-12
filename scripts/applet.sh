#!/bin/bash
set -e

printf "\n[*] Installing Network Manager Applet (Systray Wi-Fi icon)...\n"
# ย้ายมาใช้คลังหลัก pacman แทนการเรียก yay เพื่อความรวดเร็วและปลอดภัย
sudo pacman -S --needed --noconfirm network-manager-applet

printf "\n[*] Deploying Lightweight Pamac Update Indicator Tray...\n"
# ใช้เวอร์ชันปกติที่ไม่ผูกขาดกับระบบ Plasma Desktop เพื่อความเบาบาง
yay -S --noconfirm --needed pamac-tray-icon-plasma

printf "\n[*] Compiling Birdtray (Thunderbird Tray System) from AUR...\n"
cd "$HOME"
[ -d "$HOME/birdtray" ] && rm -rf "$HOME/birdtray"

git clone https://aur.archlinux.org/birdtray.git "$HOME/birdtray"
cd "$HOME/birdtray"
makepkg -si --noconfirm --needed

cd "$HOME"
printf "[SUCCESS] All crucial background applets and trays are now ready.\n"
