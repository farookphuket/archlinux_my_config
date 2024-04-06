#!/bin/bash

# this will copy the file to the specifig folder 


TODAY=$(date +"%Y-%m-%d_at_%H:%M:%S")
USER_NAME=$USER



# make backup dir
mkdir -p ~/Documents/Old_config
BACKUP_DIR=~/Documents/Old_config
BACKUP_PATH=$BACKUP_DIR
target_dir=~/archlinux_my_config/SETUP_LAMP_SERVER/files_inc



# if hosts file will make a backup
if [[ -f /etc/hosts ]]; then
    sudo cp /etc/hosts $BACKUP_PATH/hosts.old_$TODAY
    sudo mv /etc/hosts /etc/hosts.old
fi
sudo cp $target_dir/hosts /etc/



sudo cp $target_dir/phpmyadmin.conf /etc/httpd/conf/extra/


if [[ -f /etc/httpd/conf/httpd.conf ]]; then
    sudo cp /etc/httpd/conf/httpd.conf $BACKUP_PATH/httpd.conf.old_$TODAY
    sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.old
fi
sudo cp $target_dir/httpd.conf /etc/httpd/conf/


# ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPxSMzKtJNurBvohyodxooHMB+ghQHzSoSlYd+z7alrO farookphuket@gmail.com

if [[ -f /etc/php/php.ini ]]; then
    sudo cp /etc/php/php.ini $BACKUP_PATH/php.ini.old_$TODAY
    sudo mv /etc/php/php.ini /etc/php/php.ini.old
fi
sudo cp $target_dir/php.ini /etc/php/


# copy v-host
vh_file=/etc/httpd/conf/extra/httpd-vhosts.conf

if [[ -f "$vh_file" ]]; then
    # backup the vhosts file
    sudo cp /etc/httpd/conf/extra/httpd-vhosts.conf $BACKUP_PATH/httpd-vhosts.conf.old_$TODAY
    sudo mv /etc/httpd/conf/extra/httpd-vhosts.conf /etc/httpd/conf/extra/httpd-vhosts.conf.old
fi
sudo cp $target_dir/httpd-vhosts.conf /etc/httpd/conf/extra/










