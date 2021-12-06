#!/bin/bash 


# run script dir 

run_script_dir=~/archlinux_my_config/scripts


# return error message
error() { \
    clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

# ============== install the need program START ===============================


sudo pacman --noconfirm --needed -Sy dialog git || error "Error syncing the repos."



welcome() { \
    dialog --colors --title "\Z0 Installing script archlinux_my_config!" --msgbox "\Z4This is a script that will install what I sarcastically call archlinux_my_config .  It's really just an installation script for those that want to try out my . dot file  this script will only make it for arch linux which will use DWM window manager \\n\\n-Farook " 16 60

    dialog --colors --title "please stay near your computer!" --yes-label "Continue" --no-label "Exit" --yesno "\Z4This script is not allowed to be run as root, but you will be asked to enter your sudo password at various points during this installation. This is to give PACMAN the necessary permissions to install the software.  So stay near the computer.
    \\nThis script will be need 3 hours to run it is really depending up on your internet speed." 14 60
}

welcome || error "User choose to exit."




sudo pacman -Syyu --disable-download-timeout


# ============= setup yay 
sh $run_script_dir/yay.sh


# ========================= Shutter ===========================================
# shutter is the screen capture ,
# shutter will not working if install using pacman 
# last edit 30 Oct 2021
# setup snap  
sh $run_script_dir/snapd.sh 


sh $run_script_dir/call_script.sh

# =============================================================================
# ============== install the need program END =================================

# ============== copy config file START ======================================= 
tar_dir=~/archlinux_my_config/CONFIG_FILES
config_des_dir=~/.config


# ====== copy vim,neovim,tmux,ranger,powerline config 
cp -r $tar_dir/VIM_MONOKAI_THEME/.vim ~/ 
cp -r $tar_dir/ranger/ ~/.config/ 
cp -r $tar_dir/powerline/ ~/.config/
cp -r $tar_dir/nvim/ ~/.config/

cp $tar_dir/VIM_MONOKAI_THEME/.vimrc ~/
cp $tar_dir/.bashrc ~/
cp $tar_dir/.tmux.conf ~/
cp $tar_dir/.Xresources ~/



# using flag --disable-download-timeout will help in case of slow connection 
sudo pacman -Syyu --disable-download-timeout










# ====== copy zsh config
pushd ~/

git clone https://gitlab.com/farookphuket/my_zsh.git 

# run the script from ~/my_zsh where just has clone
sh ~/my_zsh/setup.sh


popd




sleep 5s

# ============== copy config file END ========================================= 

fn_goodbye(){
    dialog --colors \
        --title "Operation done!" \
        --msgbox "\Z4The operation has been done! 
            \\nThe change will take an effect in the next boot." \
                16 60
    
}

fn_goodbye

