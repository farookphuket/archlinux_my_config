#!/bin/bash

# =============================================================================
#  Post-Setup Application Pipeline Orchestrator
#  Refined Workflow: Run-All Suite Configuration
# =============================================================================
set -e

# Dynamically resolve script path safely
RUN_SCRIPT_DIR="$HOME/archlinux_my_config/scripts"

printf "\n[>>>] Pipeline Phase 1: Deploying Core Infrastructure Stack...\n"
sh "$RUN_SCRIPT_DIR/must_install.sh"
sh "$RUN_SCRIPT_DIR/bluetooth.sh"
sh "$RUN_SCRIPT_DIR/partition_file_tools.sh"

printf "\n[>>>] Pipeline Phase 2: Deploying Desktop Frameworks & Toolings...\n"
# คัดเฉพาะโครงสร้างหลักที่เบาหวิวและซิงค์คู่กับ DWM Window Manager
sh "$RUN_SCRIPT_DIR/gnome_kde_xfce_apps.sh"
sh "$RUN_SCRIPT_DIR/iso_image_writer.sh"
sh "$RUN_SCRIPT_DIR/media_player_app.sh"
sh "$RUN_SCRIPT_DIR/screen_capture.sh"
sh "$RUN_SCRIPT_DIR/applet.sh"

printf "\n[>>>] Pipeline Phase 3: Localization & Network Optimization...\n"
sh "$RUN_SCRIPT_DIR/font_install.sh"
sh "$RUN_SCRIPT_DIR/web_browser.sh"

printf "\n[>>>] Pipeline Phase 4: Deploying Advanced User & Development Applications...\n"
# กลุ่ม Code Editor และเครื่องมือสาย Web Development (Laravel Stack)
sh "$RUN_SCRIPT_DIR/code_editor.sh"
sh "$RUN_SCRIPT_DIR/postgresql.sh"           # 🎯 แทรกเข้าไลน์ท่อส่งหลังแยกไฟล์เรียบร้อย
sh "$RUN_SCRIPT_DIR/web_dev_tools.sh"        # Postman Client Tool
sh "$RUN_SCRIPT_DIR/yazi_cmd_file_manager.sh" # CLI File Manager ความเร็วสูง

printf "\n[>>>] Pipeline Phase 5: Deploying Productivity & Media Production Suites...\n"
# กลุ่มโปรแกรมสร้างสรรค์ผลงาน เอกสาร และระบบจำลอง OS
sh "$RUN_SCRIPT_DIR/download_tools.sh"        # Modern yt-dlp Engine
sh "$RUN_SCRIPT_DIR/gimp.sh"
sh "$RUN_SCRIPT_DIR/libre_office.sh"
sh "$RUN_SCRIPT_DIR/shutter.sh"
sh "$RUN_SCRIPT_DIR/virt-manager.sh"
sh "$RUN_SCRIPT_DIR/virtualbox.sh"
sh "$RUN_SCRIPT_DIR/sound_video_editor.sh"
sh "$RUN_SCRIPT_DIR/other_app.sh"            # อัปเดตใหม่: เหลือเฉพาะ Utility ทั่วไป
sh "$RUN_SCRIPT_DIR/media_production_utils.sh" # 🎯 ตัวรวมร่างใหม่ (แทน 4kslideshowmaker และ puddletag)
sh "$RUN_SCRIPT_DIR/joplin.sh"

# =============================================================================
#  Optional / Hardware Specific Pipeline Block (Uncomment to activate)
# =============================================================================
# sh "$RUN_SCRIPT_DIR/nvidia-driver.sh"       # เปิดใช้เฉพาะเครื่องที่มีการ์ดจอค่ายเขียว Nvidia 

printf "\n[SUCCESS] Master Application Pipeline Finished All-Execution Setup.\n"
