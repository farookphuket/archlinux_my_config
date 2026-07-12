#!/bin/bash
# =============================================================================
#  Screen Recording & Dynamic Capturing Tools
# =============================================================================
set -e

printf "\n[*] Deploying Broadcasting and Capture Frameworks...\n"
# obs-studio: โปรแกรมอัดหน้าจอและสตรีมมิ่งระดับโปร
# spectacle: ทูลจับภาพหน้าจอกราฟิกประสิทธิภาพสูงของค่าย KDE
sudo pacman -S --needed --noconfirm obs-studio spectacle

printf "[SUCCESS] Screen recording and capturing toolchains deployed.\n"
