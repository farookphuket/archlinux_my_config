#!/bin/bash

echo "--- Run SETUP script -----"

cur_date=$(date +"%d-%m-%Y_%H:%M:%S_%A")

## expecting to run script in user home folder
cur_dir=~/setup_lamp_server

if [ -d "$cur_dir" ]; then
  ## found the folder 'setup_lamp_server' in home folder will
  ## rename it
  mv $cur_dir $cur_dir".old_"$cur_date
fi

# -- create the folder to run script
mkdir -p ~/setup_lamp_server

# -- copy the file from current folder to use later
cp -r . ~/setup_lamp_server

# -- run the setup file to expecting install the script
sh ~/setup_lamp_server/setup.sh

echo "---- Script RUN END ---- $PWD"
