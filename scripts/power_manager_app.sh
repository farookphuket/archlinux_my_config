#!/bin/bash

# Stop script on error
set -e

printf "\n[*] Deploying Power Management Tools ...\n"

# -----------------------------------------------------------------------------
# 1. Install & Configure TLP (System-level Power Management)
# -----------------------------------------------------------------------------
echo "[+] Installing TLP..."
sudo pacman -S --needed --noconfirm tlp tlp-rdw

echo "[+] Configuring TLP Services..."
sudo systemctl enable tlp.service
# Mask rfkill to avoid conflict with TLP's radio device switching
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket


# -----------------------------------------------------------------------------
# 2. Install & Configure auto-cpufreq (CPU Governor Optimization)
# -----------------------------------------------------------------------------
echo "[+] Installing auto-cpufreq via AUR..."

# Prevent running yay as root directly
if [ "$EUID" -eq 0 ]; then
    echo "[!] Warning: Do not run yay as root. Please run this script as a normal user with sudo privileges."
    exit 1
fi

# Install auto-cpufreq if not already installed
if ! command -v auto-cpufreq &> /dev/null; then
    yay -S --needed --noconfirm auto-cpufreq
fi

echo "[+] Enabling auto-cpufreq service..."
sudo systemctl enable --now auto-cpufreq


# -----------------------------------------------------------------------------
# 3. Install XFCE Power Manager (GUI Screen/Display Power Management)
# -----------------------------------------------------------------------------
echo "[+] Installing xfce4-power-manager..."
sudo pacman -S --needed --noconfirm xfce4-power-manager

printf "\n[✓] Power Manager Deployment Completed Successfully!\n\n"
