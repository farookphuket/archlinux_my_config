#!/bin/bash 


echo " ============== Change your vim config ================================"
echo " "
echo "  vimrc by farook 2022  this will change your vim setting "
echo " "
echo " ======================================================================"

sleep 5s


mkdir -p ~/Documents/Old_VIM_Config

backup_folder=~/Documents/Old_VIM_Config/
co_from=~/archlinux_my_config/CONFIG_FILES/VIM2022

# move the old config to the backup target folder
old_vimrc=~/.vimrc
old_vimdir=~/.vim 

if [ -f  "$old_vimrc" ]; then
    #mv $old_vimrc ~/Documents/.vimrc_old
    mv -f ~/.vimrc $backup_folder
    echo " backup your old vimrc to $backup_folder "
    sleep 5s
fi

if [ -d "$old_vimdir" ]; then
    #mv $old_vimdir ~/Documents/.vim_old
    # delete the old backup if exit 
    if [ -d "$backup_folder/.vim" ]; then 
        rm -rf $backup_folder/.vim 
    fi
    mv  ~/.vim $backup_folder 

    echo "backup your old .vim config to $backup_folder "
    sleep 5s
fi



sleep 5s

# copy the new config file
cp -r $co_from/.vim ~/
cp $co_from/.vimrc ~/


echo " =============== this will make a change for your vim config ==========="
echo " your old config will be move to ~/Documents/Old_VIM_Config "
echo " if you do not like this config you can just delete ~/.vimrc and ~/.vim "
echo " then copy your old config back ,that's it!!"
echo " the last step you have to do is open your vim then type :PlugInstall"
echo " hit enter and that's it baby!!!"
echo " enjoy!!!"
echo " "
echo " ======================================================================="


sleep 15s

exit
