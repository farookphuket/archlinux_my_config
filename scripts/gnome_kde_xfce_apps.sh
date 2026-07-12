#!/bin/bash
# =============================================================================
#  Integrated Desktop Applications Suite (Clean & Tightly Snipped)
# =============================================================================
set -e

printf "\n[*] Deploying Selected Professional Desktop Applications...\n"

# [GNOME Selected] คัดเฉพาะทูลอำนวยความสะดวกที่จำเป็น ไร้ Terminal ขยะ
# polkit-gnome: ระบบถามรหัสผ่านกราฟิกเวลาเปิดแอป Root บน DWM
sudo pacman -S --needed --noconfirm \
    gedit \
    gnome-characters \
    gnome-tweaks \
    gthumb \
    polkit-gnome \
    simple-scan \
    soundconverter

# [KDE Selected] คัดเฉพาะโปรแกรมตัดต่อและจัดการดิสก์ระดับเทพ
# partitionmanager: คลีนและดูง่ายที่สุดบน GUI
# kdenlive: สุดยอดโปรแกรมตัดต่อวิดีโอ
sudo pacman -S --needed --noconfirm \
    kcalc \
    kdenlive \
    knotes \
    korganizer \
    partitionmanager

# [XFCE Selected] คัดระบบเบื้องหลังที่จำเป็นสำหรับรันคู่กับ DWM Bar
# xfce4-power-manager: ควบคุมการนอนหลับ/แบตเตอรี่ของโน้ตบุ๊กและพีซี
# xfce4-notifyd: ตัวจัดการแจ้งเตือน Pop-up มุมจอที่เบาที่สุด
sudo pacman -S --needed --noconfirm \
    xfce4-power-manager \
    xfce4-notifyd \
    xfce4-screensaver \
    parole

printf "[SUCCESS] Integrated Application suite deployed without bloatware.\n"
