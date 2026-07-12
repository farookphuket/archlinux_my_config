#!/bin/bash
# =============================================================================
#  Bluetooth Subsystem & Systray Audio Controllers Deployment
# =============================================================================
set -e

printf "\n[*] Installing Bluetooth Stack and Core Signal Utilities...\n"
# bluez: แกนหลักบลูทูธ, bluez-utils: รวมคำสั่งควบคุม (เช่น bluetoothctl)
# blueman & blueberry: อินเตอร์เฟซกราฟิกสำหรับกดเชื่อมต่ออุปกรณ์
sudo pacman -S --needed --noconfirm \
    bluez \
    bluez-utils \
    bluez-tools \
    blueman \
    blueberry \
    pavucontrol

printf "\n[*] Activating Bluetooth Hardware Daemons...\n"
sudo systemctl enable --now bluetooth.service

printf "\n[*] Fetching Audio Level Trays and Mixers via AUR...\n"
# pa-applet-git: ไอคอนปรับเสียงบน Systray ของ DWM ที่พี่ใช้ใน autostart.sh
yay -S --needed --noconfirm pa-applet-git pamixer-git

printf "[SUCCESS] Bluetooth and Audio integration layer deployed successfully.\n"
