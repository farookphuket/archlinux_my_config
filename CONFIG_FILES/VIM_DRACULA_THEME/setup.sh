#!/bin/bash 


# move the old config file 
old_vimrc=~/.vimrc
old_vimdir=~/.vim

cp_file=~/archlinux_my_config/CONFIG_FILES/VIM_DRACULA_THEME/

if [ -f  "$old_vimrc" ]; then
    mv $old_vimrc ~/Documents/.vimrc_old
fi

if [ -d "$old_vimdir" ]; then
    mv $old_vimdir ~/Documents/.vim_old
fi

cp -r $cp_file/.vim ~/ 
cp $cp_file/.vimrc ~/


function goodbye(){
    
b_title="\Z4 Success!"
title="\Z0 Dear $USER the copy has success"
msgbox="vim Dracula theme copy operation has completed!!"

    dialog --colors \
        --backtitle "$b_title" \
        --title "$title" \
        --msgbox "$msgbox" \
        14 60
}

goodbye
