#!/bin/bash
# =============================================================================
#  Web Development API Platforms (Postman Container)
# =============================================================================
set -e

printf "\n[*] Fetching Postman API Development Client Suite via AUR...\n"
# postman-bin: ตัวแอปพลิเคชัน Postman ตัวเต็มเวอร์ชันตรงสเปกเสถียร
yay -S --needed --noconfirm postman-bin

printf "[SUCCESS] Postman API client workspace integrated.\n"
