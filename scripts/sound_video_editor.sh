#!/bin/bash
# =============================================================================
#  Audio, Video Production & Subtitle Editors Stack
# =============================================================================
set -e

printf "\n[*] Deploying Production Studios and Audio/Video Editors...\n"
# audacity: โปรแกรมอัดและแก้ไขคลื่นเสียงประสิทธิภาพสูง (รองรับไฟล์ใหญ่)
# audacious: ตัวเล่นและทดสอบไฟล์เสียงแกนหลัก
# mixxx: โปรแกรม DJ ผสมเสียงและจัดรายการวิทยุ
# aegisub: สุดยอดโปรแกรมจัดการและเขียนซับไตเติลวิดีโอ
# handbrake: ทูลแปลงไฟล์และบีบอัดวิดีโอสากล
sudo pacman -S --needed --noconfirm \
    audacity \
    audacious \
    mixxx \
    aegisub \
    handbrake

printf "[SUCCESS] Post-production audio and video suites are ready.\n"
