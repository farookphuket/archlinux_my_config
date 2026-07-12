#!/bin/bash
# =============================================================================
#  NVIDIA Proprietary Graphics Driver Stack
# =============================================================================
set -e

printf "\n[*] Deploying Official NVIDIA Graphics Drivers & Control Panels...\n"
# nvidia-utils / nvidia: ตัวขับเคลื่อนการ์ดจอค่ายเขียวสำหรับ Kernel หลัก
sudo pacman -S --needed --noconfirm nvidia nvidia-settings

printf "[SUCCESS] NVIDIA Hardware acceleration layer integrated.\n"
