#!/bin/bash
# =============================================================================
#  Media Production Utilities Suite (Slideshows & Audio Tagging)
# =============================================================================
set -e

printf "\n[*] Deploying Audio Tag Editors and Slideshow Generators via AUR...\n"
# puddletag-git: เครื่องมือแก้ไข Meta-tag ของไฟล์เสียงที่พี่เรียกใช้ล่าสุด
# 4kslideshowmaker: โปรแกรมสร้างสไลด์โชว์ความละเอียดสูง
# photofilmstrip: เครื่องมือทำวิดีโอจากภาพถ่ายสไตล์ Ken Burns
yay -S --needed --noconfirm \
    puddletag-git \
    4kslideshowmaker \
    photofilmstrip

printf "[SUCCESS] Audio tagger and dynamic slideshow suites are fully active.\n"
