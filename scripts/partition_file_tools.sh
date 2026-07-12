#!/bin/bash
# =============================================================================
#  Storage Media Drivers & Partition Managers Suite
# =============================================================================
set -e

printf "\n[*] Integrating File System Drivers for External Storage (FAT/NTFS)...\n"
# gparted: เครื่องมือจัดการพาร์ทิชันกราฟิก
# dosfstools & mtools: รองรับแฟลชไดรฟ์/การ์ดจอระบบ FAT/FAT32
# ntfs-3g: รองรับการอ่าน-เขียน External Harddrive ค่าย Windows
sudo pacman -S --needed --noconfirm gparted dosfstools mtools ntfs-3g

printf "[SUCCESS] External storage device file systems are fully supported.\n"
