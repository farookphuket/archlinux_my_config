#!/bin/bash
# =============================================================================
#  Pinta Simple Image Editor Deployment (via Snap Isolation)
# =============================================================================
set -e

printf "\n[*] Deploying Pinta Simple Image Editor via Snap Sandbox Layer...\n"
sudo snap install pinta

printf "[SUCCESS] Pinta Image Manipulation workspace enabled.\n"
