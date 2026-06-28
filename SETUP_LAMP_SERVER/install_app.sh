#!/bin/bash 

echo "Updating system and installing base development tools..."

# สั่งซิงค์คลังแพ็กเกจและอัปเดตระบบแบบไม่ต้องกดยืนยัน (--noconfirm)
sudo pacman -Syyu --noconfirm

# ติดตั้ง Text Editors (รวมทั้งเครื่องมือช่วยของ Neovim สำหรับ Python)
sudo pacman -S --needed --noconfirm gvim neovim python-pynvim tree tmux

# ติดตั้งฐานข้อมูล PostgreSQL, คลังโค้ด และ PHP Extensions ที่จำเป็น
sudo pacman -S --needed --noconfirm postgresql php-intl php-pgsql

# ติดตั้ง Apache, PHP พื้นฐาน, SQLite และ Composer (สำหรับจัดการ Laravel)
sudo pacman -S --needed --noconfirm apache php php-apache php-sqlite filezilla composer 
sudo pacman -S --needed --noconfirm sqlitebrowser

# ติดตั้ง Node.js และ npm (สำหรับพัฒนาฝั่ง Frontend เช่น Next.js และ TailwindCSS)
sudo pacman -S --needed --noconfirm nodejs npm

echo "Application tools package installation completed."
