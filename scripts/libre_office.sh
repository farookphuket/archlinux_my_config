#!/bin/bash
# =============================================================================
#  LibreOffice Office Productivity Workspace Deployment
# =============================================================================
set -e

printf "\n[*] Syncing LibreOffice (Still Stable Version) Core Binary Stack...\n"
sudo pacman -S --needed --noconfirm libreoffice-still

printf "[SUCCESS] LibreOffice productivity suite deployment complete.\n"
