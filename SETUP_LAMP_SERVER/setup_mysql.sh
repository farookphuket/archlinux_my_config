#!/bin/bash

# ที่อยู่ของไฟล์สำรองสำหรับตั้งค่าเสริม เช่น phpMyAdmin config
FILES_DIR=~/setup_lamp_server/files_inc

# ค้นหาชื่อผู้ใช้จริงที่เรียกใช้สคริปต์ (ป้องกันการเพี้ยนเป็น root จากคำสั่ง sudo)
REAL_USER=${SUDO_USER:-$USER}

echo "--------------------------------------------------"
echo "   Configuring MariaDB (MySQL) Database           "
echo "--------------------------------------------------"

# ติดตั้ง MariaDB บน Arch Linux (ตัวเดียวกับ MySQL)
sudo pacman -S mariadb --needed --noconfirm
sleep 2s

# ตรวจสอบความปลอดภัย: ถ้าพึ่งรันเครื่องทดสอบครั้งแรก ให้สร้างโฟลเดอร์เก็บข้อมูล
if [ ! -d "/var/lib/mysql/mysql" ]; then
    sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

# เริ่มต้นเปิด Service ของ MySQL
sudo systemctl enable mariadb
sudo systemctl start mariadb
sleep 2s

# ทำคำสั่งลัดเสมือนการรัน mysql_secure_installation เพื่อตั้งรหัสผ่าน root เป็น 1234 อัตโนมัติ
sudo mariadb -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

# จัดการ Group และ สิทธิ์ สำหรับ Apache (www-data)
if ! getent group www-data > /dev/null; then
    sudo groupadd www-data
fi
sudo usermod -a -G www-data "$REAL_USER"

# ติดตั้ง phpMyAdmin
sudo pacman -S phpmyadmin --noconfirm
sudo mkdir -p /var/lib/phpmyadmin
sudo chmod 777 -R /var/lib/phpmyadmin

# วางไฟล์ config phpMyAdmin และอัปเดตสิทธิ์ให้ใช้งานได้คล่องตัว
sudo cp "$FILES_DIR/config.inc.php" /etc/webapps/phpmyadmin
sudo chown -R "$REAL_USER:www-data" /etc/webapps/phpmyadmin
sudo chmod 775 -R /etc/webapps/phpmyadmin
echo ">>> phpMyAdmin installed and configured."

echo "--------------------------------------------------"
echo "   Configuring PostgreSQL Database                "
echo "--------------------------------------------------"

# ระบบดักตรวจสอบ: ถ้ายังไม่มีคลังข้อมูล PostgreSQL ให้เริ่มสร้างใหม่
if [ ! -d "/var/lib/postgres/data" ] || [ -z "$(ls -A /var/lib/postgres/data)" ]; then
    sudo -u postgres initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'
fi

# เปิดใช้ Service ของ PostgreSQL
sudo systemctl enable postgresql
sudo systemctl start postgresql
sleep 2s

# สร้างสิทธิ์ User และฐานข้อมูลใน PostgreSQL ให้มีสิทธิ์เท่า Linux user รหัสผ่าน '1234'
sudo -u postgres psql <<EOF
CREATE USER $REAL_USER WITH PASSWORD '1234';
ALTER USER $REAL_USER WITH SUPERUSER;
CREATE DATABASE $REAL_USER OWNER $REAL_USER;
EOF
echo ">>> PostgreSQL user setup complete."

echo "--------------------------------------------------"
echo "   Preparing Virtual Directory and Web Projects   "
echo "--------------------------------------------------"

# สร้างโฟลเดอร์จำลองสำหรับทดสอบโปรเจกต์ Laravel
sudo mkdir -p /srv/http/lav8.x1/public
sudo mkdir -p /srv/http/article.me

# คัดลอกไฟล์แสดงผลเริ่มต้นดั้งเดิม
[ -f "$FILES_DIR/index.php" ] && sudo cp "$FILES_DIR/index.php" /srv/http/lav8.x1/public
[ -f "$FILES_DIR/index.html" ] && sudo cp "$FILES_DIR/index.html" /srv/http/article.me

# เปิดสิทธิ์เข้าถึง 777 เต็มที่สำหรับเขียน-อ่านในเครื่องทดสอบ
sudo chmod 777 -R /srv/http/lav8.x1
sudo chmod 777 -R /srv/http/article.me

# เปิดใช้งานและรีสตาร์ท Apache Web Server (httpd) เพื่อรับคอนฟิกใหม่ทั้งหมด
sudo systemctl enable httpd
sudo systemctl restart httpd

echo "MySQL, PostgreSQL, Apache setup completed successfully."
