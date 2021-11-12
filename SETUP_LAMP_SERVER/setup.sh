#!/bin/bash 



echo "-------------setup lamp server for Manjaro --------"
echo "this will install the require package "
echo "please enter your password "
run_dir=~/arcolinux_my_config/SETUP_LAMP_SERVER 

sh $run_dir/install_app.sh 
sh $run_dir/install_dbeaver.sh

sh $run_dir/fileman.sh

echo "-----The require package has installed "
sleep 5s 

echo "----- this will setup Database ---------------"
sh $run_dir/setup_mysql.sh 

echo "--------------SUCCESS --------------------------"
echo "----- database has been install and config -----"

firefox -- http://lav8.x1 &

firefox -- http://localhost/phpmyadmin &
