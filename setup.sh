#!/bin/bash

# =============================================================================
#  Arch Linux My Config - Post-Installation Suite
#  Refined Framework: Open-Source Infrastructure Setup
# =============================================================================

# Strict Mode: Stop executing if any pipeline or command returns an error
set -e

# Core Variables
RUN_SCRIPT_DIR="$HOME/archlinux_my_config/scripts"
TAR_DIR="$HOME/archlinux_my_config/CONFIG_FILES"
CONFIG_DES_DIR="$HOME/.config"

# Clean Error Handler
error() {
    clear
    printf "\n [!] ERROR: %s\n\n" "$1" >&2
    exit 1
}

# Ensure dialog is ready before building welcome window
sudo pacman -S --needed --noconfirm dialog || error "Failed to sync core components."

# ==================== 1. PRE-INSTALLATION DIALOGS ====================

welcome_screen() {
    # 📝 เอาชื่อเครดิตเดิมออก เปลี่ยนเป็นระบุตัวตนผู้ใช้ปัจจุบัน ($USER)
    dialog --colors --title " Installing Configuration Suite for user: $USER " \
        --msgbox "This suite will deploy optimized applications, core toolings, and dotfiles to achieve a clean Arch + DWM setup.\n\n- Credits: Shared Community & Winai AI Companion" 12 65

    dialog --colors --title " Sudo Elevation Notice " \
        --yes-label "Proceed" --no-label "Cancel" \
        --yesno "You will be prompted for your sudo password once. The script will maintain privileges automatically throughout the process.\n\nEstimated deployment time: 1-3 hours (depending on network bandwidth)." 14 65
}

welcome_screen || error "Deployment cancelled by user selection."

# Trigger early sudo validation
printf "\n[*] Please authenticate to start the background privilege maintainer:\n"
sudo -v || error "Authentication failed."

# Maintain sudo privilege token in background dynamically
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ==================== 2. SYSTEM REPO REFRESH ====================

printf "\n[*] Updating system package databases and core packages...\n"
sudo pacman -Syu --noconfirm --needed --disable-download-timeout || error "System update failed."

# ==================== 3. AUR & THIRD-PARTY TOOLS ====================

printf "\n[*] Initiating AUR Package Manager Setup (yay)...\n"
if [ -f "$RUN_SCRIPT_DIR/yay.sh" ]; then
    sh "$RUN_SCRIPT_DIR/yay.sh" || error "yay helper installation crashed."
fi

printf "\n[*] Setting up Snap Daemon for isolated application execution...\n"
if [ -f "$RUN_SCRIPT_DIR/snapd.sh" ]; then
    sh "$RUN_SCRIPT_DIR/snapd.sh" || error "snapd installation crashed."
fi

printf "\n[*] Spawning main application stack installer pipeline...\n"
if [ -f "$RUN_SCRIPT_DIR/call_script.sh" ]; then
    sh "$RUN_SCRIPT_DIR/call_script.sh" || error "App pipeline execution encountered critical failure."
fi

# ==================== 4. CONFIGURATION DEPLOYMENT ====================

printf "\n[*] Mirroring localized config bundles and environmental dotfiles...\n"
mkdir -p "$CONFIG_DES_DIR"

# Safe replication of key application data
[ -d "$TAR_DIR/VIM/.vim" ]   && cp -r "$TAR_DIR/VIM/.vim" "$HOME/"
[ -d "$TAR_DIR/ranger" ]     && cp -r "$TAR_DIR/ranger/" "$CONFIG_DES_DIR/"
[ -d "$TAR_DIR/powerline" ]  && cp -r "$TAR_DIR/powerline/" "$CONFIG_DES_DIR/"
[ -d "$TAR_DIR/.config/nvim" ] && cp -r "$TAR_DIR/.config/nvim" "$CONFIG_DES_DIR/"
[ -d "$TAR_DIR/.config/kitty" ] && cp -r "$TAR_DIR/.config/kitty" "$CONFIG_DES_DIR/"

# Copy runtime config variables
[ -f "$TAR_DIR/VIM/.vimrc" ]  && cp "$TAR_DIR/VIM/.vimrc" "$HOME/"
[ -f "$TAR_DIR/.bashrc" ]     && cp "$TAR_DIR/.bashrc" "$HOME/"
[ -f "$TAR_DIR/.tmux.conf" ]  && cp "$TAR_DIR/.tmux.conf" "$HOME/"
[ -f "$TAR_DIR/.Xresources" ] && cp "$TAR_DIR/.Xresources" "$HOME/"

# ==================== 5. HARDWARE LAYER OPTIMIZATION ====================

printf "\n[*] Applying Hardware Layer Configuration (Touchpad & Display Sync)...\n"

if [ -f "$TAR_DIR/30-touchpad.conf" ]; then
    sudo cp "$TAR_DIR/30-touchpad.conf" /etc/X11/xorg.conf.d/
fi

if [ -f "$TAR_DIR/psmouse.conf" ]; then
    sudo cp "$TAR_DIR/psmouse.conf" /etc/modprobe.d/
fi

# ==================== 6. SHELL ENVIRONMENT ENHANCEMENT ====================

printf "\n[*] Deploying Custom Zsh Framework Stack...\n"
cd "$HOME"

if [ -d "$HOME/my_zsh" ]; then
    rm -rf "$HOME/my_zsh"
fi

git clone https://gitlab.com/farookphuket/my_zsh.git
if [ -f "$HOME/my_zsh/setup.sh" ]; then
    sh "$HOME/my_zsh/setup.sh" || error "Zsh customized initialization failed."
fi

# ==================== 7. DEPLOYMENT COMPLETED ====================

clear
printf "=======================================================\n"
printf "  SUCCESS: Deployment completed flawlessly!\n"
printf "=======================================================\n"
printf " All core dotfiles, software stacks, and localized toolings\n"
printf " have been systematically engineered to match the system.\n\n"
printf " -> Please reboot your Arch Linux system to apply rules.\n"
printf "=======================================================\n"
