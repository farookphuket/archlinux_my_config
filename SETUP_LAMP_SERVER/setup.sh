#!/bin/bash

# สั่งให้สคริปต์หยุดทำงานทันทีหากมีคำสั่งย่อยใดทำงานผิดพลาด (Fail-Safe)
set -e

echo "--------------------------------------------------"
echo "   Setting up Full WebDev Stack for Arch Linux    "
echo "   Apache + PHP + MySQL + PostgreSQL + Node.js    "
echo "--------------------------------------------------"
echo "Please enter your sudo password if prompted."
echo "--------------------------------------------------"

# ดึงสิทธิ์ sudo ค้างไว้ตั้งแต่เริ่มสคริปต์ ป้องกันไม่ให้หยุดถามกลางทาง
sudo -v

# กำหนดโฟลเดอร์ที่จัดเก็บสคริปต์
run_dir=~/setup_lamp_server

# ลำดับการรันสคริปต์ย่อยต่างๆ
bash "$run_dir/install_app.sh"
bash "$run_dir/install_dbeaver.sh"
bash "$run_dir/fileman.sh"

echo ">>> Required base packages installed successfully."
sleep 2s

echo ">>> Starting Database Setup Process..."
bash "$run_dir/setup_mysql.sh"

echo "=================================================="
echo "          ALL SETUP PROCESS SUCCESS               "
echo "=================================================="

# ตรวจสอบว่าระบบมีหน้าจอ GUI หรือไม่ก่อนสั่งเปิด Firefox (สำหรับ DWM)
if [ -n "$DISPLAY" ]; then
    echo "Opening browsers for verification..."
    firefox -- "http://lav8.x1" &
    firefox -- "http://localhost/phpmyadmin" &
fi
