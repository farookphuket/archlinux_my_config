#!/bin/bash
# =============================================================================
#  ISO Image Flasher & USB Bootable Media Writer Deployment
# =============================================================================
set -e

printf "\n[*] Fetching Imagewriter Engine from Arch User Repository...\n"
# imagewriter: ทูลเขียนไฟล์ .iso ลงแฟลชไดรฟ์แบบ GUI ใช้งานง่ายมาก
yay -S --needed --noconfirm imagewriter

printf "[SUCCESS] ISO Image flashing utilities have been integrated.\n"
