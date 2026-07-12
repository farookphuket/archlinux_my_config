#!/bin/bash
set -e

printf "\n[*] Deploying Core Utilities and Modern CLI replacements...\n"
sudo pacman -S --needed --noconfirm eza bat

printf "\n[*] Configuring Virtualization Layer & Docker Runtime Engines...\n"
sudo pacman -S --needed --noconfirm docker docker-compose docker-buildx

# Activate systemd hooks immediately
printf "\n[*] Bootstrapping Docker Systemd Daemons...\n"
sudo systemctl enable --now docker.service

# Inject current execution user context into security group policy
printf "\n[*] Injecting user privileges into runtime groups...\n"
sudo usermod -aG docker "$USER"

printf "\n[*] Deploying System Management Overlays via AUR...\n"
# Avoid standard hands-on confirmation checks
yay -S --noconfirm --needed rofi-power-menu

printf "[SUCCESS] System Infrastructure and Docker Layers configured.\n"
