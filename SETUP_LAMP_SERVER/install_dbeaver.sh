
#!/bin/bash

echo "========================================================================="
echo " Installing DBeaver (Universal Database Manager)                         "
echo " Note: Installs Java runtime required for running eclipse-based DBeaver. "
echo "========================================================================="

# ติดตั้ง Java OpenJDK และ DBeaver ตัวเต็มแบบไม่ต้องยืนยัน
sudo pacman -S --needed --noconfirm jre-openjdk dbeaver

echo "DBeaver installed successfully."
