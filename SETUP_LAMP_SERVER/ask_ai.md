# please edit my bash script ----------
> ช่วยแก้ไขไฟล์พวกนี้ให้ผมหน่อย ขอ code แบบแยกเป็นไฟล์เหมือนเดิมนะครับ 


file setup.sh 

~~~

#!/bin/bash

echo "-------------setup lamp server for Manjaro --------"

echo "this will install the require package "

echo "please enter your password "

echo " --------------------------------------------------"
run_dir=~/setup_lamp_server

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

~~~

---

file RUN_ME.sh 

~~~

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

~~~

--- 
fileman.sh 

~~~

#!/bin/bash

# this will copy the file to the specifig folder

TODAY=$(date +"%Y-%m-%d_at_%H:%M:%S")
USER_NAME=$USER

# make backup dir
mkdir -p ~/Documents/Old_config
BACKUP_DIR=~/Documents/Old_config
BACKUP_PATH=$BACKUP_DIR
target_dir=~/setup_lamp_server/files_inc

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

~~~

---
install_app.sh 

~~~

#!/bin/bash 

sudo pacman -Syyu --disable-download-timeout

# install code editor package
# sudo pacman -S --needed code atom tmux powerline  --noconfirm
sudo pacman -S --needed gvim neovim python-pynvim  tree --noconfirm

sudo pacman -Sy --needed php-intl  --noconfirm 

sudo pacman -S  --needed --noconfirm apache php php-apache php-sqlite filezilla composer 
sudo pacman -S  sqlitebrowser --needed --noconfirm
sudo pacman -S  nodejs npm --needed --noconfirm




~~~
---
install_dbeaver.sh 
~~~

#!/bin/bash

echo "================ Installing DBeaver ====================================="
echo " install java runtime for dbeaver if you see any Error message during "
echo "installation you may have to re-run this installer script again."
echo " "
echo "========================================================================="

sudo pacman -Syyu

# =========== you have to install java to using dbeaver =======================
sudo pacman -Syu --needed --noconfirm jre-openjdk dbeaver
~~~

---
setup_mysql.sh 

~~~

#!/bin/bash

# give the full path dir
FILES_DIR=~/setup_lamp_server/files_inc

sudo pacman -S mysql --needed --noconfirm

sleep 3s

sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

sudo systemctl enable mysqld
sudo systemctl start mysqld

sudo mysql_secure_installation

#     create new group call www-data
sudo groupadd www-data

#  set permission for current user to www-data
sudo usermod -a -G www-data $USER

#   create the dir for phpmyadmin in /var/lib
sudo mkdir -p /var/lib/phpmyadmin

#   change the permission to 777
sudo chmod 777 -R /var/lib/phpmyadmin

sudo pacman -S phpmyadmin --noconfirm
sleep 5s

#   copy the config file into /phpmyadmin
sudo cp $FILES_DIR/config.inc.php /etc/webapps/phpmyadmin

#   change the ownership for www-data
sudo chown -R $USER:www-data /etc/webapps/phpmyadmin

sudo chmod 775 -R /etc/webapps/phpmyadmin

echo "phpmyadmin installed and config "

#   we going to create new web project for the testing
#   the 2 lines will create new folder and 1 sub folder in lav8.x1
#mkdir /srv/http/lav8.x1
sudo mkdir -p /srv/http/lav8.x1/public
sudo mkdir -p /srv/http/article.me

sudo cp $FILES_DIR/index.php /srv/http/lav8.x1/public
sudo cp $FILES_DIR/index.html /srv/http/article.me

#   change permission to 777 (read,write,execute)
sudo chmod 777 -R /srv/http/lav8.x1
sudo chmod 777 -R /srv/http/article.me

echo "create folder lav8.x1 article.me in /srv/http "

#   enable apache service to run on start-up
sudo systemctl enable httpd

sleep 5s

sudo systemctl restart httpd
~~~
