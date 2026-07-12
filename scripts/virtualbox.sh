#!/bin/bash
# =============================================================================
#  Oracle VirtualBox Subsystem Configuration
# =============================================================================
set -e

printf "\n[*] Syncing VirtualBox Hypervisor and Active Linux Headers...\n"
sudo pacman -S --needed --noconfirm virtualbox linux-headers

printf "\n[*] Registering VirtualBox Kernel Driver Modules...\n"
# สั่งลงทะเบียนเพื่อให้ระบบทำการโหลดโมดูล 'vboxdrv' อัตโนมัติในระดับแกนกลาง
sudo systemctl enable --now vboxdrv.service || true

printf "[SUCCESS] VirtualBox Virtualization environment configured.\n"
