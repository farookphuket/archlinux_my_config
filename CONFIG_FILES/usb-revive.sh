#!/bin/sh
case "$1" in
  post)
    # ให้เวลา Kernel / USB Hub ตั้งหลักเล็กน้อยหลังตื่นจาก Sleep
    sleep 1
    
    # Reset บัส USB อย่างปลอดภัย
    for f in /sys/bus/usb/devices/*/authorized; do
      if [ -w "$f" ]; then
        echo 0 > "$f" 2>/dev/null
        sleep 0.2
        echo 1 > "$f" 2>/dev/null
      fi
    done
    ;;
esac
exit 0
