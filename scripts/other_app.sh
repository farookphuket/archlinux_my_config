#!/bin/bash
# =============================================================================
#  Productivity Utilities & PostgreSQL Database Runtime Stack
# =============================================================================
set -e

printf "\n[*] Deploying Creative Tools and Office Assistants...\n"
# inkscape: โปรแกรมวาดภาพเวกเตอร์ระดับโปร
# thunderbird: โปรแกรมจัดการอีเมลที่พี่ผูก Tray Icon ไว้ใน autostart.sh
# kmag: ทูลขยายหน้าจอสำหรับช่วยตรวจเช็กพิกเซล UI
sudo pacman -S --needed --noconfirm inkscape thunderbird kmag

printf "\n[*] Deploying Nautilus File Manager Extension Tools...\n"
sudo pacman -S --needed --noconfirm sushi nautilus-image-converter

