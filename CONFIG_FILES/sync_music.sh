#!/bin/bash
# ==============================================================
#  sync-music.sh — Sync ~/Music to external HDD (XDATA)
#  --------------------------------------------------------------
#  Automatically detects the HDD by label, mounts if needed,
#  then rsyncs music with --delete to keep both sides in sync.
#
#  Requires: bash, rsync, udisks2, util-linux (lsblk, mountpoint)
#  Tested on: Linux (Arch/Fedora/Ubuntu)
#
#  Last update: 2026-10-02
#  Written with assistance from DeepSeek AI
#  ALL Thanks to DEEPSEEK AI
# ==============================================================
set -euo pipefail
trap 'echo "--- ❌ Script ล้มเหลวที่บรรทัด $LINENO --- "' ERR
trap 'echo; echo "--- ⛔ ยกเลิกโดยผู้ใช้ ---"; exit 130' INT

LABEL="XDATA"

SRC="$HOME/Music/"
MOUNT_POINT="/run/media/$USER/$LABEL"
DEST="$MOUNT_POINT/MEDIA/Music/"

# ---- ตรวจสอบเบื้องต้น ----
if [ ! -d "$SRC" ]; then
    echo "❌ ไม่พบโฟลเดอร์ต้นทาง: $SRC"
    exit 1
fi

echo "=========== Sync music to External disk ======"

# 1) หา device จาก label
DEVICE=$(lsblk -rno NAME,LABEL | awk -v lbl="$LABEL" '$2==lbl {print "/dev/"$1; exit}')

if [ -z "${DEVICE:-}" ]; then
    echo "❌ ไม่พบ HDD ที่มี label '$LABEL' ในระบบ"
    echo "   ตรวจสอบด้วย: lsblk -o NAME,LABEL"
    exit 1
fi

echo "=================================="
echo "    📀 พบ device: $DEVICE"
echo "=================================="

# 2) ถ้ายังไม่ mount → mount อัตโนมัติ
if ! mountpoint -q "$MOUNT_POINT"; then
    echo "⚠️  ยังไม่ mount → กำลัง mount $DEVICE ..."
    if ! udisksctl mount -b "$DEVICE"; then
        echo "❌ mount ไม่สำเร็จ"
        exit 1
    fi
    sleep 1
fi

# 3) ตรวจซ้ำว่า mount จริงหลังพยายาม
if ! mountpoint -q "$MOUNT_POINT"; then
    echo "❌ ยัง mount ไม่ได้อยู่ดี — ยกเลิก"
    exit 1
fi

# 4) ตรวจว่าโฟลเดอร์ปลายทางมีอยู่จริง
if [ ! -d "$DEST" ]; then
    echo "❌ ไม่พบโฟลเดอร์ปลายทาง: $DEST"
    exit 1
fi

# 5) เช็คพื้นที่ว่างก่อน sync
echo "🔍 กำลังตรวจสอบพื้นที่ว่าง ..."
AVAIL=$(df --output=avail "$MOUNT_POINT" | tail -1)
NEED=$(du -sb "$SRC" | awk '{print $1}')

AVAIL_MB=$((AVAIL / 1024))
NEED_MB=$((NEED / 1024 / 1024))

if [ "$NEED" -gt "$AVAIL" ]; then
    echo "⚠️  พื้นที่ปลายทางอาจไม่พอ!"
    echo "   ต้องการ : ${NEED_MB} MB"
    echo "   มีอยู่   : ${AVAIL_MB} MB"
    read -rp "ดำเนินการต่อ? [y/N] " ans
    [[ "$ans" =~ ^[Yy]$ ]] || { echo "ยกเลิก"; exit 0; }
else
    echo "   ✅ พื้นที่พอ (ต้องการ ${NEED_MB} MB / มี ${AVAIL_MB} MB)"
fi

# 6) sync
echo "===========  🚀 เริ่ม sync ... =========="
rsync -avh --delete --info=progress2 "$SRC" "$DEST"
echo "✅ Sync เสร็จ"
