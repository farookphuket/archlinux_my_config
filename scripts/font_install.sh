#!/bin/bash
set -e

printf "\n[*] Synchronizing System Base Fonts (Noto & Modern Layouts)...\n"
sudo pacman -S --needed --noconfirm \
    noto-fonts \
    noto-fonts-extra \
    ttf-ibm-plex \
    ttf-ubuntu-font-family \
    ttf-font-awesome

printf "\n[*] Fetching Auxiliary Desktop Layout Fonts via AUR...\n"
yay -S --noconfirm --needed otf-font-awesome ttf-ms-fonts

printf "\n[*] Cloning Customized Personal Typography Repositories...\n"
cd "$HOME"
[ -d "$HOME/my_fonts" ] && rm -rf "$HOME/my_fonts"

git clone https://gitlab.com/farookphuket/my_fonts.git "$HOME/my_fonts"
sleep 2

# Target system paths definitions
FONT_SOURCE_DIR="$HOME/my_fonts/FONTS"
# 🎯 ปรับแก้ตรงนี้ตามที่พี่ชอบ! ให้สร้างโฟลเดอร์ตามชื่อ USER หรือ ROOT ที่เป็นคนกดรันสคริปต์
FONT_TARGET_DIR="/usr/share/fonts/custom_$USER"

# Create exclusive subdirectory dynamically based on user context
sudo mkdir -p "$FONT_TARGET_DIR"

printf "\n[*] Deploying custom font packages to system landscape...\n"
if [ -d "$FONT_SOURCE_DIR" ]; then
    # Copy all custom typography safely
    sudo cp -r "$FONT_SOURCE_DIR"/. "$FONT_TARGET_DIR/"
fi

printf "\n[*] Rebuilding Global OS Font Cache Schemas...\n"
sudo fc-cache -f -v > /dev/null

# Clean up staging installation files locally
printf "\n[*] Purging staging font directories...\n"
rm -rf "$HOME/my_fonts"

# Render Final English completion status box (เปลี่ยนเครดิตเป็น Open-Source)
TITLE="Typography Installation Success"
BACK_TITLE="System Action Required"
BODY_MSG="Dear $USER, your custom typography and Nerd-icons have been successfully optimized and integrated into Arch Linux.\n\nEngineered via Open-Source Collaboration & Winai AI."

clear
dialog --clear --title "$TITLE" --backtitle "$BACK_TITLE" --msgbox "$BODY_MSG" 12 60
