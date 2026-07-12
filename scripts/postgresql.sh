#!/bin/bash
set -e
printf "\n[*] Syncing PostgreSQL Database Engine...\n"
sudo pacman -S --needed --noconfirm postgresql

if [ ! -d "/var/lib/postgres/data/base" ]; then
    printf "\n[*] Formatting Local PostgreSQL Data Layout...\n"
    sudo -u postgres initdb --locale=en_US.UTF-8 -D '/var/lib/postgres/data'
else
    printf "\n[*] Existing data detected. Skipping initdb.\n"
fi

sudo systemctl enable --now postgresql.service
printf "[SUCCESS] PostgreSQL operational.\n"
