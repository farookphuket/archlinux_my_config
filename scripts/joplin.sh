#!/bin/bash
# =============================================================================
#  Joplin Note-Taking & Markdown Workspace Setup
# =============================================================================
set -e

printf "\n[*] Deploying Joplin Note-Taking Application via AUR...\n"
yay -S --needed --noconfirm joplin-appimage

printf "[SUCCESS] Joplin Markdown environment is ready for operation.\n"
