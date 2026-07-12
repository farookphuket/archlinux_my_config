#!/bin/bash
# =============================================================================
#  CUPS Printing Core Framework & HP Device Drivers Setup
# =============================================================================
set -e

printf "\n[*] Deploying Linux Printing Core Engine (CUPS Layouts)...\n"
sudo pacman -S --needed --noconfirm cups system-config-printer cups-browsed bluez-cups

printf "\n[*] Launching System Printing Daemons seamlessly...\n"
# --now: สั่งทั้ง Enable (เปิดถาวรตอนเปิดเครื่อง) และ Start (รันทันทีตอนนี้) ควบในคำสั่งเดียว
sudo systemctl enable --now cups.service

printf "\n[*] Compiling HP Linux Imaging and Printing Tools (HPLIP)...\n"
# hplip: ไดรเวอร์ตรงรุ่นสำหรับ HP DeskJet 3830 และรุ่นอื่นๆ ของ HP
yay -S --needed --noconfirm hplip

printf "[SUCCESS] Printing infrastructure tailored for HP 3830 is ready.\n"
