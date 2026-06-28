#!/bin/bash

# --- แสดงข้อความเริ่มต้น ---
echo "=================================================="
echo "      Starting WebDev Server Setup Script         "
echo "=================================================="

# กำหนดรูปแบบวันที่สำหรับ Backup โฟลเดอร์เก่า
cur_date=$(date +"%d-%m-%Y_%H:%M:%S_%A")

# โฟลเดอร์หลักที่ต้องการใช้รันสคริปต์ใน Home
cur_dir=~/setup_lamp_server

# เช็คว่าถ้ามีโฟลเดอร์เก่าอยู่แล้ว ให้ย้ายชื่อเพื่อทำ Backup
if [ -d "$cur_dir" ]; then
  echo "Found existing directory. Moving to backup..."
  mv "$cur_dir" "${cur_dir}.old_${cur_date}"
fi

# สร้างโฟลเดอร์ใหม่และคัดลอกไฟล์ทั้งหมดจากปัจจุบันเข้าไป
mkdir -p ~/setup_lamp_server
cp -r . ~/setup_lamp_server

# สั่งรันสคริปต์หลักด้วย bash (ระบุสิทธิ์ sudo ไว้ล่วงหน้า)
sudo bash ~/setup_lamp_server/setup.sh

echo "---- Script RUN END ----"
