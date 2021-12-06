#!/bin/bash 



vim_dir=~/.vim 
vim_rc=~/.vimrc

target_dir=~/ 
source_dir=~/archlinux_my_config/CONFIG_FILES/VIM_MONOKAI_THEME/

if [ -f "$vim_rc" ] ; then
    mv $vim_rc ~/Documents/.vimrc_old
fi

if [ -d "$vim_dir" ] ; then
    mv $vim_dir ~/Documents/.vim_old
fi

cp -r $source_dir/.vim $target_dir
cp $source_dir/.vimrc $target_dir


function goodbye(){
    
b_title="\Z4 Success!"
title="\Z0 Dear $USER the copy has success"
msgbox="operation has completed!!"

    dialog --colors \
        --backtitle "$b_title" \
        --title "$title" \
        --msgbox "$msgbox" \
        14 60
}

goodbye
