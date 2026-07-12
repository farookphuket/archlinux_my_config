#!/bin/bash
# =============================================================================
#  QEMU/KVM & Virt-Manager Virtualization Engine
# =============================================================================
set -e

CONFIG_FILE_DIR="$HOME/archlinux_my_config/CONFIG_FILES"

printf "\n[*] Deploying QEMU/KVM Virtualization Core Packages...\n"
sudo pacman -S --needed --noconfirm \
    dmidecode edk2-ovmf virt-manager qemu-desktop \
    vde2 ebtables dnsmasq bridge-utils openbsd-netcat

printf "\n[*] Configuring UEFI/OVMF Firmware Paths for QEMU...\n"
sudo mkdir -p /etc/qemu
if [ -f "/usr/share/qemu/firmware/60-edk2-ovmf-x86_64.json" ]; then
    sudo cp /usr/share/qemu/firmware/60-edk2-ovmf-x86_64.json /etc/qemu/
fi

printf "\n[*] Injecting Virtualization Group Privileges to user context...\n"
# ผูกสิทธิ์ให้ user ปัจจุบันมีสิทธิ์สั่งงาน Engine เสมือนโดยตรง
sudo usermod -aG libvirt,kvm "$USER"

printf "\n[*] Injecting Virtual Bridge Network Templates...\n"
if [ -d "$CONFIG_FILE_DIR/networks" ]; then
    sudo mkdir -p /usr/share/libvirt/networks
    sudo cp -r "$CONFIG_FILE_DIR/networks/". /usr/share/libvirt/networks/
fi

printf "\n[*] Optimizing Active Virtualization Core Services...\n"
# บูตระบบจัดการ Engine ทันที
sudo systemctl enable --now libvirtd.service

# ดักจับเวลาหน่วงเพื่อให้ socket พร้อมก่อนสั่งงาน virsh
sleep 2

# ตรวจสอบและลงทะเบียนโครงข่ายเน็ตเวิร์กเริ่มต้นแบบเงียบ
if [ -f "/usr/share/libvirt/networks/default.xml" ]; then
    sudo virsh net-define /usr/share/libvirt/networks/default.xml || true
    sudo virsh net-start default || true
    sudo virsh net-autostart default || true
fi

# Render Notification Box (English text fallback)
TITLE="Virtualization Setup Complete"
BACK_TITLE="Action Required"
BODY_MSG="Dear $USER, the QEMU/KVM & Virt-Manager framework has been integrated successfully.\n\nCRITICAL: You MUST restart your machine to fully apply the security groups and access ISO directories."

clear
dialog --clear --title "$TITLE" --backtitle "$BACK_TITLE" --msgbox "$BODY_MSG" 12 60
