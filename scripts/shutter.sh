#!/bin/bash
set -e

printf "\n[*] Extracting Shutter Capture Tool from Snap Isolated Containment...\n"
# Ensure snap core layout is initialized safely
sudo snap install shutter

printf "[SUCCESS] Shutter deployment completed seamlessly.\n"
