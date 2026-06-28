#!/bin/bash

echo "Backing up default configs and copying tailored server configurations..."

TODAY=$(date +"%Y-%m-%d_at_%H:%M:%S")

# สร้างโฟลเดอร์สำหรับเก็บไฟล์เก่าของระบบเอาไว้ในหมวด Documents
mkdir -p ~/Documents/Old_config
BACKUP_PATH=~/Documents/Old_config
target_dir=~/setup_lamp_server/files_inc

# แบ็กอัปและจัดวางไฟล์ /etc/hosts ใหม่
if [[ -f /etc/hosts ]]; then
  sudo cp /etc/hosts "$BACKUP_PATH/hosts.old_$TODAY"
  sudo mv /etc/hosts /etc/hosts.old
fi
sudo cp "$target_dir/hosts" /etc/

# จัดการคัดลอกโฟลเดอร์ตั้งค่า phpMyAdmin ให้ทำงานร่วมกับ Apache
sudo cp "$target_dir/phpmyadmin.conf" /etc/httpd/conf/extra/

# แบ็กอัปและติดตั้งไฟล์คอนฟิกหลักของ Apache httpd.conf
if [[ -f /etc/httpd/conf/httpd.conf ]]; then
  sudo cp /etc/httpd/conf/httpd.conf "$BACKUP_PATH/httpd.conf.old_$TODAY"
  sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.old
fi
sudo cp "$target_dir/httpd.conf" /etc/httpd/conf/

# แบ็กอัปและติดตั้งไฟล์ตั้งค่า PHP (php.ini)
if [[ -f /etc/php/php.ini ]]; then
  sudo cp /etc/php/php.ini "$BACKUP_PATH/php.ini.old_$TODAY"
  sudo mv /etc/php/php.ini /etc/php/php.ini.old
fi
sudo cp "$target_dir/php.ini" /etc/php/

# แบ็กอัปและติดตั้ง Virtual Hosts คอนฟิก
vh_file=/etc/httpd/conf/extra/httpd-vhosts.conf
if [[ -f "$vh_file" ]]; then
  sudo cp "$vh_file" "$BACKUP_PATH/httpd-vhosts.conf.old_$TODAY"
  sudo mv "$vh_file" "${vh_file}.old"
fi
sudo cp "$target_dir/httpd-vhosts.conf" /etc/httpd/conf/extra/

echo "Configuration files injection complete."
