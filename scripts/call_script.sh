#!/bin/bash

# this script will call another script
# edit this file by add "#" infront of any propgramyou do not want to install

run_script_dir=~/archlinux_my_config/scripts

sh $run_script_dir/bluetooth.sh

# install stack for my-logout
# sh $run_script_dir/my-logout.sh

# code editor
# sh $run_script_dir/code_editor.sh

# partition tools and file system
sh $run_script_dir/partition_file_tools.sh

# download_tools.sh
# sh $run_script_dir/download_tools.sh

# gimp is a photo editor like photoshop
#sh $run_script_dir/gimp.sh

sh $run_script_dir/gnome_app.sh

sh $run_script_dir/iso_image_writer.sh

sh $run_script_dir/kde_app.sh

# the office suit program
# sh $run_script_dir/libre_office.sh

sh $run_script_dir/media_player_app.sh

# screen capture program
sh $run_script_dir/screen_capture.sh

#sh $run_script_dir/shutter.sh

#sh $run_script_dir/virt-manager.sh

#sh $run_script_dir/virtualbox.sh

sh $run_script_dir/xfce4_app.sh

# the taskbar icon
sh $run_script_dir/applet.sh

# setup font for better Thai(and other like Chinese) Language support
sh $run_script_dir/font_install.sh

#sh $run_script_dir/sound_video_editor.sh

# this script will install the other program
# sh $run_script_dir/other_app.sh

# photofilmstrip is has Error from python script
# 1 Mar 2022
# sh $run_script_dir/photofilmstrip.sh

# to make photo slideshow as video
# sh $run_script_dir/4kslideshowmaker.sh

# the web browser to install all web browser I use is take too much time
# remove # sign from the below line if you want to install
# sh $run_script_dir/web_browser.sh

# install the command line file manager "yazi"
# sh $run_script_dir/yazi_cmd_file_manager.sh

# install puddletag on 09 Jan 2022
#sh $run_script_dir/puddletag.sh

# nvidia driver for nvidia graphic card
#sh $run_script_dir/nvidia-driver.sh

# joplin is the note taking app
# that make mylife easier to create&preview markdown
# sh $run_script_dir/joplin.sh
