#!/bin/bash
# =============================================================================
#  Yazi Engine & High-Performance CLI File Previews Stack
# =============================================================================
set -e

printf "\n[*] Deploying Yazi File Manager and accompanying media previewers...\n"
sudo pacman -S --needed --noconfirm \
    yazi \
    ffmpegthumbnailer \
    p7zip \
    jq \
    poppler \
    fd \
    ripgrep \
    fzf \
    zoxide \
    imagemagick

printf "[SUCCESS] Yazi High-speed Command-Line File System deployed.\n"
