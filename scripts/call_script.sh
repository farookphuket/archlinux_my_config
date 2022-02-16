#!/bin/bash



# this script will call another script 


run_script_dir=~/archlinux_my_config/scripts

sh $run_script_dir/bluetooth.sh


# code editor 
sh $run_script_dir/code_editor.sh 


# download_tools.sh 
sh $run_script_dir/download_tools.sh 


#sh $run_script_dir/gimp.sh 

#sh $run_script_dir/gnome_app.sh 

sh $run_script_dir/iso_image_writer.sh 

#sh $run_script_dir/kde_app.sh 

sh $run_script_dir/libre_office.sh 

sh $run_script_dir/media_player_app.sh 

sh $run_script_dir/screen_capture.sh

#sh $run_script_dir/shutter.sh 

#sh $run_script_dir/virt-manager.sh 

#sh $run_script_dir/virtualbox.sh 

#sh $run_script_dir/xfce4_app.sh 

sh $run_script_dir/applet.sh

sh $run_script_dir/font_install.sh

sh $run_script_dir/sound_video_editor.sh

sh $run_script_dir/other_app.sh

sh $run_script_dir/web_browser.sh

# install puddletag on 09 Jan 2022
#sh $run_script_dir/puddletag.sh
